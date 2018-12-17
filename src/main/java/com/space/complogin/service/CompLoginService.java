package com.space.complogin.service;

import com.space.complogin.vo.CompLoginVO;

public interface CompLoginService {
	public CompLoginVO cp_IdSelect(String cp_Id);
	public CompLoginVO compLoginSelect(String cp_Id, String cp_Pw);
	
	public int compLoginHistoryInsert(CompLoginVO lvo);
	public int compLoginHistoryUpdate(CompLoginVO lvo);
	public CompLoginVO compLoginHistorySelect(String cp_Id);
}
