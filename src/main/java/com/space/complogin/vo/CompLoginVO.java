package com.space.complogin.vo;

public class CompLoginVO extends CompLoginHistory {
	private String cp_Id = "";
	private String cp_Pw = "";
	private String cp_Name = "";
	private int cp_Num;

	public CompLoginVO() {}

	public CompLoginVO(String cp_Id, String cp_Pw, String cp_Name) {
		super();
		this.cp_Id = cp_Id;
		this.cp_Pw = cp_Pw;
		this.cp_Name = cp_Name;
	}
	
	

	public int getCp_Num() {
		return cp_Num;
	}

	public void setCp_Num(int cp_Num) {
		this.cp_Num = cp_Num;
	}

	public String getCp_Id() {
		return cp_Id;
	}

	public void setCp_Id(String cp_Id) {
		this.cp_Id = cp_Id;
	}

	public String getCp_Pw() {
		return cp_Pw;
	}

	public void setCp_Pw(String cp_Pw) {
		this.cp_Pw = cp_Pw;
	}

	public String getCp_Name() {
		return cp_Name;
	}

	public void setCp_Name(String cp_Name) {
		this.cp_Name = cp_Name;
	}

}