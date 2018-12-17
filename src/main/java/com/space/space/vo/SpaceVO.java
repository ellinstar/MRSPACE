package com.space.space.vo;

import org.springframework.web.multipart.MultipartFile;

// 공간
public class SpaceVO {

	// 공간 번호
	private int sp_Num;

	// 공간 이름
	private String sp_Name;

	// 공간 설명
	private String sp_Exposition;

	// 공간 유형
	private String sp_Type;
	
	private String sp_Stock;

	// 공간 서비스
	private String sp_Service;

	// 공간 가격
	private int sp_Price;

	// 공간 사진
	private MultipartFile file; //첨부파일
	
	
	private String sp_File = "";
	

	// 공간 예약 가능 (가능시 1, 불가능시 -1)
	private int sp_Reservation;

	// 공간 주소
	private String sp_Address;
	
	//임대 계약 시작일
	private String sp_Contract1;
	
	//임대 계약 종료일
		private String sp_Contract2;
		
		//오픈 가능일
		private String sp_Opendate;

	// 등록 상태 (보류 0, 승인 1, 반려 -1)
	private int sp_State;

	// 등록 일자
	private String sp_Date;

	// 업체 번호
	private int cp_Num;

	// 공간 교통편
	private String sp_Traffic;
	
	//공간 재고
	private int sp_Rest;

	public SpaceVO() {
		super();
	}
	
	
	
	

	public String getSp_Opendate() {
		return sp_Opendate;
	}





	public void setSp_Opendate(String sp_Opendate) {
		this.sp_Opendate = sp_Opendate;
	}





	public String getSp_Contract1() {
		return sp_Contract1;
	}





	public void setSp_Contract1(String sp_Contract1) {
		this.sp_Contract1 = sp_Contract1;
	}





	public String getSp_Contract2() {
		return sp_Contract2;
	}





	public void setSp_Contract2(String sp_Contract2) {
		this.sp_Contract2 = sp_Contract2;
	}





	public int getSp_Rest() {
		return sp_Rest;
	}





	public void setSp_Rest(int sp_Rest) {
		this.sp_Rest = sp_Rest;
	}





	public String getSp_Stock() {
		return sp_Stock;
	}



	public void setSp_Stock(String sp_Stock) {
		this.sp_Stock = sp_Stock;
	}



	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getSp_Num() {
		return sp_Num;
	}

	public void setSp_Num(int sp_Num) {
		this.sp_Num = sp_Num;
	}

	public String getSp_Name() {
		return sp_Name;
	}

	public void setSp_Name(String sp_Name) {
		this.sp_Name = sp_Name;
	}

	public String getSp_Exposition() {
		return sp_Exposition;
	}

	public void setSp_Exposition(String sp_Exposition) {
		this.sp_Exposition = sp_Exposition;
	}

	public String getSp_Type() {
		return sp_Type;
	}

	public void setSp_Type(String sp_Type) {
		this.sp_Type = sp_Type;
	}

	public String getSp_Service() {
		return sp_Service;
	}

	public void setSp_Service(String sp_Service) {
		this.sp_Service = sp_Service;
	}

	public int getSp_Price() {
		return sp_Price;
	}

	public void setSp_Price(int sp_Price) {
		this.sp_Price = sp_Price;
	}

	public String getSp_File() {
		return sp_File;
	}

	public void setSp_File(String sp_File) {
		this.sp_File = sp_File;
	}

	public int getSp_Reservation() {
		return sp_Reservation;
	}

	public void setSp_Reservation(int sp_Reservation) {
		this.sp_Reservation = sp_Reservation;
	}

	public String getSp_Address() {
		return sp_Address;
	}

	public void setSp_Address(String sp_Address) {
		this.sp_Address = sp_Address;
	}

	public int getSp_State() {
		return sp_State;
	}

	public void setSp_State(int sp_State) {
		this.sp_State = sp_State;
	}

	public String getSp_Date() {
		return sp_Date;
	}

	public void setSp_Date(String sp_Date) {
		this.sp_Date = sp_Date;
	}

	public int getCp_Num() {
		return cp_Num;
	}

	public void setCp_Num(int cp_Num) {
		this.cp_Num = cp_Num;
	}

	public String getSp_Traffic() {
		return sp_Traffic;
	}

	public void setSp_Traffic(String sp_Traffic) {
		this.sp_Traffic = sp_Traffic;
	}





	@Override
	public String toString() {
		return "SpaceVO [sp_Num=" + sp_Num + ", sp_Name=" + sp_Name + ", sp_Exposition=" + sp_Exposition + ", sp_Type="
				+ sp_Type + ", sp_Stock=" + sp_Stock + ", sp_Service=" + sp_Service + ", sp_Price=" + sp_Price
				+ ", sp_Address=" + sp_Address + ", sp_Contract1=" + sp_Contract1 + ", sp_Contract2=" + sp_Contract2
				+ ", sp_Opendate=" + sp_Opendate + ", sp_Traffic=" + sp_Traffic + ", sp_Rest=" + sp_Rest + "]";
	}
	
	
	
	

	
}