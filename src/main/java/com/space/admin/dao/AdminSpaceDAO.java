package com.space.admin.dao;

import java.util.List;

import com.space.space.vo.SpaceVO;

public interface AdminSpaceDAO {
	public List<SpaceVO> spMainList();
	public List<SpaceVO> spaceList(SpaceVO svo);
	public SpaceVO spaceDetail(int sp_Num);

}
