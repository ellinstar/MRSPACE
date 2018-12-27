package com.space.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.qna.dao.QnaRepDAO;
import com.space.qna.vo.QnaRepVO;


@Service
@Transactional
public class QnaRepServiceImpl implements QnaRepService {

	@Autowired
	private QnaRepDAO qnaRepDAO;

	// 글목록 구현
	@Override
	public List<QnaRepVO> qnaRepList(Integer qna_Num) {
		List<QnaRepVO> myList = null;
		myList = qnaRepDAO.qnaRepList(qna_Num);
		return myList;
	}
}
