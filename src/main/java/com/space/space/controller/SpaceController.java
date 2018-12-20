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
	public String spaceList(@ModelAttribute SpaceVO svo, Model model, @RequestParam ("cp_Num") int cp_Num) {
		log.info("spaceList 호출 성공 검색전");

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
	// 등록페이지 1번째
	public String spaceRegister1(HttpSession session) throws IllegalStateException, IOException {
		log.info("spaceRegister.do  메서드 호출 성공");
		return "space/spaceRegister";
	}


	// 등록 구현하기
	@RequestMapping(value = "/spaceInsert.do", method = RequestMethod.POST)
	public ModelAndView spaceInsert(@ModelAttribute SpaceVO svo, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		log.info("spaceInsert.do 호출 성공");
		ModelAndView mav = new ModelAndView();
		String url = "";

		int result = 0;

		if (svo.getSp_File() != null) {
			String sp_File = FileUploadUtil.fileUpload(svo.getFile(), request, "space");
			svo.setSp_File(sp_File);
		}
		
		/*CompLoginVO cvo =(CompLoginVO) session.getAttribute("cplogin");
		
		System.out.println("받는 아이디 : " + cvo.getCp_Id());
		
		System.out.println("받아오는 아이디 : " + svo.getCp_Id());*/
		System.out.println(svo.getCp_Id());
		result = spaceService.spaceInsert(svo);


		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // already exist
			mav.setViewName("space/spaceList");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("space/spaceList"); // success to add new space; move to spaceList page
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new space
			mav.setViewName("space/spaceRegister");
			break;
		}
		return mav;
	}

}
