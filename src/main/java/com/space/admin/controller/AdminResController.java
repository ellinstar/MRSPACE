package com.space.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.space.admin.page.Criteria;
import com.space.admin.page.PageDTO;
import com.space.admin.service.AdminResService;
import com.space.comp.vo.CompVO;
import com.space.mem.vo.MemVO;
import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin")
public class AdminResController {
	
	@Autowired
	public AdminResService adResServ;
	
	@RequestMapping(value="/reserv", method= RequestMethod.GET)
	public String resToday(@ModelAttribute ReservVO rvo, Model model, Criteria cri) {
		log.info("예약메인 호출 성공");
		List<CompVO> cpname = adResServ.optionCp();//select option 값 불러오기
		model.addAttribute("cp", cpname);
		
		List<ReservVO> resnew = adResServ.getNewList(cri);
		int total = adResServ.resCnt(cri);
		model.addAttribute("todayRes", resnew);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		List<ReservVO> cpres = adResServ.cpResList(cri);
		model.addAttribute("rescplist", cpres);
		model.addAttribute("data", rvo);
		return "/admin/reserv/reservmain";
	}
	
/*	@RequestMapping(value="/reserv", method= RequestMethod.POST)
	public String cpRes(@RequestParam("cp_Num") int cp_Num, Model model) {
		log.info("업체별 리스트 호출 성공");
		List<ReservVO> cpres = adResServ.cpResList(cp_Num);
		log.info("cp_Num:"+cp_Num);
		model.addAttribute("rescplist", cpres);
		return "redirect: /admin/reserv";
	}
	*/
	
	@RequestMapping(value="/reserv/detail", method= RequestMethod.GET)
	public String resDetail(@RequestParam("res_Num") int res_Num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("예약 detail호출 성공");
		ReservVO res = adResServ.resDetail(res_Num);
		MemVO mem = adResServ.resMem(res.getMem_Id());
		SpaceVO sp = adResServ.resSp(res.getSp_Num());
		model.addAttribute("res", res);
		model.addAttribute("mem", mem);
		model.addAttribute("sp", sp);
		return "/admin/reserv/resDetail";
	}

}
