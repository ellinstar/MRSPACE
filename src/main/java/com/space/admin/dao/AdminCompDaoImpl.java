package com.space.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.comp.vo.CompVO;
@Repository("adminCompDAO")
public class AdminCompDaoImpl implements AdminCompDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CompVO> compList(CompVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("compList");
	}

	@Override
	public List<CompVO> cpMainList() {
		// TODO Auto-generated method stub
		return session.selectList("cpMainList");
	}

	@Override
	public CompVO compDetail(int cp_num) {
		// TODO Auto-generated method stub
		return (CompVO)session.selectOne("compDetail", cp_num);
	}

}