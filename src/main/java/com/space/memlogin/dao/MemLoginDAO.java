package com.space.memlogin.dao;

import com.space.memlogin.vo.LoginVO;

public interface MemLoginDAO {
	public LoginVO mem_IdSelect(String mem_Id);

	public LoginVO loginSelect(LoginVO lvo);
	
	public LoginVO loginSelect2(LoginVO lvo);

	public int loginHistoryInsert(LoginVO lvo);

	public int loginHistoryUpdate(LoginVO lvo);

	public LoginVO loginHistorySelect(String mem_Id);
	
}
