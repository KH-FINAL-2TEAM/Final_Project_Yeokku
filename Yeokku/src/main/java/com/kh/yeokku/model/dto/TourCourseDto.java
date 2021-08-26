package com.kh.yeokku.model.dto;

import java.util.Date;

public class TourCourseDto {
	//db 변수
	private int tc_no;
	private int tc_userno;
	private String tc_title;
	private int tc_days;
	private int tc_day;
	private String tc_region;
	private int tc_pre_contentid;
	private int tc_next_contentid;
	private int tc_contentid;
	private int tc_contenttypeid;
	private Date tc_date;
	private int tc_view;
	
	//select 변수
	private int tc_lt_cnt ; //좋아요 수 담는 변수
	
	private UserDto user_dto; // 쿼리로 join할 dto

	public TourCourseDto() {
		// TODO Auto-generated constructor stub
	}

	public TourCourseDto(int tc_no, int tc_userno, String tc_title, int tc_days, int tc_day, String tc_region,
			int tc_pre_contentid, int tc_next_contentid, int tc_contentid, int tc_contenttypeid, Date tc_date,
			int tc_view, int tc_lt_cnt, UserDto user_dto) {
		super();
		this.tc_no = tc_no;
		this.tc_userno = tc_userno;
		this.tc_title = tc_title;
		this.tc_days = tc_days;
		this.tc_day = tc_day;
		this.tc_region = tc_region;
		this.tc_pre_contentid = tc_pre_contentid;
		this.tc_next_contentid = tc_next_contentid;
		this.tc_contentid = tc_contentid;
		this.tc_contenttypeid = tc_contenttypeid;
		this.tc_date = tc_date;
		this.tc_view = tc_view;
		this.tc_lt_cnt = tc_lt_cnt;
		this.user_dto = user_dto;
	}

	public int getTc_no() {
		return tc_no;
	}

	public void setTc_no(int tc_no) {
		this.tc_no = tc_no;
	}

	public int getTc_userno() {
		return tc_userno;
	}

	public void setTc_userno(int tc_userno) {
		this.tc_userno = tc_userno;
	}

	public String getTc_title() {
		return tc_title;
	}

	public void setTc_title(String tc_title) {
		this.tc_title = tc_title;
	}

	public int getTc_days() {
		return tc_days;
	}

	public void setTc_days(int tc_days) {
		this.tc_days = tc_days;
	}

	public int getTc_day() {
		return tc_day;
	}

	public void setTc_day(int tc_day) {
		this.tc_day = tc_day;
	}

	public String getTc_region() {
		return tc_region;
	}

	public void setTc_region(String tc_region) {
		this.tc_region = tc_region;
	}

	public int getTc_pre_contentid() {
		return tc_pre_contentid;
	}

	public void setTc_pre_contentid(int tc_pre_contentid) {
		this.tc_pre_contentid = tc_pre_contentid;
	}

	public int getTc_next_contentid() {
		return tc_next_contentid;
	}

	public void setTc_next_contentid(int tc_next_contentid) {
		this.tc_next_contentid = tc_next_contentid;
	}

	public int getTc_contentid() {
		return tc_contentid;
	}

	public void setTc_contentid(int tc_contentid) {
		this.tc_contentid = tc_contentid;
	}

	public int getTc_contenttypeid() {
		return tc_contenttypeid;
	}

	public void setTc_contenttypeid(int tc_contenttypeid) {
		this.tc_contenttypeid = tc_contenttypeid;
	}

	public Date getTc_date() {
		return tc_date;
	}

	public void setTc_date(Date tc_date) {
		this.tc_date = tc_date;
	}

	public int getTc_view() {
		return tc_view;
	}

	public void setTc_view(int tc_view) {
		this.tc_view = tc_view;
	}

	public int getTc_lt_cnt() {
		return tc_lt_cnt;
	}

	public void setTc_lt_cnt(int tc_lt_cnt) {
		this.tc_lt_cnt = tc_lt_cnt;
	}

	public UserDto getUser_dto() {
		return user_dto;
	}

	public void setUser_dto(UserDto user_dto) {
		this.user_dto = user_dto;
	}
	
	
}
