package com.space.admin.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.space.admin.dao.NoticeDAOImpl;
import com.space.admin.page.Criteria;
import com.space.admin.vo.NoticeVO;

import lombok.extern.java.Log;

@Log
@Service("NoticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAOImpl ntDao;
	
	//게시판 메인 공지 3개 목록
	@Override
	public List<NoticeVO> ntMainList() {
		// TODO Auto-generated method stub
		List<NoticeVO> notice = null;
		notice = ntDao.ntMainList();
		return notice;
	}

	//공지사항 목록
	@Override
	public List<NoticeVO> noticeList(Criteria cri) {
		// TODO Auto-generated method stub
		List<NoticeVO> notice = null;


		notice = ntDao.noticeList(cri);
		return notice;
	}
	//공지 입력
	@Override
	public int noticeInsert(NoticeVO nvo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = ntDao.noticeInsert(nvo, request);
			log.info("filename:"+nvo.getFile().getOriginalFilename());
			
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}
	
	//공지상세보기
	@Override
	public NoticeVO noticeDetail(int nt_num) {
		// TODO Auto-generated method stub
		NoticeVO detail = null;
		detail = ntDao.noticeDetail(nt_num);
		return detail;
	}
	
	//공지 수정하기
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = ntDao.noticeUpdate(nvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	//공지 삭제 구현
	@Override
	public int noticeDelete(int nt_num) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result= ntDao.noticeDelete(nt_num);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	//페이징 위한 목록 수 
	@Override
	public int noticeListCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return ntDao.noticeListCnt(cri);
	}
	

}
