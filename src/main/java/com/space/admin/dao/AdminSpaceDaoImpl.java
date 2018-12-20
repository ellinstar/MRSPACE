package com.space.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.space.vo.SpaceVO;
@Repository("adminSpaceDAO")
public class AdminSpaceDaoImpl implements AdminSpaceDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<SpaceVO> adspaceList(SpaceVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("adspaceList");
	}

	@Override
	public List<SpaceVO> spNewList() {
		// TODO Auto-generated method stub
		return session.selectList("spNewList");
	}
	@Override
	public List<SpaceVO> spMainList() {
		// TODO Auto-generated method stub
		return session.selectList("spMainList");
	}

	@Override
	public SpaceVO spaceDetail(int sp_num) {
		// TODO Auto-generated method stub
		return (SpaceVO)session.selectOne("spaceDetail", sp_num);
	}

	@Override
	public int spOk(int sp_Num) {
		// TODO Auto-generated method stub
		return session.update("spOk", sp_Num);
	}



}
