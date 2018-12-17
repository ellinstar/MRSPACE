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

	/*
	 * // 등록페이지 2번째
	 * 
	 * @RequestMapping(value = "/spaceRegister2.do", method = RequestMethod.POST) //
	 * 등록페이지 2번째 public ModelAndView spaceRegister2(@ModelAttribute SpaceVO svo,
	 * Model model, HttpServletRequest request) throws IllegalStateException,
	 * IOException{ log.info("spaceRegister2.do  메서드 호출 성공"); ModelAndView mav = new
	 * ModelAndView(); mav.addObject("space", svo);
	 * mav.setViewName("space/spaceRegister2"); return mav; }
	 * 
	 * // 등록페이지 3번째
	 * 
	 * @RequestMapping(value = "/spaceRegister3.do", method = RequestMethod.POST) //
	 * 등록페이지 3번째 public ModelAndView spaceRegister3(@ModelAttribute SpaceVO svo,
	 * Model model, HttpServletRequest request) throws IllegalStateException,
	 * IOException{ log.info("spaceRegister3.do 메서드 호출 성공"); ModelAndView mav = new
	 * ModelAndView(); mav.addObject("space", svo);
	 * mav.setViewName("space/spaceRegister3"); return mav; }
	 * 
	 * // 등록페이지 4번째
	 * 
	 * @RequestMapping(value = "/spaceRegister4.do", method = RequestMethod.POST) //
	 * 등록페이지 4째 public ModelAndView spaceRegister4(@ModelAttribute SpaceVO svo,
	 * Model model, HttpServletRequest request) {
	 * log.info("spaceRegister4. 메서드 호출 성공"); ModelAndView mav = new ModelAndView();
	 * mav.addObject("space", svo); mav.setViewName("space/spaceRegister4"); return
	 * mav; }
	 */
	/*
	 * // 등록 구현하기
	 * 
	 * @RequestMapping(value = "/spaceInsert.do", method = RequestMethod.POST)
	 * public String spaceInsert(@ModelAttribute SpaceVO svo, Model model,
	 * HttpServletRequest request) throws IllegalStateException, IOException {
	 * 
	 * log.info("spaceInsert 호출 성공");
	 * 
	 * log.info("fileName : " + svo.getSp_File().getOriginalFilename());
	 * 
	 * int result = 0; String url = "";
	 * 
	 * 
	 * if(svo.getSp_File() != null) { String sp_File =
	 * FileUploadUtil.fileUpload(svo.getFile(), request, "space");
	 * svo.setSp_File(sp_File); }
	 * 
	 * 
	 * result = spaceService.spaceInsert(svo);
	 * 
	 * System.out.println(svo.getSp_Num()); System.out.println(svo.getSp_Type());
	 * System.out.println(svo.getSp_Stock()); System.out.println(svo.getSp_Name());
	 * System.out.println(svo.getSp_Price());
	 * System.out.println(svo.getSp_Address());
	 * System.out.println(svo.getSp_Contract1());
	 * System.out.println(svo.getSp_Contract2());
	 * System.out.println(svo.getSp_Opendate());
	 * System.out.println(svo.getSp_Exposition());
	 * System.out.println(svo.getSp_Service());
	 * System.out.println(svo.getSp_Traffic());
	 * System.out.println(svo.getSp_Rest());
	 * 
	 * 
	 * if (result == 1) { System.out.println("등록완료"); url = "/space/spaceList.do"; }
	 * else { System.out.println("등록실패"); model.addAttribute("code", 1); url =
	 * "/space/spaceRegister"; }
	 * 
	 * return "redirect:" + url;
	 * 
	 * }
	 */

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

		System.out.println(svo.getSp_Num());
		System.out.println(svo.getSp_Type());
		System.out.println(svo.getSp_Stock());
		System.out.println(svo.getSp_Name());
		System.out.println(svo.getSp_Price());
		System.out.println(svo.getSp_Address());
		System.out.println(svo.getSp_Contract1());
		System.out.println(svo.getSp_Contract2());
		System.out.println(svo.getSp_Opendate());
		System.out.println(svo.getSp_Exposition());
		System.out.println(svo.getSp_Service());
		System.out.println(svo.getSp_Traffic());
		System.out.println(svo.getSp_Rest());

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
