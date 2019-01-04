package com.space.admin.service;

import java.util.HashMap;
import java.util.List;

import com.space.admin.page.Criteria;
import com.space.comp.vo.CompVO;
import com.space.mem.vo.MemVO;
import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;

public interface AdminResService {
	public List<ReservVO> getNewList(Criteria cri);
	public int resCnt(Criteria cri);
	public ReservVO resDetail(int res_Num);
	public MemVO resMem(String mem_Id);
	public SpaceVO resSp(int sp_Num); 
	public List<CompVO> optionCp();
	public List<ReservVO> cpResList(Criteria cri);
	public List<ReservVO> graphCp(String cpNum);

}
