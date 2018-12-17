package com.space.mem.dao;

import com.space.mem.vo.MemSecurity;
import com.space.mem.vo.MemVO;

public interface MemDAO {
	public int securityInsert(MemSecurity set);

	public MemSecurity securitySelect(String mem_Id);

	public int securityDelete(String mem_Id);

	public MemVO memSelect(String mem_Id);

	public int memInsert(MemVO mvo);

	public int memUpdate(MemVO mvo);
	
	public int securityUpdate(MemSecurity set);

	public int memDelete(String mem_Id);
	
	public MemVO findMember(MemVO mvo);

	public MemVO pwChange(MemVO mvo);
	   
	public int pwChange2(MemVO mvo);
}
