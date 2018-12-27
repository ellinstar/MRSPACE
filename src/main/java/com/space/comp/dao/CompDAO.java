package com.space.comp.dao;

import com.space.comp.vo.CompSecurity;
import com.space.comp.vo.CompVO;

public interface CompDAO {

	public int compsecurityInsert(CompSecurity set);
	
	public CompSecurity compsecuritySelect(String cp_OId);
	
	public int compsecurityDelete(String cp_Id);
	
	
	public CompVO compSelect(String cp_Id);
	
	public CompVO compSelect2(String cp_Bnum);

	public int compInsert(CompVO cvo);
	
	public int compUpdate(CompVO cvo);
	
	public int compDelete(String cp_Id);
	
	public CompVO findComp(CompVO cvo);
	
	public CompVO compPwChange(CompVO cvo);
	
	public int compPwChange2(CompVO cvo);
	
	public int compSecurityUpdate(CompSecurity sec);

}
