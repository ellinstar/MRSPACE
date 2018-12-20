package com.space.admin.dao;

import java.util.List;

import com.space.space.vo.SpaceVO;

public interface AdminSpaceDAO {
	public List<SpaceVO> spNewList();
	public List<SpaceVO> spMainList();
	public List<SpaceVO> adspaceList(SpaceVO svo);
	public SpaceVO spaceDetail(int sp_Num);
	public int spOk(int sp_Num);

}
