package com.space.admin.dao;

import java.util.List;

import com.space.comp.vo.CompVO;

public interface AdminCompDAO {
	public List<CompVO> cpMainList();
	public List<CompVO> compList(CompVO cvo);
	public CompVO compDetail(int cp_num);

}
