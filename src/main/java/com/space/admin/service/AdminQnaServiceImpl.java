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

	@Override
	public List<QnaVO> qnaList(Criteria cri) {
		// TODO Auto-generated method stub
		List<QnaVO> qna = adQnaDao.qnaList(cri);
		return qna;
	}

}
