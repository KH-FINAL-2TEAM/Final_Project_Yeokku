package com.kh.yeokku.model.dto;

import java.util.Date;

public class NoticeDto {
	//db 변수
	private int notice_no;
	private int notice_userno;
	private String notice_title;
	private String notice_content;
	private Date notice_reg_date;
	private int notice_reg_view;
	
	private UserDto user_dto; // 쿼리로 join할 dto
	
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDto(int notice_no, int notice_usrrno, String notice_title, String notice_content, Date notice_reg_date,
			int notice_reg_view, UserDto user_dto) {
		super();
		this.notice_no = notice_no;
		this.notice_userno = notice_usrrno;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_reg_date = notice_reg_date;
		this.notice_reg_view = notice_reg_view;
		this.user_dto = user_dto;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getNotice_usrrno() {
		return notice_userno;
	}

	public void setNotice_usrrno(int notice_usrrno) {
		this.notice_userno = notice_usrrno;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_reg_date() {
		return notice_reg_date;
	}

	public void setNotice_reg_date(Date notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}

	public int getNotice_reg_view() {
		return notice_reg_view;
	}

	public void setNotice_reg_view(int notice_reg_view) {
		this.notice_reg_view = notice_reg_view;
	}

	public UserDto getUser_dto() {
		return user_dto;
	}

	public void setUser_dto(UserDto user_dto) {
		this.user_dto = user_dto;
	}
	
	
}
