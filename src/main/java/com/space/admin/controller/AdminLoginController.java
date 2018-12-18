package com.space.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.space.admin.vo.AdminLoginVO;

import lombok.extern.java.Log;

@Log
@Controller
public class AdminLoginController {
	
	/*@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String Login(Model model) {
		log.info("로그인 화면");
		model.addAttribute("adminLoginVO", new AdminLoginVO());
		return "admin/log/login";
	}*/
	
	@RequestMapping(value="/adminlogin", method=RequestMethod.POST)
	public String loginSucces(@ModelAttribute("adminLoginVO") AdminLoginVO advo, HttpSession session) {
		log.info("로그인 처리 메서드 호출");
		log.info(advo.getAdminId()+"/"+advo.getAdminPw());
		String adminId = advo.getAdminId();
		String adminPw = advo.getAdminPw();
		String url = "";
		if(adminId.equals("admin") && adminPw.equals("admin")) {
			url="redirect: /admin";
			session.setAttribute("adminLog", adminId);
		}else {
			url="admin/log/login";
		}
		log.info(adminId+"/"+adminPw);
		return url;
	}
	
	// 로그아웃 처리 메소드

		@RequestMapping("/adminlogout")
		public String logout(HttpSession session, HttpServletRequest request) {
			session.invalidate();
			session = request.getSession(true);
			return "redirect: /";
		}
	
}
