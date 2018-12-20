package com.space.reserv.service;

import com.space.reserv.vo.ReservVO;

public interface ReservService {
	
	public int reservation(ReservVO rvo);
	public int restSpace(ReservVO rvo);
	
}
