package com.space.common.util;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/common")
public class JoinController {
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joincommon() {
		log.info("회원가입(회원/업체) 선택");
		return "common/join";
	}
}
