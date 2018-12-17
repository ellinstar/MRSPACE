package com.space.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		log.info("메인컨트롤러 접속!!완료!!!!!!!!");
		return "index";
	}

}