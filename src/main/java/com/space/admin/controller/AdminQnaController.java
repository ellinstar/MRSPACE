package com.space.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin/qna/**")
public class AdminQnaController {
	
	@RequestMapping(value="/list", method= RequestMethod.GET)
	public String qnaList() {
		log.info("문의게시판 관리 호출");
		return "/admin/board/qnabd";
	}

}
