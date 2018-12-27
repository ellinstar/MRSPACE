package com.space.comp.vo;

import com.space.complogin.vo.CompLoginVO;

import lombok.Data;

@Data
// 업체 
public class CompVO extends CompLoginVO{

	// 업체 번호
	private int cp_Num;

	// 대표자명
	private String cp_Ceo;

	// 소재지
	private String cp_Add;

	// 사업자 번호
	private String cp_Bnum;

	// 입금은행
	private String cp_Bank;

	// 입금계좌
	private String cp_Account;

	// 이메일
	private String cp_Email;

	// 연락처
	private String cp_Phone;

	// 업체 가입일
	private String cp_Date;

	// 업체 가입상태
	private int cp_State;

	// 가입 승인 상태
	private int cp_Joinstate;

	// 업체 탈퇴일
	private String cp_Outdate;
}