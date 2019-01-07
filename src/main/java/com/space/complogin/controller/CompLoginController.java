package com.space.complogin.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.space.comp.vo.CompVO;
import com.space.complogin.service.CompLoginService;
import com.space.complogin.vo.CompLoginVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/comp")
public class CompLoginController {
	@Autowired
	private CompLoginService comploginService;

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
	public String loginProc(@ModelAttribute("CompLoginVO") CompLoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		log.info("login.do post 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		String cp_Id = lvo.getCp_Id();
		int resultData = comploginService.compLoginHistoryInsert(lvo);
		
		// 로그인 실패
		if (resultData == 1) {
			mav.addObject("errCode", 1);
			return "mem/login";
			
		} else {
			// 입력한 아이디 비밀번호 확인
			CompLoginVO loginCheckResult = comploginService.compLoginSelect(lvo.getCp_Id(), lvo.getCp_Pw());
			
			log.info("logincheckResult : "+loginCheckResult);
			
			CompLoginVO vo = comploginService.compLoginHistorySelect(cp_Id);
			log.info("비밀번호 확인!");
			// log.info("최근 로그인 일시 : " + new SimpleDateFormat("YYYY-MM-dd").format(vo.getLastSuccessedLogin()));
			// 로그인 성공인지 확인
			
			if (loginCheckResult == null) {
				mav.addObject("errCode", 1);
				
				return "mem/login";
			}
			// 로그인 성공
			// 로그인 성공 시간 DB에 업데이트
			else {
				CompVO ccvo = new CompVO();
				
				ccvo = comploginService.comp(loginCheckResult.getCp_Id());
				
				session.setAttribute("comp2", ccvo);
				
				vo.setLastSuccessedLogin(new Date());
				comploginService.compLoginHistoryUpdate(vo);
				session.setAttribute("cp_Id", loginCheckResult.getCp_Id());
	            session.setAttribute("cp_Num", loginCheckResult.getCp_Num());
	            session.setAttribute("cp_Name", loginCheckResult.getCp_Name());
	            
	            
				session.setMaxInactiveInterval(-1);
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
