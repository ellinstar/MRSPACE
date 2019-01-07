package com.space.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.space.admin.page.Criteria;
import com.space.admin.page.PageDTO;
import com.space.admin.service.NoticeService;
import com.space.admin.vo.NoticeVO;
import com.space.common.service.CommonService;
import com.space.mem.service.MemService;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {

	@Autowired
	private MemService memService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(@ModelAttribute SpaceVO svo, Model model) {
		log.info("메인컨트롤러 접속!!완료!!!!!!!!");

		memService.updateState();// 접속 날짜 기준으로 예약->사용중 변경됨

		List<SpaceVO> mainlayoutList = commonService.mainlayoutList(svo);

		model.addAttribute("mainlayoutList", mainlayoutList);
		model.addAttribute("data", svo);

		return "index";
	}

	// 공지사항
	@Autowired
	private NoticeService ntService;

	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public String notice(@ModelAttribute NoticeVO nvo, Model model, Criteria cri) {
		log.info("notice 접속 완료!!");
		int total = ntService.noticeListCnt(cri);
		List<NoticeVO> noticeList = ntService.noticeList(cri);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("data", nvo);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "common/noticeList";
	}

	@RequestMapping(value = "/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("nt_num") int nt_num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("noticeDetail 호출 성공");

		NoticeVO detail = new NoticeVO();
		detail = ntService.noticeDetail(nt_num);

		if (detail != null && (!detail.equals(""))) {
			detail.setNt_content(detail.getNt_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "common/noticede";
	}

	@Autowired
	private CommonService commonService;

	// 메인 공간 목록 검색 구현하기
	@RequestMapping(value = "/mainLayout.do", method = RequestMethod.GET)
	public String mainlayoutList(@ModelAttribute SpaceVO svo, Model model) {
		log.info("mainlayoutList 호출 성공");

		List<SpaceVO> mainlayoutList = commonService.mainlayoutList(svo);

		System.out.println("sp_num" + svo.getSp_Num());

		model.addAttribute("mainlayoutList", mainlayoutList);
		model.addAttribute("data", svo);

		return "/template/client/mainLayout";
	}

}