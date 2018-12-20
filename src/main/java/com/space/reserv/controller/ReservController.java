package com.space.reserv.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.space.memlogin.vo.LoginVO;
import com.space.reserv.service.ReservService;
import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value = "/reserv")
@Log
public class ReservController {

	@Autowired
	private ReservService reservService;

	/*
	 * 예약 화면 출력ㅎ
	 */
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET)
	public String reserv(HttpSession session, Model model) {
		log.info("reserv.do get 호출");
		session.getAttribute("login");
		session.getAttribute("detail");
		return "reserv/reservation";
	}
	//재고 갯수
	@RequestMapping(value = "/restSpace.do")
	public void restSpace(@ModelAttribute ReservVO rvo, Model model) {
		log.info("restSpace호출 성공");
		int count = reservService.restSpace(rvo);
		rvo.setRestSpace(count);
		model.addAttribute("rest", rvo);
	}

	// 예약 실행
	@RequestMapping(value = "/reservation.do", method = RequestMethod.POST)
	public ModelAndView reservation(@ModelAttribute ReservVO rvo, HttpSession session) {
		log.info("reservation post 호출 성공");
		ModelAndView mav = new ModelAndView();
		LoginVO lvo = (LoginVO) session.getAttribute("login");

		if (lvo == null) {
			//로그인 안되있는상태
			mav.addObject("errCode", 1);
			mav.setViewName("mem/login");
			session.setAttribute("errCode", 1);
			return mav;
		} else {
			//로그인 상태
			int result = reservService.reservation(rvo);
			if (result == 1) {
				//예약 성공
				mav.addObject("errCode", 3);
				mav.setViewName("redirect: ");
				session.setAttribute("errCode", 3);
				session.setAttribute("reserv", rvo);
				return mav;
			} else if (result == 0) {
				//예약 실패
				mav.addObject("errCode", 2);
				mav.setViewName("redirect: common/commonDetail");
				session.setAttribute("errCode", 2);
				return mav;
			} else if (result == 3) {
				//개수 부족
				mav.addObject("errCode",4);
				mav.setViewName("redirect:");
				session.setAttribute("errCode", 4);
				return mav;
			}
		}
		return mav;
	}

}
