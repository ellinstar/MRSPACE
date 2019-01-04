package com.space.reserv.service;

import com.space.comp.vo.CompVO;
import com.space.mem.vo.MemVO;
import com.space.memlogin.vo.LoginVO;
import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;

public interface ReservService {

	public int reservation(ReservVO rvo);

	public int restSpace(ReservVO rvo);

	// 찜
	public int likeInsert(ReservVO rvo);
	
	//업체 정보
	public CompVO getCompInfo(SpaceVO svo);
	
	// 사용자 정보
	public MemVO getMemInfo(LoginVO rvo);
	
}
