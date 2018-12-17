package com.space.space.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.space.space.vo.SpaceVO;

public class SpaceDAOImpl implements SpaceDAO {
	@Autowired
	private SqlSession session;
	
	
	// 공간 등록 구현
	@Override
	public int spaceInsert(SpaceVO svo) {
		return session.insert("spaceInsert", svo);
	}
}
