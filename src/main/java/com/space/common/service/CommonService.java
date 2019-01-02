package com.space.common.service;

import java.util.List;

import com.space.space.vo.SpaceVO;

public interface CommonService {
	public List<SpaceVO> mainlayoutList(SpaceVO svo);
	
	public List<SpaceVO> commonList(SpaceVO svo);

	public List<SpaceVO> dtcommonList(SpaceVO svo);

	public int commonListCnt(SpaceVO svo);

	public SpaceVO commonDetail(SpaceVO svo);
	
	public int cpnum(SpaceVO svo);
}
