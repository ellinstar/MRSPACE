package com.space.space.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.space.vo.SpaceVO;

@Repository("spaceDAO")
public class SpaceDAOImpl {
	@Autowired
	private SqlSession session;

	// 공간 등록 구현
	public int spaceInsert(SpaceVO svo) {
		return session.insert("spaceInsert", svo);
	}

	// 전체 레코드 건수 구현
	public int spaceListCnt(SpaceVO svo) {
		return (Integer) session.selectOne("spaceListCnt", svo);
	}

	// 글목록 구현
	public List<SpaceVO> spaceList(SpaceVO svo) {
		return session.selectList("spaceList", svo);
	}
}
