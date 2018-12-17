package com.space.admin.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.space.admin.page.Criteria;
import com.space.admin.vo.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> noticeList(Criteria cri);
	public int noticeListCnt(Criteria cri);
	public int noticeInsert(NoticeVO nvo, HttpServletRequest request);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public int noticeUpdate(NoticeVO nvo);
	public int noticeDelete(int nt_num);
}
