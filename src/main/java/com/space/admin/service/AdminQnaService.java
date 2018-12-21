package com.space.admin.service;

import java.util.List;

import com.space.admin.page.Criteria;
import com.space.qna.vo.QnaRepVO;
import com.space.qna.vo.QnaVO;

public interface AdminQnaService {
	public List<QnaVO> qnaList(Criteria cri);
	public int qnaCnt(Criteria cri);
	public QnaVO getQna(int qna_num);
	public QnaRepVO getRep(int qna_num);
	public int repInsert(QnaRepVO qrvo);
	public int repUpdate(QnaRepVO qrvo);

}
