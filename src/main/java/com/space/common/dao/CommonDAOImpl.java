package com.space.common.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.space.vo.SpaceVO;

@Repository("CommonDAO")
public class CommonDAOImpl {
	@Autowired
	private SqlSession session;
	// 공간 검색 목록 구현
	public List<SpaceVO> commonList(SpaceVO svo) {
		return session.selectList("commonList", svo);
	}
	
	public int commonListCnt(SpaceVO svo) {
		return (Integer) session.selectOne("commonListCnt", svo);
	}

	// 공간 상세 구현
	public SpaceVO commonDetail(SpaceVO svo) {
		return (SpaceVO)session.selectOne("commonDetail", svo);
	}
}
