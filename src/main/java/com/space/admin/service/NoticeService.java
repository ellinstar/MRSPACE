package com.space.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.space.admin.page.Criteria;
import com.space.admin.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> ntMainList();
	public List<NoticeVO> noticeList(Criteria cri);
	public int noticeListCnt(Criteria cri);
	public int noticeInsert(NoticeVO nvo, HttpServletRequest request);
	public NoticeVO noticeDetail(int nt_num);
	public int noticeUpdate(NoticeVO nvo);
	public int noticeDelete(int nt_num);
}
