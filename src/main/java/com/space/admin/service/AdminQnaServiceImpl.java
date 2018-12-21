package com.space.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.space.admin.dao.AdminQnaDaoImpl;
import com.space.admin.page.Criteria;
import com.space.qna.vo.QnaVO;

import lombok.extern.java.Log;

@Log
@Service("AdminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService {
	
	@Autowired
	public AdminQnaDaoImpl adQnaDao;
	
	//qna리스트 가져오기
	@Override
	public List<QnaVO> qnaList(Criteria cri) {
		// TODO Auto-generated method stub
		List<QnaVO> qna = adQnaDao.qnaList(cri);
		return qna;
	}
	//상세페이지
	@Override
	public QnaVO getQna(int qna_num) {
		// TODO Auto-generated method stub
		QnaVO qna = adQnaDao.getQna(qna_num);
		return qna;
	}
	//페이징 위한 갯수 
	@Override
	public int qnaCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return adQnaDao.qnaCnt(cri);
	}

}
