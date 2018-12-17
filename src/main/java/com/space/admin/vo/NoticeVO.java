package com.space.admin.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO{
	// 공지사항 번호 
    private int nt_num;
    // 관리자 번호 
    private int ad_num;
    // 공지사항 제목 
    private String nt_title;
    // 공지사항 내용 
    private String nt_content;
    // 공지사항 첨부파일 
    private MultipartFile file;
    //실제 서버 저장한 파일명
    private String nt_file="";
    // 공지사항 조회수 
    private int nt_views;
    // 공지사항 작성일 
    private String nt_date;
}
