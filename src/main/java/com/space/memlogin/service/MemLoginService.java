package com.space.memlogin.service;

import com.space.memlogin.vo.LoginVO;

public interface MemLoginService {
	public LoginVO mem_IdSelect(String mem_Id);
	public LoginVO loginSelect(String mem_Id, String mem_Pw);
	public LoginVO loginSelect2(String mem_Id);
	public int loginHistoryInsert(LoginVO lvo);
	public int loginHistoryUpdate(LoginVO lvo);
	public LoginVO loginHistorySelect(String mem_Id);
}
