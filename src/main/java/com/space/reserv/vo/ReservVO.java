package com.space.reserv.vo;

import lombok.Data;

@Data
public class ReservVO {

	private int res_Num;
	private String res_Date;
	private String resUseDate;
	private int res_Amount;
	private int res_State;
	private String mem_Id;
	private int sp_Num;
	private int restSpace;

	public ReservVO() {
		super();
	}

}
