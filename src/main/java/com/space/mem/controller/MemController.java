package com.space.mem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.space.mem.service.MemService;
import com.space.mem.vo.MemVO;
import com.space.memlogin.service.MemLoginService;
import com.space.memlogin.vo.LoginVO;
import com.space.reserv.vo.ReservVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value = "/mem")
@Log
public class MemController {
	@Autowired
	private MemService memService;

	@Autowired
	private MemLoginService loginService;

	/**************************************************************
	 * 회원 가입유형 폼
	 **************************************************************/
	@RequestMapping(value = "/memType.do", method = RequestMethod.GET)
	public String memTypeForm(Model model) {
		log.info("memType.do get 방식에 의한 memTypeForm메서드 호출 성공");
		return "mem/memType";
	}

	/**************************************************************
	 * 회원 약관동의 폼 (일반 회원)
	 **************************************************************/
	@RequestMapping(value = "/memAgree.do", method = RequestMethod.GET)
	public String memAgreeForm(Model model) {
		log.info("memAgree.do get 방식에 의한 memAgreeForm메서드 호출 성공");
		return "mem/memAgree";
	}

	/**************************************************************
	 * 회원 가입 폼 (일반 회원)
	 **************************************************************/
	@RequestMapping(value = "/memJoin.do", method = RequestMethod.GET)
	public String memJoinForm(Model model) {
		log.info("memJoin.do get 방식에 의한 memJoinForm메서드 호출 성공");
		return "mem/memJoin";
	}

	/*************************************************
	 * 회원 아이디 중복 체크
	 ************************************************/
	@ResponseBody
	@RequestMapping(value = "/memIdConfirm.do", method = RequestMethod.POST)
	public String memIdConfirm(@RequestParam("mem_Id") String mem_Id) {
		System.out.println("MemController - memIdConfirm 메소드 호출 - mem_Id : " + mem_Id);
		int result = memService.memIdConfirm(mem_Id);
		return result + "";
	}

	/**************************************************************
	 * 회원 가입 처리
	 *************************************************************/
	@RequestMapping(value = "/memJoin.do", method = RequestMethod.POST)
	public ModelAndView memInsert(@ModelAttribute MemVO mvo) {
		log.info("memJoin.do post 방식에 의한 메서드 호출 성공");
		System.out.println("MemController클래스 memInsert메소드 호출");
		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memService.memInsert(mvo);

		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist
			mav.setViewName("mem/memJoin");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("mem/memJoin_Success"); // success to add new member; move to login page
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("mem/memJoin");
			break;
		}
		return mav;
	}

	/**************************************************************
	 * 마이 페이지 폼
	 **************************************************************/
	@RequestMapping(value = "/memMyPage.do", method = RequestMethod.GET)
	public String memMyPageForm(Model model) {
		log.info("memMyPage.do get 방식에 의한 memMyPageForm메서드 호출 성공");
		return "mem/memMyPage";
	}

	/**************************************************************
	 * 내 정보 폼
	 **************************************************************/
	@RequestMapping(value = "/memInfo.do", method = RequestMethod.GET)
	public ModelAndView memInfoForm(HttpSession session) {
		log.info("memInfo.do get 방식에 의한 memInfoForm메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		MemVO vo = memService.memSelect(login.getMem_Id());
		mav.addObject("mem", vo);
		mav.setViewName("mem/memInfo");
		return mav;
	}

	/**************************************************************
	 * 내정보 - 비밀번호 확인 폼
	 **************************************************************/
	@RequestMapping(value = "/memModifyPw.do", method = RequestMethod.GET)
	public ModelAndView memModifyPw(HttpSession session) {
		log.info("memModifyPw.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		MemVO vo = memService.memSelect(login.getMem_Id());
		mav.addObject("mem", vo);
		mav.setViewName("mem/memModifyPw");
		return mav;
	}

	/**************************************************************
	 * 내정보 - 비밀번호 확인 처리
	 **************************************************************/
	@RequestMapping(value = "/memModifyPw.do", method = RequestMethod.POST)
	public ModelAndView memModifyPwProcess(@ModelAttribute("MemVO") MemVO mvo, HttpSession session) {
		log.info("memModifyPw.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		mvo.setMem_Id(login.getMem_Id());
		MemVO vo = memService.memSelect(mvo.getMem_Id());
		if (loginService.loginSelect(mvo.getMem_Id(), mvo.getMem_OldPw()) == null) {
			mav.addObject("errCode", 1);
			return mav;
		} else {
			mav.addObject("mem", vo);
			mav.setViewName("mem/memModify");
			return mav;
		}
	}

	/**************************************************************
	 * 회원 정보 수정1
	 *************************************************************/
	@RequestMapping(value = "/memModify.do", method = RequestMethod.GET)
	public ModelAndView memModify(HttpSession session) {
		log.info("memModify.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		MemVO vo = memService.memSelect(login.getMem_Id());
		mav.addObject("mem", vo);
		mav.setViewName("mem/memModify");
		return mav;
	}

	/**************************************************************
	 * 회원 정보 수정2
	 *************************************************************/
	@RequestMapping(value = "/memModify.do", method = RequestMethod.POST)
	public ModelAndView memModifyProcess(@ModelAttribute("MemVO") MemVO mvo, HttpSession session) {
		log.info("memModify.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		mvo.setMem_Id(login.getMem_Id());
		MemVO vo = memService.memSelect(mvo.getMem_Id());
		if (loginService.loginSelect2(mvo.getMem_Id()) == null) {
			mav.addObject("errCode", 1);
			mav.addObject("mem", vo);
			mav.setViewName("mem/memModify");
			return mav;
		}

		if (memService.memUpdate(mvo)) {
			mav.addObject("errCode", 3);
			mav.setViewName("redirect:/mem/memInfo.do");
			return mav;
		} else {
			mav.addObject("errCode", 2);
			mav.addObject("mem", vo);
			mav.setViewName("mem/memModify");
			return mav;
		}
	}

	/**************************************************************
	 * 회원 탈퇴
	 ************************************************************/
	@RequestMapping("/memDelete.do")
	public ModelAndView memDelete(HttpSession session) {
		log.info("memDelete.do get방식에 의한 메서드 호출 성공");

		ModelAndView mav = new ModelAndView();
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		int errCode = memService.memDelete(login.getMem_Id());
		switch (errCode) {
		case 1:
			mav.addObject("errCode", 6);
			mav.setViewName("redirect:/mem/logout.do");
			session.invalidate();
			break;
		case 2:
			mav.addObject("errCode", 5);
			mav.setViewName("mem/login");
			break;
		}
		return mav;
	}

	/**************************************************************
	 * 찜 목록
	 ************************************************************/
	@RequestMapping(value = "/likeList.do", method = RequestMethod.GET)
	public String likeList(@ModelAttribute MemVO mvo, Model model, HttpSession session) {
		log.info("likeList.do get방식에 의한 메서드 호출 성공");

		LoginVO lvo = (LoginVO) session.getAttribute("login");

		mvo.setMem_Id(lvo.getMem_Id());

		List<ReservVO> likeList = memService.likeList(mvo);
		session.setAttribute("likeList", likeList);

		return "mem/likeList";
	}

	/**************************************************************
	 * 찜목록 삭제버튼
	 ************************************************************/
	@RequestMapping(value = "/likeDelete.do", method = RequestMethod.POST)
	public ModelAndView likeDelete(@ModelAttribute ReservVO rvo, HttpSession session) {
		log.info("likeDelete.do post방식에 의한 메서드 호출 성공");

		ModelAndView mav = new ModelAndView();
		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		int a = memService.likeDelete(rvo.getSp_Num());
		if (a == 1) {
			mav.setViewName("redirect:/mem/likeList.do");
		} else {
			mav.setViewName("redirect:/mem/likeList.do");
		}
		return mav;
	}

	/*
	 * 아이디찾기 화면 출력
	 */
	@RequestMapping(value = "/memSearch.do", method = RequestMethod.GET)
	public String memSearchForm(Model model) {
		log.info("memSearch.do get 방식에 의한 memSearchForm메서드 호출 성공");
		return "mem/memSearch";
	}

	/*
	 * 아이디찾기 처리
	 */
	@RequestMapping(value = "/memSearch.do", method = RequestMethod.POST)
	public ModelAndView findMember(@ModelAttribute MemVO mvo, Model model) {
		System.out.println("MemController클래스 findMember메소드 호출");
		ModelAndView mav = new ModelAndView();

		MemVO mVo = memService.findMember(mvo);

		if (mVo == null) {
			mav.addObject("errCode", 9);
			mav.setViewName("mem/memSearch");
			return mav;
		} else {
			String mem_Id = mVo.getMem_Id();

			model.addAttribute("memId", mem_Id);
			mav.setViewName("mem/memResult");
			return mav;
		}
	}

	/*
	 * 비밀번호 변경 첫화면 출력
	 */
	@RequestMapping(value = "/pwChange.do", method = RequestMethod.GET)
	public String pwChangForm(Model model) {
		log.info("memSearch.do get 방식에 의한 pwchange get메서드 호출 성공");
		return "mem/pwChange";
	}

	/*
	 * 비밀번호 변경 첫화면 처리
	 */
	@RequestMapping(value = "/pwChange.do", method = RequestMethod.POST)
	public ModelAndView pwChange(@ModelAttribute MemVO mvo, HttpSession session, Model model) {
		System.out.println("MemController클래스 pwchange post메소드 호출");
		ModelAndView mav = new ModelAndView();

		MemVO mVo = memService.pwChange(mvo);

		if (mVo == null) {
			mav.addObject("errCode", 9);
			mav.setViewName("mem/pwChange");
			return mav;
		} else {
			session.setAttribute("memId", mVo);
			mav.setViewName("mem/pwChangePage");
			return mav;
		}
	}

	/*
	 * 비밀번호 변경 화면 출력
	 */
	@RequestMapping(value = "/pwChangePage.do", method = RequestMethod.GET)
	public String pwChangForm2(Model model) {
		log.info("memSearch.do get 방식에 의한 pwchange2 get메서드 호출 성공");
		return "mem/pwChangePage";
	}

	/*
	 * 비밀번호 변경 처리
	 */
	@RequestMapping(value = "/pwChangePage.do", method = RequestMethod.POST)
	public ModelAndView pwChange2(@ModelAttribute("MemVO") MemVO mvo, HttpSession session, Model model) {
		System.out.println("MemController클래스 pwchange2 post메소드 호출");
		ModelAndView mav = new ModelAndView();
		MemVO vo = (MemVO) session.getAttribute("memId");

		int result = memService.pwChange2(mvo);
		if (result != 1) {
			mav.addObject("errCode", 10);
			mav.setViewName("mem/pwChangePage");
			return mav;
		} else {
			mav.setViewName("mem/login");
			return mav;
		}

	}

	/*
	 * 리스트 구현
	 */
	@RequestMapping(value = "/myReservationList", method = RequestMethod.GET)
	public String reservList(@ModelAttribute MemVO mvo, Model model, HttpSession session) {

		LoginVO lvo = (LoginVO) session.getAttribute("login");
		mvo.setMem_Id(lvo.getMem_Id());

		List<ReservVO> reservListe = memService.reservList(mvo);
		session.setAttribute("reservList", reservListe);

		return "mem/myReservationList";
	}
	
	//예약 결제
	//예약 수락시 상태 변경
		@RequestMapping(value="/reservAgree.do",method=RequestMethod.POST)
		public String reservAgree(@ModelAttribute ReservVO rvo , HttpSession session, Model model) {
			session.getAttribute("login");
			memService.reservAgree(rvo);
			return "redirect:/mem/myReservationList.do";
		}
	
		//예약 취소시 상태 변경
		@RequestMapping(value="/reservRefuse.do",method=RequestMethod.POST)
		public String reservRefuse(@ModelAttribute ReservVO rvo , HttpSession session, Model model) {
			session.getAttribute("login");
			memService.reservRefuse(rvo);
			return "redirect:/mem/myReservationList.do";
		}
		
	

}
