package com.space.admin.service;

import java.util.List;

import com.space.comp.vo.CompVO;
import com.space.space.vo.SpaceVO;

public interface AdminSpaceService {
	public List<SpaceVO> spNewList();
	public List<SpaceVO> spMainList();
	public List<SpaceVO> adspaceList(SpaceVO cvo);
	public SpaceVO spaceDetail(int sp_Num);
	public int spOk(int sp_Num);

}
