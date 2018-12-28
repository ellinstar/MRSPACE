package com.space.qna.service;

import java.util.List;

import com.space.qna.vo.QnaRepVO;

public interface QnaRepService {
	public List<QnaRepVO> qnaRepList(Integer qna_Num);
}