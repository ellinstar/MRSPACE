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

import com.space.admin.service.AdminCompService;
import com.space.comp.vo.CompVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin/comp/**")
public class AdminCompController {
	
	@Autowired
	private AdminCompService adminCompServ;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String memberList(@ModelAttribute CompVO cvo, Model model, HttpServletRequest request) {
		log.info("compList호출");
		List<CompVO> compList = adminCompServ.compList(cvo);
		model.addAttribute("compList", compList);
		return "/admin/comp/compList";
	}
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String compDetail(@RequestParam("cp_Num") int cp_Num, Model model) {
		log.info("compDetail 호출 성공");
		CompVO detail = new CompVO();
		detail = adminCompServ.compDetail(cp_Num);
		model.addAttribute("detail", detail);
		return "/admin/comp/cpDetail";
	}
	
}
