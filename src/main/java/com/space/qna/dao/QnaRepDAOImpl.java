package com.space.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.qna.vo.QnaRepVO;

@Repository
public class QnaRepDAOImpl implements QnaRepDAO {

	@Autowired
	private SqlSession session;
	
	// 글목록 구현
	@Override 
	public List<QnaRepVO> qnaRepList(Integer qna_Num) {
		return session.selectList("qnaRepList", qna_Num);
	}
}
