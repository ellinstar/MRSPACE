package com.space.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.space.qna.service.QnaRepService;
import com.space.qna.vo.QnaRepVO;


/**************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody) 기존의 특정한 JSP와 같은 뷰를 만들어 내는
 * 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 **************************************************************/

@RestController
@RequestMapping(value = "/rep")
public class QnaRepController {

	@Autowired
	private QnaRepService qnaRepService;

	/**************************************************************
	 * 댓글 글목록 구현하기
	 * 
	 * @return List<QnaRepVO> 참고 : @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션.
	 *         현재 요청 URL : http://localhost:8080/replies/all/게시판글번호.do 예전 요청 URL :
	 *         http://localhost:8080/replies/qnaRepList.do?b_num=게시판글번호
	 **************************************************************/

	@RequestMapping(value = "/all/{qna_Num}.do", method = RequestMethod.GET)
	public ResponseEntity<List<QnaRepVO>> list(@PathVariable("qna_Num") Integer qna_Num) {
		ResponseEntity<List<QnaRepVO>> entity = null;
		try {
			entity = new ResponseEntity<List<QnaRepVO>>(qnaRepService.qnaRepList(qna_Num), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<QnaRepVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
