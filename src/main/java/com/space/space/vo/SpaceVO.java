package com.space.space.vo;

import org.springframework.web.multipart.MultipartFile;

import com.space.common.vo.CommonVO;

import lombok.Data;

// 공간
@Data
public class SpaceVO extends CommonVO{

	// 공간 번호
	private int sp_Num;

	// 공간 이름
	private String sp_Name;

	// 공간 설명
	private String sp_Exposition;

	// 공간 유형
	private String sp_Type;
	
	private int sp_Stock;

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
	//업체 아이디
	private String cp_Id;

	// 공간 교통편
	private String sp_Traffic;
	
	//공간 재고
	private int sp_Rest;
	
	//공간 사용일
	private String resUseDate;
	
	private String cp_Name;


	
}