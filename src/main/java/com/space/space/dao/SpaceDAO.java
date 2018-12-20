package com.space.space.dao;

import java.util.List;

import com.space.space.vo.SpaceVO;

public interface SpaceDAO {
	public int spaceInsert(SpaceVO svo);

	public int spaceListCnt(SpaceVO svo);

	public List<SpaceVO> spaceList(SpaceVO svo);
	
}
