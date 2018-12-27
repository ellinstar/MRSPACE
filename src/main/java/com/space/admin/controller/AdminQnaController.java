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
import com.space.admin.service.AdminQnaService;
import com.space.qna.service.QnaService;
import com.space.qna.vo.QnaRepVO;
import com.space.qna.vo.QnaVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin/qna/**")
public class AdminQnaController {
	
	@Autowired
	public AdminQnaService adQnaServ;
	
	@Autowired
	private QnaService qnaServ;
	
	//글목록 구현
	@RequestMapping(value="/list", method= RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model, Criteria cri) {
		log.info("문의게시판 list 호출");
		List<QnaVO> qnalist = adQnaServ.qnaList(cri);
		int total = adQnaServ.qnaCnt(cri);
		model.addAttribute("qna", qnalist);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/admin/board/qnabd";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String qnaGet(@RequestParam("qna_Num") int qna_Num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("문의게시판 상세보기 Get 호출");
		QnaVO detail = new QnaVO();
		detail= adQnaServ.getQna(qna_Num);
		QnaRepVO reply = new QnaRepVO();
		reply = adQnaServ.getRep(qna_Num);
		model.addAttribute("detail", detail);
		model.addAttribute("rep", reply);
		return "/admin/board/qnadetail";
	}
	//문의 댓글 달기
	@RequestMapping(value="/repInsert", method=RequestMethod.POST)
	public String repInsert(@ModelAttribute QnaRepVO qrvo, Model model, @ModelAttribute("cri") Criteria cri) {
		int result = adQnaServ.repInsert(qrvo);
		String url="";
		if(result == 1) url="/admin/qna/list";
		else {
			url="/admin/qna/detail?qna_Num="+qrvo.getQna_Num();
		}
		return "redirect : "+url;
	}
	@RequestMapping(value="/repUpdate", method=RequestMethod.POST)
	public String repUpdate(@ModelAttribute QnaRepVO qrvo, Model model, @ModelAttribute("cri") Criteria cri) {
		int result = adQnaServ.repUpdate(qrvo);
		String url="";
		if(result == 1) url="/admin/qna/list";
		else {
			url="/admin/qna/detail?qna_Num="+qrvo.getQna_Num();//수정 필요
		}
		return "redirect : "+url;
	}
	
	

}
