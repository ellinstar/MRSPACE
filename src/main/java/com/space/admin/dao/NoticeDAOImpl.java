package com.space.admin.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.admin.page.Criteria;
import com.space.admin.vo.NoticeVO;

@Repository("NoticeDAO")
public class NoticeDAOImpl{
	
	@Autowired
	private SqlSession session;
	
	//공지 메인 목록
	public List<NoticeVO> ntMainList() {
		return session.selectList("ntMainList");
	}

	//공지 목록 구현
	public List<NoticeVO> noticeList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("noticeList", cri);
	}
	
	//공지 입력
	
	public int noticeInsert(NoticeVO nvo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return session.insert("noticeInsert", nvo);
	}
	//공지 상세 보기
	
	public NoticeVO noticeDetail(int nt_num) {
		// TODO Auto-generated method stub
		return (NoticeVO)session.selectOne("noticeDetail", nt_num);
	}
	//공지 수정
	
	public int noticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return session.update("noticeUpdate", nvo);
	}
	
	//공지 삭제
	
	public int noticeDelete(int nt_num) {
		// TODO Auto-generated method stub
		return session.delete("noticeDelete", nt_num);
	}
	//페이징 위한 목록 수 
	
	public int noticeListCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("noticeListCnt");
	}

}
