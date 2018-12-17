package com.space.space.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping(value = "/spaceRegister.do")
	// 등록페이지 1번째
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


		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist
			mav.setViewName("space/spaceList");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("space/spaceList"); // success to add new member; move to login page
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("space/spaceRegister");
			break;
		}
		return mav;
	}

}
