package com.space.comp.vo;

public class CompSecurity {

	private String cp_Id;
	private String salt;

	public CompSecurity() {
	}

	public CompSecurity(String cp_Id, String salt) {
		super();
		this.cp_Id = cp_Id;
		this.salt = salt;
	}

	public String getCp_Id() {
		return cp_Id;
	}

	public void setCp_Id(String cp_Id) {
		this.cp_Id = cp_Id;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

}