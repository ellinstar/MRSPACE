package com.space.space.dao;

import java.util.List;

import com.space.space.vo.SpaceVO;

public interface SpaceDAO {
	
	public int spaceInsert(SpaceVO svo);

	public int spaceListCnt(SpaceVO svo);

	public List<SpaceVO> spaceList(SpaceVO svo);
	
	/*public int spaceSelect(SpaceVO sp_Num);*/
	
	public void spaceModify(SpaceVO svo);
	
	
	/*public int spnum(SpaceVO svo);
	
	public SpaceVO spaceModifyForm(SpaceVO svo);
	
	public List<SpaceVO> dtspaceList(SpaceVO svo);*/
		
	/*public SpaceVO spaceSelect(String svo);*/
	
}
