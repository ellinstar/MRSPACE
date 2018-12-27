package com.space.qna.dao;

import java.util.List;

import com.space.qna.vo.QnaVO;


public interface QnaDAO {
	
	public List<QnaVO> qnaList(QnaVO qvo);
	public List<QnaVO> qnaList2(QnaVO qvo);
	public int qnaListCnt(QnaVO qvo);
	public int qnaInsert(QnaVO qvo);
	public QnaVO qnaDetail(QnaVO qvo);
	public QnaVO qnaDetail2(QnaVO qvo);
	public int pwdConfirm(QnaVO qvo);
	public int qnaUpdate(QnaVO qvo);
	public int qnaDelete(int qna_Num);
	
}
