package com.space.memlogin.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.space.mem.service.MemService;
import com.space.memlogin.service.MemLoginService;
import com.space.memlogin.vo.LoginVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/mem")
public class MemLoginController {
	@Autowired
	private MemLoginService loginService;

	/*
	 * 로그인 화면 출력ㅎ
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		log.info("login.do get 호출");
		return "mem/login";
	}

	/*
	 * 로그인 처리 메서드
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProc(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		
		log.info("login.do post 호출 성공");
		ModelAndView mav = new ModelAndView();
		String mem_Id = lvo.getMem_Id();
		int resultData = loginService.loginHistoryInsert(lvo);
		
		// 로그인 실패
		if (resultData == 1) {
			mav.addObject("errCode", 1);
			return "mem/login";
		} else {
			// 입력한 아이디 비밀번호 확인
			LoginVO loginCheckResult = loginService.loginSelect(lvo.getMem_Id(), lvo.getMem_Pw());
			System.out.println("id : " + lvo.getMem_Id());
			System.out.println("pw : " + lvo.getMem_Pw());
			LoginVO vo = loginService.loginHistorySelect(mem_Id);
			//log.info("최근 로그인 일시 : " + new SimpleDateFormat("YYYY-MM-dd").format(vo.getLastSuccessedLogin()));
			// 로그인 성공인지 확인
			if (loginCheckResult == null) {
				mav.addObject("errCode", 1);
				return "mem/login";
			}
			// 로그인 성공
			// 로그인 성공 시간 DB에 업데이트
			else {
				vo.setLastSuccessedLogin(new Date());
				loginService.loginHistoryUpdate(vo);
				session.setAttribute("login", loginCheckResult);
				String url="/";
				return "redirect: "+url;
			}

		}
	}

	// 로그아웃 처리 메소드

	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/mem/login.do";
	}

}
