package com.space.space.dao;

import java.util.List;

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

	// 전체 레코드 건수 구현
	@Override
	public int spaceListCnt(SpaceVO svo) {
		return (Integer) session.selectOne("spaceListCnt", svo);
	}

	// 글목록 구현
	@Override
	public List<SpaceVO> spaceList(SpaceVO svo) {
		System.out.println("글목록 구현 DAO " + svo.getCp_Id());
		return session.selectList("spaceList", svo);
	}

}
