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

import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		log.info("메인컨트롤러 접속!!완료!!!!!!!!");
		return "index";
	}
	//공지사항
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
	@RequestMapping(value="/noticeDetail.do", method=RequestMethod.GET)
	public String noticeDetail(@RequestParam("nt_num") int nt_num,@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("noticeDetail 호출 성공");
		
		NoticeVO detail = new NoticeVO();
		detail = ntService.noticeDetail(nt_num);
		
		if(detail!=null && (!detail.equals(""))){
			detail.setNt_content(detail.getNt_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);

		return "common/noticede";
	}

}