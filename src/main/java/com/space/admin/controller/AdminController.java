package com.space.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.space.admin.service.AdminCompService;
import com.space.admin.service.AdminSpaceService;
import com.space.admin.service.NoticeService;
import com.space.admin.vo.NoticeVO;
import com.space.comp.vo.CompVO;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	public NoticeService ntService;
	@Autowired
	public AdminCompService adminCompServ;
	@Autowired
	private AdminSpaceService adminSpaceServ;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String adIndex(Model model) {
		log.info("관리자 메인화면");
		List<CompVO> cpNewList = adminCompServ.cpNewList();
		model.addAttribute("cpNewList", cpNewList);
		List<SpaceVO> spNewList = adminSpaceServ.spNewList();
		model.addAttribute("spNewList", spNewList);
		return "index2";
	}
	
	@RequestMapping(value="/board", method= RequestMethod.GET)
	public String adBoard(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("게시판 관리 호출");
		List<NoticeVO> ntMainList = ntService.ntMainList();
		model.addAttribute("ntMainList", ntMainList);
		return "/admin/board/bdmain";
	}
	@RequestMapping(value="/comp", method= RequestMethod.GET)
	public String adComp(@ModelAttribute CompVO cvo, Model model) {
		log.info("업체 관리호출");
		List<CompVO> compList = adminCompServ.cpMainList();
		List<SpaceVO> spaceList = adminSpaceServ.spMainList();
		model.addAttribute("cpMainList", compList);
		model.addAttribute("spaceList", spaceList);
		return "/admin/comp/compmain";
	}
	@RequestMapping(value="/qna", method= RequestMethod.GET)
	public String qnaList() {
		log.info("문의게시판 관리 호출");
		return "/admin/comp/compmain";
	}
}
