package com.space.comp.vo;

import com.space.complogin.vo.CompLoginVO;

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

	public CompVO() {}

	public CompVO(int cp_Num, String cp_Ceo, String cp_Add, String cp_Bnum, String cp_Bank, String cp_Account,
			String cp_Email, String cp_Phone, String cp_Date, int cp_State, int cp_Joinstate, String cp_Outdate) {
		super();
		this.cp_Num = cp_Num;
		this.cp_Ceo = cp_Ceo;
		this.cp_Add = cp_Add;
		this.cp_Bnum = cp_Bnum;
		this.cp_Bank = cp_Bank;
		this.cp_Account = cp_Account;
		this.cp_Email = cp_Email;
		this.cp_Phone = cp_Phone;
		this.cp_Date = cp_Date;
		this.cp_State = cp_State;
		this.cp_Joinstate = cp_Joinstate;
		this.cp_Outdate = cp_Outdate;
	}

	public int getCp_Num() {
		return cp_Num;
	}

	public void setCp_Num(int cp_Num) {
		this.cp_Num = cp_Num;
	}

	public String getCp_Ceo() {
		return cp_Ceo;
	}

	public void setCp_Ceo(String cp_Ceo) {
		this.cp_Ceo = cp_Ceo;
	}

	public String getCp_Add() {
		return cp_Add;
	}

	public void setCp_Add(String cp_Add) {
		this.cp_Add = cp_Add;
	}

	public String getCp_Bnum() {
		return cp_Bnum;
	}

	public void setCp_Bnum(String cp_Bnum) {
		this.cp_Bnum = cp_Bnum;
	}

	public String getCp_Bank() {
		return cp_Bank;
	}

	public void setCp_Bank(String cp_Bank) {
		this.cp_Bank = cp_Bank;
	}

	public String getCp_Account() {
		return cp_Account;
	}

	public void setCp_Account(String cp_Account) {
		this.cp_Account = cp_Account;
	}

	public String getCp_Email() {
		return cp_Email;
	}

	public void setCp_Email(String cp_Email) {
		this.cp_Email = cp_Email;
	}

	public String getCp_Phone() {
		return cp_Phone;
	}

	public void setCp_Phone(String cp_Phone) {
		this.cp_Phone = cp_Phone;
	}

	public String getCp_Date() {
		return cp_Date;
	}

	public void setCp_Date(String cp_Date) {
		this.cp_Date = cp_Date;
	}

	public int getCp_State() {
		return cp_State;
	}

	public void setCp_State(int cp_State) {
		this.cp_State = cp_State;
	}

	public int getCp_Joinstate() {
		return cp_Joinstate;
	}

	public void setCp_Joinstate(int cp_Joinstate) {
		this.cp_Joinstate = cp_Joinstate;
	}

	public String getCp_Outdate() {
		return cp_Outdate;
	}

	public void setCp_Outdate(String cp_Outdate) {
		this.cp_Outdate = cp_Outdate;
	}

	
	
}