package com.space.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.admin.page.Criteria;
import com.space.qna.vo.QnaVO;

@Repository("AdminQnaDAO")
public class AdminQnaDaoImpl {
	
	@Autowired
	private SqlSession session;
	
	//문의게시판 목록
	public List<QnaVO> qnaList(Criteria cri){
		return session.selectList("adQnaList", cri);
	}
}
