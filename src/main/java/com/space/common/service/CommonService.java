package com.space.common.service;

import java.util.List;

import com.space.space.vo.SpaceVO;

public interface CommonService {
	public List<SpaceVO> commonList(SpaceVO svo);

	public int commonListCnt(SpaceVO svo);

	public SpaceVO commonDetail(SpaceVO svo);
}
