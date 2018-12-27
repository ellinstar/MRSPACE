package com.space.qna.dao;

import java.util.List;

import com.space.qna.vo.QnaRepVO;

public interface QnaRepDAO {
	public List<QnaRepVO> qnaRepList(Integer qna_Num);
}
