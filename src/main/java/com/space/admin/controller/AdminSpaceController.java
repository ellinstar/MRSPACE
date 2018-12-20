package com.space.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.space.admin.service.AdminSpaceService;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin/space/**")
public class AdminSpaceController {
	
	@Autowired
	private AdminSpaceService adminSpaceServ;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String spaceList(@ModelAttribute SpaceVO svo, Model model, HttpServletRequest request) {
		log.info("spaceList호출");
		List<SpaceVO> adspaceList = adminSpaceServ.adspaceList(svo);
		model.addAttribute("adspaceList", adspaceList);
		return "/admin/space/spaceList";
	}
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String compDetail(@RequestParam("sp_Num") int sp_Num, Model model) {
		log.info("spaceDetail 호출 성공");
		System.out.println(sp_Num);
		SpaceVO detail = new SpaceVO();
		detail = adminSpaceServ.spaceDetail(sp_Num);
		model.addAttribute("detail", detail);
		return "/admin/space/spDetail";
	}
	//공간 등록 승인
	@RequestMapping(value="/ok",method=RequestMethod.GET)
	public void spOk(@RequestParam("sp_Num") int sp_Num, Model model) {
		log.info("spOk호출 성공");
		int result = adminSpaceServ.spOk(sp_Num);
		model.addAttribute("result", result);
	}
}
