package com.space.comp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.space.comp.service.CompService;
import com.space.comp.vo.CompVO;
import com.space.mem.vo.MemVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/comp")
public class CompController {

	@Autowired
	private CompService compService;

	// 페이지 이동 시작
	// --------------------------------------------------------------------------------------

	// 회원 가입 신청
	@RequestMapping(value = "/compJoin.do", method = RequestMethod.GET)
	public String compJoinForm(Model model) {
		log.info("compJoin.do get 방식에 의한 메소드 호출 성공");
		return "comp/compJoin";
	}

	// 가입신청 완료 - 테스트 끝나면 POST로 바꿀것
	@RequestMapping(value = "/compJoinSuc.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String compJoinSuc(Model model) {
		log.info("compJoinSuc.do post 방식에 의한 메소드 호출 성공");
		return "comp/compJoinSuc";
	}

	// 공간관리 - 테스트 끝나면 POST로 바꿀것
	@RequestMapping(value = "/compPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String compPage(Model model) {
		log.info("compJoinSuc.do post 방식에 의한 메소드 호출 성공");
		return "comp/compPage";
	}

	// 회원가입 약관동의 get
	@RequestMapping(value = "/compClause.do", method = RequestMethod.GET)
	public String compTest(Model model) {
		log.info("compClause.do get 방식에 의한 메소드 호출 성공");
		return "comp/compClause";
	}

	// 신청완료 -> 메인페이지 get? post?
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String compMain(Model model) {
		log.info("가입신청완료하고 메인페이지로 이동 get 방식에 의한 메소드 호출 성공");
		return "index";
	}

	// 공간 목록 get? post?
	@RequestMapping(value = "/spaceList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String spaceList(Model model) {
		log.info("spaceList.do get 방식에 의한 메소드 호출 성공");
		return "space/spaceList";
	}

	// 예약 현황 get? post?
	@RequestMapping(value = "/reservBoard.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String reservBoard(Model model) {
		log.info("reservBoard.do get 방식에 의한 메소드 호출 성공");
		return "reserv/reservBoard";
	}

	// 통계 get? post?
	@RequestMapping(value = "/compGraph.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String compGraph(Model model) {
		log.info("compGraph.do get 방식에 의한 메소드 호출 성공");
		return "comp/compGraph";
	}

	// 페이지 이동 끝-----------------------------------------------------------------

	// 사용자 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/cp_IdConfirm.do", method = RequestMethod.POST)
	public String cp_IdConfirm(@ModelAttribute("cp_Id") String cp_Id) {
		int resultData = compService.cp_idConfirm(cp_Id);
		return resultData + "";
	}

	// 회원 가입 처리
	@RequestMapping(value = "/compJoin.do", method = RequestMethod.POST)
	public ModelAndView compInsert(@ModelAttribute CompVO cvo) {
		log.info("compJoin.do post 방식에 의한 메소드 호출 성공");
		log.info(cvo.getCp_Add());
		ModelAndView mav = new ModelAndView();

		int result = 0;
		log.info(result + "");
		result = compService.compInsert(cvo);

		/*
		 * if (result == 1) { mav.setViewName("comp/compJoinSuc"); } else {
		 * mav.setViewName("comp/compJoin"); }
		 */

		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // cp_Id alreay exist
			mav.setViewName("comp/compJoin");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("comp/compJoinSuc");
			// success to add new comp; move to login page
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new comp
			mav.setViewName("comp/compJoin");
			break;
		}
		return mav;
	}
	/*
	 * 아이디찾기 화면 출력
	 */
	@RequestMapping(value = "/compSearch.do", method = RequestMethod.GET)
	public String compSearchForm(Model model) {
	   log.info("compSearch.do get 방식에 의한 compSearchForm메서드 호출 성공");
     return "comp/compSearch";
    }
	/*
	    * 아이디찾기 처리
	    */
	   @RequestMapping(value = "/compSearch.do", method = RequestMethod.POST)
	   public ModelAndView findComp(@ModelAttribute CompVO cvo, Model model) {
	      System.out.println("CompController클래스 findComp메소드 호출");
	      ModelAndView mav = new ModelAndView();

	      CompVO cVo =compService.findComp(cvo);

	      if (cVo == null) {
	         mav.addObject("errCode", 9);
	         mav.setViewName("comp/compSearch");
	         return mav;
	      } else {
	         String cp_Id = cVo.getCp_Id();

	         model.addAttribute("cpId", cp_Id);
	         System.out.println(cp_Id);
	         mav.setViewName("comp/compResult");
	         return mav;
	      }
	   }
	
	

}
