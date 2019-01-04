package com.space.space.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.space.common.page.Paging;
import com.space.common.util.Util;
import com.space.space.file.FileUploadUtil;
import com.space.space.service.SpaceService;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/space")

public class SpaceController {

	@Autowired
	private SpaceService spaceService;

	// 공간 목록 구현하기
	@RequestMapping(value = "/spaceList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String spaceList(@ModelAttribute SpaceVO svo, Model model, @RequestParam("cp_Num") int cp_Num) {
		log.info("spaceList 호출 성공");

		// 페이지 세팅
		Paging.setPage(svo);
		svo.setCp_Num(cp_Num);
		
		// 전체 레코드 수 구현
		int total = spaceService.spaceListCnt(svo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(svo.getPage()) - 1) * Util.nvl(svo.getPageSize());
		log.info("count = " + count);

		List<SpaceVO> spaceList = spaceService.spaceList(svo);

		model.addAttribute("spaceList", spaceList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", svo);

		return "space/spaceList";
	}

	@RequestMapping(value = "/spaceRegister.do")
	// 등록페이지 출력
	public String spaceRegister1(HttpSession session) throws IllegalStateException, IOException {
		log.info("spaceRegister.do  메서드 호출 성공");
		return "space/spaceRegister";
	}

	// 등록 구현하기
	@RequestMapping(value = "/spaceInsert.do", method = RequestMethod.POST)
	public ModelAndView spaceInsert(@ModelAttribute SpaceVO svo, HttpServletRequest request)
			throws IllegalStateException, IOException {

		log.info("spaceInsert.do 호출 성공");
		ModelAndView mav = new ModelAndView();

		int result = 0;

		if (svo.getSp_File() != null) {
			String sp_File = FileUploadUtil.fileUpload(svo.getFile(), request, "space");
			svo.setSp_File(sp_File);
		}

		result = spaceService.spaceInsert(svo);

		System.out.println(result);
		switch (result) {
		case 1: // 성공
			mav.addObject("errCode", 1);
			mav.setViewName("space/spaceRegistSuc");
			break;
		case 3: // 안나옴
			mav.addObject("errCode", 3);
			mav.setViewName("space/spaceList");
			break;
		default: // 실패
			mav.addObject("errCode", 2);
			mav.setViewName("space/spaceRegister");
			break;
		}
		return mav;
	}

	/*
	 * =============================================================================
	 * ===========================
	 */

	// 회원정보수정 처리
	/*@RequestMapping(value = "/spaceModify.do", method = RequestMethod.POST)
	public ModelAndView SpaceModify(@ModelAttribute("SpaceVO") SpaceVO svo, HttpSession session) {
		log.info("spaceModify.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		SpaceVO svo2 = (SpaceVO) session.getAttribute("comp2");

		System.out.println("세션 space2 : " + session.getAttribute("comp2"));

		if (svo2 == null) {
			mav.setViewName("mem/login");
			return mav;
		}

		svo.setSp_Num(svo2.getSp_Num());
		SpaceVO vo = spaceService.spaceSelect(svo.getSp_Num());
		System.out.println("SpaceController / SpaceModify : " + svo.getSp_Name());
		if (spaceService.spaceSelect(svo.getSp_Num()) == null) { // 실패
			mav.addObject("errCode", 1);
			mav.setViewName("common/commonDetail2");
		} else if (spaceService.spaceUpdate(svo) == 1) { // 성공
			mav.addObject("errCode", 3);
			mav.setViewName("redirect:/space/spaceList.do");
		} else {
			mav.addObject("errCode", 2); // 실패
			mav.addObject("space", vo);
			mav.setViewName("common/commonDetail2");
		}
		return mav;
	}*/

	@RequestMapping(value="/spaceModify.do", method = RequestMethod.POST)
	public String spaceModify(@ModelAttribute("SpaceVO") SpaceVO spaceVO, Model model){
			spaceService.spaceModify(spaceVO);
		return "redirect:/space/spaceList.do?cp_Num="+ spaceVO.getCp_Num();
	}
	
}
