package com.space.reserv.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;

@Repository
public class ReservDAOImpl {

	@Autowired
	private SqlSession session;

	public int reservation(ReservVO rvo) {
		return session.insert("reservation", rvo);
	}

	public SpaceVO spaceResert(ReservVO rvo) {
		return (SpaceVO) session.selectOne("spaceResert", rvo);
	}

	public int useSpace(SpaceVO svo) {
		return session.selectOne("useSpace", svo);
	}

	// 찜
	public int likeInsert(ReservVO rvo) {
		return session.insert("likeInsert", rvo);
	}
}
