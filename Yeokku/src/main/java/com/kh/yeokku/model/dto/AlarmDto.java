package com.kh.yeokku.model.dto;

import java.util.Date;

public class AlarmDto {
	//db 변수
	private int alarm_no;
	private int alarm_userno;
	private String alarm_content;
	private String alarm_read;
	private Date alarm_date;
	
	private UserDto user_dto; // 쿼리로 join할 dto
	
	public AlarmDto() {
		// TODO Auto-generated constructor stub
	}

	public AlarmDto(int alarm_no, int alarm_userno, String alarm_content, String alarm_read, Date alarm_date,
			UserDto userDto) {
		super();
		this.alarm_no = alarm_no;
		this.alarm_userno = alarm_userno;
		this.alarm_content = alarm_content;
		this.alarm_read = alarm_read;
		this.alarm_date = alarm_date;
		this.user_dto = user_dto;
	}

	public int getAlarm_no() {
		return alarm_no;
	}

	public void setAlarm_no(int alarm_no) {
		this.alarm_no = alarm_no;
	}

	public int getAlarm_userno() {
		return alarm_userno;
	}

	public void setAlarm_userno(int alarm_userno) {
		this.alarm_userno = alarm_userno;
	}

	public String getAlarm_content() {
		return alarm_content;
	}

	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}

	public String getAlarm_read() {
		return alarm_read;
	}

	public void setAlarm_read(String alarm_read) {
		this.alarm_read = alarm_read;
	}

	public Date getAlarm_date() {
		return alarm_date;
	}

	public void setAlarm_date(Date alarm_date) {
		this.alarm_date = alarm_date;
	}

	public UserDto getUserBoardDto() {
		return user_dto;
	}

	public void setUserBoardDto(UserDto user_dto) {
		this.user_dto = user_dto;
	}
	
	
	
}
