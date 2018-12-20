package com.space.complogin.vo;

import lombok.Data;

@Data
public class CompLoginVO extends CompLoginHistory {
	private String cp_Id = "";
	private String cp_Pw = "";
	private String cp_Name = "";
	private int cp_Num;


}
