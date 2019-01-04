package com.space.space.service;

import java.util.List;

import com.space.space.vo.SpaceVO;

public interface SpaceService {

	public int spaceInsert(SpaceVO svo);

	public int spaceListCnt(SpaceVO svo);

	public List<SpaceVO> spaceList(SpaceVO svo);

	public void spaceModify(SpaceVO svo);


	
}
