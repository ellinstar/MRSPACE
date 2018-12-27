package com.space.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.admin.page.Criteria;
import com.space.qna.vo.QnaRepVO;
import com.space.qna.vo.QnaVO;

@Repository("AdminQnaDAO")
public class AdminQnaDaoImpl {
	
	@Autowired
	private SqlSession session;
	
	//메인 문의게시판 목록
	public List<QnaRepVO> qnaMain(){
		return session.selectList("qnaMainList");
	}
	
	//문의게시판 목록
	public List<QnaVO> qnaList(Criteria cri){
		return session.selectList("adQnaList", cri);
	}
	
	//페이징 위한 목록 수 
	public int qnaCnt(Criteria cri) {
		return(Integer)session.selectOne("qnaCnt");
	}
	
	//문의 상세 보기
	public QnaVO getQna(int qna_num) {
		return session.selectOne("getQna", qna_num);
	}
	
	//문의 상세보기 시 댓글 가져오기
	public QnaRepVO getRep(int qna_num) {
		return session.selectOne("getRep", qna_num);
	}
	//댓글 등록
	public int repInsert(QnaRepVO qrvo) {
		return session.insert("repInsert", qrvo);
	}
	//댓글 수정
	public int repUpdate(QnaRepVO qrvo) {
		return session.insert("repUpdate", qrvo);
	}
}
