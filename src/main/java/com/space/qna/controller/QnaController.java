package com.space.qna.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.space.client.util.Util;
import com.space.memlogin.vo.LoginVO;
import com.space.qna.page.Paging;
import com.space.qna.service.QnaService;
import com.space.qna.vo.QnaVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	/**************************************************************
	 * 글목록 구현하기
	 **************************************************************/	
	@RequestMapping(value="/qnaList.do", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaList 호출 성공");

		//페이지 세팅
		Paging.setPage(qvo); 
		
		// 전체 레코드수 구현
		int total = qnaService.qnaListCnt(qvo);
		log.info("total = "+total);
		
		// 글번호 재설정
		int count = total - (Util.nvl(qvo.getPage())-1) * Util.nvl(qvo.getPageSize());
		log.info("count = "+count);
		
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", qvo);
		
		return "qna/qnaList";
	}
	
	
	/**************************************************************
	 * 자주묻는질문 구현하기
	 **************************************************************/	
	@RequestMapping(value="/qnaFixed.do", method = RequestMethod.GET)
	public String qnaFixed(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaFixed 호출 성공");

		//페이지 세팅
		Paging.setPage(qvo); 
		
		// 전체 레코드수 구현
		int total = qnaService.qnaListCnt(qvo);
		log.info("total = "+total);
		
		// 글번호 재설정
		int count = total - (Util.nvl(qvo.getPage())-1) * Util.nvl(qvo.getPageSize());
		log.info("count = "+count);
		
		List<QnaVO> qnaList = qnaService.qnaList2(qvo);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", qvo);
		
		return "qna/qnaFixed";
	}
	
	
	/**************************************************************
	 * 글쓰기 폼 출력하기
	 **************************************************************/
	@RequestMapping(value="/qnaWriteForm.do", method = RequestMethod.GET)
	public ModelAndView memInfoForm(HttpSession session) {
		log.info("qnaWriteForm.do get 방식에 의한 qnaWriteForm메서드 호출 성공");
		ModelAndView mav=new ModelAndView();
		
		LoginVO login =(LoginVO)session.getAttribute("login");
		
		mav.addObject("qna", login);
		mav.setViewName("qna/qnaWrite");	
		return mav;
	}
	
	/**************************************************************
	 * 글쓰기 구현하기
	 **************************************************************/
	@RequestMapping(value="/qnaInsert.do", method=RequestMethod.POST)
	public String qnaInsert(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaInsert 호출 성공");
		
        int result = 0;
        String url ="" ;
        
        result = qnaService.qnaInsert(qvo);
        if(result == 1){
        	url = "/qna/qnaList.do";
        }else{
			model.addAttribute("code", 1);
			url = "/qna/qnaWriteForm.do";
		}
	    return "redirect:"+url;
	}
	
	/**************************************************************
	 * 글 상세보기 구현
	 **************************************************************/
	@RequestMapping(value="/qnaDetail.do", method=RequestMethod.GET)
	public String qnaDetail(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaDetail 호출 성공");
		log.info("qna_num = " + qvo.getQna_Num());
		
		QnaVO detail = new QnaVO();
		detail = qnaService.qnaDetail(qvo);
		
		if(detail!=null && (!detail.equals(""))){
			detail.setQna_Content(detail.getQna_Content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);

		return "qna/qnaDetail";
	}
	/**************************************************************
	 * 글 상세보기 구현2
	 **************************************************************/
	@RequestMapping(value="/qnaDetail2.do", method=RequestMethod.GET)
	public String qnaDetail2(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaDetail2 호출 성공");
		log.info("qna_num = " + qvo.getQna_Num());
		
		QnaVO detail = new QnaVO();
		detail = qnaService.qnaDetail2(qvo);
		
		if(detail!=null && (!detail.equals(""))){
			detail.setQna_Content(detail.getQna_Content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		
		return "qna/qnaDetail2";
	}
	
	/**************************************************************
	 * 비밀번호 확인
	 * @param qna_Num
	 * @param qna_Pw
	 * @return int로 result를 0 또는 1를 리턴할 수도 있고, 
	 *         String로 result 값을 "성공 or 실패"를 리턴할 수도 있다.(현재 문자열 리턴)
	 * 참고 : @ResponseBody는 전달된 뷰를 통해서 출력하는 것이 아니라
	 *       HTTP Response Body에 직접 출력하는 방식.
	 *       produces 속성은 지정한 미디어 타입과 관련된 응답을 생성하는데 사용한 실제 컨텐트 타입을 보장.
	 **************************************************************/
	@ResponseBody
	@RequestMapping(value="/pwdConfirm", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(@ModelAttribute QnaVO qvo) {
		log.info("pwdConfirm 호출 성공");
		String value = "";
		
		//아래 변수에는 입력 성공에 대한 상태값 저장(1 or 0)
		int result = qnaService.pwdConfirm(qvo);
		if(result==1){
			value="성공";
		}else{
			value="실패";
		}
		log.info("result = " + result);
		
		return value+"";   
	}

	/**************************************************************
	 * 글수정 폼 출력하기
	 * @param  : qna_Num
	 * @return : QnaVO
	 **************************************************************/
	@RequestMapping(value="/qnaUpdateForm.do")
	public String qnaUpdateForm(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaUpdateForm 호출 성공");
		
		log.info("qna_Num = " + qvo.getQna_Num());
		
		QnaVO updateData = new QnaVO();
		updateData = qnaService.qnaDetail(qvo);
		
		model.addAttribute("updateData", updateData);
		return "qna/qnaUpdate";
	}
	
	/**************************************************************
	 * 글수정 구현하기
	 * @param  : QnaVO
	 **************************************************************/
	@RequestMapping(value="/qnaUpdate.do", method=RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo, HttpServletRequest request) throws IllegalStateException,IOException{
		log.info("qnaUpdate 호출 성공");

		int result=0;
		String url="";

		result = qnaService.qnaUpdate(qvo);
		
		if(result == 1){
			//url="/qna/qnaList.do"; // 수정 후 목록으로 이동
			//아래 url은 수정 후 상세 페이지로 이동 
			url="/qna/qnaDetail.do?qna_Num="+qvo.getQna_Num()+"&page="+qvo.getPage()+"&pageSize="+qvo.getPageSize();
		} 
		return "redirect:"+url;
	}
	
	/**************************************************************
	 * 글삭제 구현하기
	 * @throws IOException 
	 **************************************************************/
	@RequestMapping(value="/qnaDelete.do")
	public String qnaDelete(@ModelAttribute QnaVO qvo) {
		log.info("qnaDelete 호출 성공");
		
		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";
		
		result = qnaService.qnaDelete(qvo.getQna_Num());
		
		if(result == 1){
			url="/qna/qnaList.do?page="+qvo.getPage()+"&pageSize="+qvo.getPageSize();
		}else{
			url="/qna/qnaDetail.do?qna_Num="+qvo.getQna_Num()+"&page="+qvo.getPage()+"&pageSize="+qvo.getPageSize();
		}
		return "redirect:"+url;
	}

}
