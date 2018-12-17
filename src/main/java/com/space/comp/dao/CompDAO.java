package com.space.comp.dao;

import com.space.comp.vo.CompSecurity;
import com.space.comp.vo.CompVO;

public interface CompDAO {

	public int securityInsert(CompSecurity set);
	
	public CompSecurity securitySelect(String cp_OId);
	
	public int securityDelete(String cp_Id);
	
	
	public CompVO compSelect(String cp_Id);

	public int compInsert(CompVO cvo);
	
	public int compUpdate(CompVO cvo);
	
	public int compDelete(String cp_Id);

}
