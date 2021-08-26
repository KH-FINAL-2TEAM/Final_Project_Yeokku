package com.kh.yeokku.model.dto;

import java.util.Date;

public class ReportDto {
	//db 변수
	private int report_no;
	private String report_reason;
	private String report_content;
	private int report_userno;
	private int report_target_userno;
	private Date report_date;
	private Date report_done_date;
	private String report_confirm;
	
	private UserDto user_dto; // 쿼리로 join할 dto
	
	public ReportDto() {
		// TODO Auto-generated constructor stub
	}

	public ReportDto(int report_no, String report_reason, String report_content, int report_userno,
			int report_target_userno, Date report_date, Date report_done_date, String report_confirm,
			UserDto user_dto) {
		super();
		this.report_no = report_no;
		this.report_reason = report_reason;
		this.report_content = report_content;
		this.report_userno = report_userno;
		this.report_target_userno = report_target_userno;
		this.report_date = report_date;
		this.report_done_date = report_done_date;
		this.report_confirm = report_confirm;
		this.user_dto = user_dto;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public int getReport_userno() {
		return report_userno;
	}

	public void setReport_userno(int report_userno) {
		this.report_userno = report_userno;
	}

	public int getReport_target_userno() {
		return report_target_userno;
	}

	public void setReport_target_userno(int report_target_userno) {
		this.report_target_userno = report_target_userno;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public Date getReport_done_date() {
		return report_done_date;
	}

	public void setReport_done_date(Date report_done_date) {
		this.report_done_date = report_done_date;
	}

	public String getReport_confirm() {
		return report_confirm;
	}

	public void setReport_confirm(String report_confirm) {
		this.report_confirm = report_confirm;
	}

	public UserDto getUser_dto() {
		return user_dto;
	}

	public void setUser_dto(UserDto user_dto) {
		this.user_dto = user_dto;
	}
	
	
	
}
