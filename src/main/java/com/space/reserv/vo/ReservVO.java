package com.space.reserv.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservVO {

	private int res_Num; // 예약번호
	private String res_Date; // 예약일
	private String resUseDate; // 이용기간
	private int res_Amount; // 결제금액
	private int res_State; // 예약상태
	private String mem_Id; // 회원ID
	private int sp_Num; // 공간번호
	private int restSpace; // 공간재고갯수

	// 관리자 추가
	private int cp_Num;// 업체번호
	private String mem_Name;
	private Date mem_Birth;
	private String sp_Name;// 공간명
	private String sp_Type;// 공간유형
	private String cp_Name;// 업체명
	private String res_UseDate; // 예약 사용하는 달
	private int count;

	// 찜목록
	private int like_Num;
	private String like_Date;
	private int like_Amount;
	private String sp_Address;

	public ReservVO() {
		super();
	}

}
