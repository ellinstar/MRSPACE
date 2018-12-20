package com.space.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.space.admin.file.FileUploadUtil;
import com.space.admin.page.Criteria;
import com.space.admin.page.PageDTO;
import com.space.admin.service.NoticeService;
import com.space.admin.vo.NoticeVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value ="/admin/notice/**")
public class AdminNoticeController {
	
	@Autowired
	private NoticeService ntService;
	
	
	
	/**************************************************************
	 * 글목록 구현하기
	 **************************************************************/
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model, Criteria cri) {
		log.info("boardList 호출 성공");
		int total = ntService.noticeListCnt(cri);
		List<NoticeVO> noticeList = ntService.noticeList(cri);                                                                                                                                                    
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("data", nvo);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
		return "/admin/board/noticeList";
	}
	/**************************************************************
	 * 글쓰기 폼 출력하기
	 **************************************************************/
	@RequestMapping(value="/writeForm")
	public String writeForm(HttpSession session){
		log.info("writeForm 호출 성공");
		
		return "/admin/board/noticewr";
	}
	/**************************************************************
	 * 글쓰기 구현하기
	 **************************************************************/
	@RequestMapping(value="/noticeInsert", method=RequestMethod.POST)
	public String noticeInsert(@ModelAttribute NoticeVO nvo, Model model,HttpServletRequest request) throws IllegalStateException, IOException {
		log.info("noticeInsert 호출 성공");

		int result = 0;
		String url ="";
		if(nvo.getNt_file() != null) {
			String ntFile = FileUploadUtil.fileUpload(nvo.getFile(), request, "notice");
			nvo.setNt_file(ntFile);
		}
		
		result = ntService.noticeInsert(nvo, request);
		if(result == 1){
			url = "/admin/notice/list";
		}else{
			model.addAttribute("code", 1);
			url = "/admin/notice/writeForm";
		}
		
		return "redirect:"+url;
	}
	/**************************************************************
	 * 글 상세보기 구현
	 **************************************************************/
	@RequestMapping(value="/ntDetail", method=RequestMethod.GET)
	public String noticeDetail(@RequestParam("nt_num") int nt_num,@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("noticeDetail 호출 성공");
		
		NoticeVO detail = new NoticeVO();
		detail = ntService.noticeDetail(nt_num);
		
		if(detail!=null && (!detail.equals(""))){
			detail.setNt_content(detail.getNt_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);

		return "/admin/board/noticede";
	}
	/**************************************************************
	 * 글수정 폼 출력하기
	 * @param  : b_num
	 * @return : BoardVO
	 **************************************************************/
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("updateForm 호출 성공");
		
		log.info("nt_num = " + nvo.getNt_num());
		
		NoticeVO updateData = new NoticeVO();
		updateData = ntService.noticeDetail(nvo.getNt_num());
		
		model.addAttribute("updateData", updateData);
		return "/admin/board/noticemod";
	}
	/**************************************************************
	 * 글수정 구현하기
	 * @param  : BoardVO
	 **************************************************************/
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, HttpServletRequest request)throws IllegalStateException, IOException{
		log.info("boardUpdate 호출 성공");

		int result=0;
		String url="";
		if(!nvo.getFile().isEmpty()) {
			log.info("첨부파일"+nvo.getFile().getOriginalFilename());
			if(!nvo.getNt_file().isEmpty()) {
				FileUploadUtil.fileDelete(nvo.getNt_file(), request);
			}
			String nt_file = FileUploadUtil.fileUpload(nvo.getFile(), request, "notice");
			nvo.setNt_file(nt_file);
		}else {
			log.info("첨부파일 없음");
			nvo.setNt_file("");
		}
		log.info("nt_file:"+nvo.getNt_file());

		result = ntService.noticeUpdate(nvo);
		
		if(result == 1){
			// 수정 후 목록으로 이동
			url="/admin/notice/list";
		}else{
			url="/admin/notice/updateForm?nt_num="+nvo.getNt_num();
		}
		
		return "redirect:"+url;
	}
	/**************************************************************
	 * 글삭제 구현하기
	 * @throws IOException 
	 **************************************************************/
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVO nvo, HttpServletRequest request, Criteria cri) throws IOException {
		log.info("boardDelete 호출 성공");
		
		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";
		
		if(!nvo.getNt_file().isEmpty()) {
			FileUploadUtil.fileDelete(nvo.getNt_file(), request);
		}
		
		result = ntService.noticeDelete(nvo.getNt_num());
		
		/*if(result == 1){
			url="/admin/board/noticeList?page="+nvo.getPageIndex()+"&pageSize="+nvo.getPageSize();
		}else{
			url="/admin/board/noticeDetail?nt_num="+nvo.getNt_num()+"&page="+nvo.getPageIndex()+"&pageSize="+nvo.getPageSize();
		}*/
		return "redirect:/admin/notice/list"+cri.getListLink();
	}
	
	
}
