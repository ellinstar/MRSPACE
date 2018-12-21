package com.space.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.space.admin.page.Criteria;
import com.space.admin.service.AdminQnaService;
import com.space.qna.vo.QnaVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin/qna/**")
public class AdminQnaController {
	
	@Autowired
	public AdminQnaService adQnaServ;
	
	//글목록 구현
	@RequestMapping(value="/list", method= RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model, Criteria cri) {
		log.info("문의게시판 list 호출");
		List<QnaVO> qnalist = adQnaServ.qnaList(cri);
		model.addAttribute("qna", qnalist);
		return "/admin/board/qnabd";
	}

}
