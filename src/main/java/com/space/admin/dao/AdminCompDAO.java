package com.space.admin.dao;

import java.util.List;
import java.util.Map;

import com.space.comp.vo.CompVO;

public interface AdminCompDAO {
	public List<CompVO> cpNewList();
	public List<CompVO> cpMainList();
	public List<CompVO> compList(CompVO cvo);
	public CompVO compDetail(int cp_num);
	public int compOk(int cp_Num);
	public Map<String, Object> cpMail();
	
}
