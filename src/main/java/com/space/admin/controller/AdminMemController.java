package com.space.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.space.admin.page.Criteria;
import com.space.admin.page.PageDTO;
import com.space.admin.service.AdminMemService;
import com.space.mem.vo.MemVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin")
public class AdminMemController {
	
	@Autowired
	private AdminMemService adminMemServ;
	
	/*
	 * 회원 리스트 구현
	 */
	@RequestMapping(value="/mem", method=RequestMethod.GET)
	public String memberList(@ModelAttribute MemVO mvo, Model model, Criteria cri) {
		List<MemVO> memList = adminMemServ.memList(cri);
		log.info("memList호출 = " + memList.size());
		int total = adminMemServ.memCount(cri);
		log.info("total:"+total);
		model.addAttribute("memList", memList);
		model.addAttribute("total", total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/admin/mem/memmain";
	}
	/*
	    * 회원 정보 확인
	    */
	   @RequestMapping(value="/memdetail", method=RequestMethod.GET)
	   public String memDetail(@ModelAttribute MemVO mvo, Model model) {
	      log.info("memDetail 호출 성공");
	      log.info("mem_id = " + mvo.getMem_Id());
	      
	      MemVO detail = new MemVO();
	      
	      detail = adminMemServ.memDetail(mvo);
	      
	      model.addAttribute("mem", detail);

	      return "/admin/mem/memdetail";
	   }

}
