package com.space.comp.service;

//import com.space.comp.vo.CompSecurity;
import com.space.comp.vo.CompVO;

public interface CompService {

	public int cp_idConfirm(String cp_Id);
	
	public CompVO compSelect(String cp_Id);
	
	public CompVO compSelect2(String cp_Bnum);
	
	public int compInsert(CompVO cvo);

	public boolean compUpdate(CompVO cvo);

	public int cp_BnumConfirm(String cp_Bnum);

	public CompVO findComp(CompVO cvo);

	public CompVO compPwChange(CompVO cvo);

	public int compPwChange2(CompVO cvo);

}
