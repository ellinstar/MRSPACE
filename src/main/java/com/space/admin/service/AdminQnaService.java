package com.space.admin.service;

import java.util.List;

import com.space.admin.page.Criteria;
import com.space.qna.vo.QnaVO;

public interface AdminQnaService {
	public List<QnaVO> qnaList(Criteria cri);

}
