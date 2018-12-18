package com.space.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.space.common.service.CommonService;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/common")

public class CommonController {

	@Autowired
	private CommonService commonService;

	// 공간 목록 검색 구현하기
	@RequestMapping(value = "/commonList.do", method = RequestMethod.GET)
	public String commonList(@ModelAttribute SpaceVO svo, Model model) {
		log.info("commonList 호출 성공");


		List<SpaceVO> commonList = commonService.commonList(svo);
		
		model.addAttribute("commonList", commonList);
		model.addAttribute("data", svo);

		return "common/commonList";
	}
	
	/**************************************************************
	 * 공간 상세보기 구현
	 **************************************************************/
	@RequestMapping(value = "/commonDetail", method = RequestMethod.GET)
	public String commonDetail(@ModelAttribute SpaceVO svo, Model model) {
		log.info("commonDetail 호출 성공");
		log.info("sp_num = " + svo.getSp_Num());

		SpaceVO detail = new SpaceVO();
		detail = commonService.commonDetail(svo);

		if (detail != null && (!detail.equals(""))) {
			detail.setSp_Exposition(detail.getSp_Exposition().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "common/commonDetail";
	}

}
