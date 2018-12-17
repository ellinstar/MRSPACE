package com.space.mem.vo;
 
public class MemSecurity { 
    private String mem_Id;
    private String salt;

	public MemSecurity() { }

	public MemSecurity(String mem_Id, String salt) {
		super();
		this.mem_Id = mem_Id;
		this.salt = salt;
	}

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Override
	public String toString() {
		return "MemSecurity [mem_Id=" + mem_Id + ", salt=" + salt + "]";
	}
	
}