package com.space.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.admin.page.Criteria;
import com.space.mem.vo.MemVO;

@Repository("AdminMemDAOImpl")
public class AdminMemDaoImpl {
	
	@Autowired
	private SqlSession session;

	
	public List<MemVO> memList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("memList");
	}

	
	public int memCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("memCount", cri);
	}
	
	public MemVO memDetail(MemVO mvo) {
	      return (MemVO) session.selectOne("memDetail", mvo);
	   }

}
