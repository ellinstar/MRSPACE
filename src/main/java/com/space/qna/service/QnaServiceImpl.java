package com.space.qna.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.qna.dao.QnaDAO;
import com.space.qna.vo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	// 글목록 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> myList = null;
		
		// 정렬에 대한 기본값 설정
		if(qvo.getOrder_by()==null) qvo.setOrder_by("qna_Num");
		if(qvo.getOrder_sc()==null) qvo.setOrder_sc("DESC");
		
		myList = qnaDAO.qnaList(qvo);
		return myList;
	}
	
	// 글목록 구현 (자주 묻는 질문)
	@Override
	public List<QnaVO> qnaList2(QnaVO qvo) {
		List<QnaVO> myList = null;
		
		// 정렬에 대한 기본값 설정
		if(qvo.getOrder_by()==null) qvo.setOrder_by("qna_Num");
		if(qvo.getOrder_sc()==null) qvo.setOrder_sc("DESC");
		
		myList = qnaDAO.qnaList2(qvo);
		return myList;
	}
	
	// 글 목록수
	@Override
	public int qnaListCnt(QnaVO qvo) {
		return qnaDAO.qnaListCnt(qvo);
	}
	// 글 목록수 (자주 묻는 질문)
	@Override
	public int qnaListCnt2(QnaVO qvo) {
		return qnaDAO.qnaListCnt2(qvo);
	}

	// 글입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) {
		int result = 0;
		try{
			result = qnaDAO.qnaInsert(qvo);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 글상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		detail = qnaDAO.qnaDetail(qvo);
		return detail;
	}
	// 글상세 구현 (자주 묻는 질문)
	@Override
	public QnaVO qnaDetail2(QnaVO qvo) {
		QnaVO detail = null;
		detail = qnaDAO.qnaDetail2(qvo);
		return detail;
	}

	// 비밀번호 확인 구현
	@Override
	public int pwdConfirm(QnaVO qvo) {
		int result = 0;
		result = qnaDAO.pwdConfirm(qvo);
		return result;
	}

	// 글수정 구현
	@Override
	public int qnaUpdate(QnaVO qvo) {
		int result = 0;
		try{
			result = qnaDAO.qnaUpdate(qvo);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	/* 글삭제 구현 */
	@Override
	public int qnaDelete(int qna_Num) {
		int result = 0;
		try{
			result = qnaDAO.qnaDelete(qna_Num);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

}
