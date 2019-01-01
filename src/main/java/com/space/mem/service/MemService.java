package com.space.mem.service;

import java.util.List;

import com.space.mem.vo.MemVO;
import com.space.reserv.vo.ReservVO;

public interface MemService {
	public int memIdConfirm(String mem_Id);

	public MemVO memSelect(String mem_Id);

	public int memInsert(MemVO mvo);

	public boolean memUpdate(MemVO mvo);

	public int memDelete(String mem_Id);
	
	public MemVO findMember(MemVO mvo);

	public MemVO pwChange(MemVO mvo);

	public int pwChange2(MemVO mvo);
	
	public List<ReservVO> reservList(MemVO mvo);
	
	public void updateState();
}
