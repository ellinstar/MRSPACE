package com.space.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.qna.vo.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession session;
	
	// 글목록 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		return session.selectList("qnaList", qvo);
	}
	
	// 글목록 구현 (자주 묻는 질문)
	@Override
	public List<QnaVO> qnaList2(QnaVO qvo) {
		return session.selectList("qnaList2", qvo);
	}
	
	// 글 목록수
	public int qnaListCnt(QnaVO qvo) {
		return (Integer)session.selectOne("qnaListCnt", qvo);
	}
	// 글 목록수 (자주 묻는 질문)
	public int qnaListCnt2(QnaVO qvo) {
		return (Integer)session.selectOne("qnaListCnt2", qvo);
	}

	// 글상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		return (QnaVO)session.selectOne("qnaDetail", qvo);
	}
	// 글상세 구현 (자주 묻는 질문)
	@Override
	public QnaVO qnaDetail2(QnaVO qvo) {
		return (QnaVO)session.selectOne("qnaDetail2", qvo);
	}
	
	// 글입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) {
		return session.insert("qnaInsert", qvo);
	}

	// 비밀번호 확인 구현
	@Override
	public int pwdConfirm(QnaVO qvo) {
		return (Integer)session.selectOne("pwdConfirm", qvo);
	}

	// 글수정  구현
	@Override
	public int qnaUpdate(QnaVO qvo) {
		return session.update("qnaUpdate", qvo);
	}

	// 글삭제 구현
	@Override
	public int qnaDelete(int qna_Num) {
		return session.delete("qnaDelete", qna_Num);
	}

}
