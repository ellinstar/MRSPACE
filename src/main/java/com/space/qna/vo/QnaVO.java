package com.space.qna.vo;

import lombok.Data;

@Data
public class QnaVO extends CommonVO {
	
	// 문의게시판 번호
	private int qna_Num;

	// 작성자
	private String qna_Name = "";

	// 문의 제목
	private String qna_Title = "";

	// 문의 내용
	private String qna_Content = "";

	// 문의 작성일
	private String qna_Date = "";

	// 문의 비밀번호
	private String qna_Pw = "";

	
	public int getQna_Num() {
		return qna_Num;
	}

	public void setQna_Num(int qna_Num) {
		this.qna_Num = qna_Num;
	}

	public String getQna_Name() {
		return qna_Name;
	}

	public void setQna_Name(String qna_Name) {
		this.qna_Name = qna_Name;
	}

	public String getQna_Title() {
		return qna_Title;
	}

	public void setQna_Title(String qna_Title) {
		this.qna_Title = qna_Title;
	}

	public String getQna_Content() {
		return qna_Content;
	}

	public void setQna_Content(String qna_Content) {
		this.qna_Content = qna_Content;
	}

	public String getQna_Date() {
		return qna_Date;
	}

	public void setQna_Date(String qna_Date) {
		this.qna_Date = qna_Date;
	}

	public String getQna_Pw() {
		return qna_Pw;
	}

	public void setQna_Pw(String qna_Pw) {
		this.qna_Pw = qna_Pw;
	}

}
