package com.space.comp.service;

//import com.space.comp.vo.CompSecurity;
import com.space.comp.vo.CompVO;

public interface CompService {

	public int cp_idConfirm(String cp_Id);
	
	public CompVO compSelect(String cp_Id);
	
	public int compInsert(CompVO cvo);

	public boolean compUpdate(CompVO cvo);

	//public int securityInsert(CompSecurity sec);

}
