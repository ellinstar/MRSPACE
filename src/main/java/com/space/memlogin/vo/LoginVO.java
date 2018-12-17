package com.space.memlogin.vo;

public class LoginVO extends LoginHistory {
	private String mem_Id = "";
	private String mem_Pw = "";
	private String mem_Name = "";

	public LoginVO() {
		super();
	}

	public LoginVO(String mem_Id, String mem_Pw, String mem_Name) {
		super();
		this.mem_Id = mem_Id;
		this.mem_Pw = mem_Pw;
		this.mem_Name = mem_Name;
	}

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}

	public String getMem_Pw() {
		return mem_Pw;
	}

	public void setMem_Pw(String mem_Pw) {
		this.mem_Pw = mem_Pw;
	}

	public String getMem_Name() {
		return mem_Name;
	}

	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}

}