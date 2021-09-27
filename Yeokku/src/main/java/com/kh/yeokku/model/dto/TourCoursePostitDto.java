package com.kh.yeokku.model.dto;

import java.util.Date;

public class TourCoursePostitDto {
	//db 변수
	private int tcp_no;
	private int tcp_tcno;
	private int tcp_userno;
	private int tcp_contentid;
	private int tcp_contenttypeid;
	private String tcp_content;
	private Date tcp_date;

	private UserDto user_dto; // 쿼리로 join할 유저 dto
	private TourCourseDto tour_course_dto; // 쿼리로 join할 여행코스 dto
	
	public TourCoursePostitDto() {
		// TODO Auto-generated constructor stub
	}

	public TourCoursePostitDto(int tcp_no, int tcp_tcno, int tcp_userno, int tcp_contentid, int tcp_contenttypeid,
			String tcp_content, Date tcp_date, UserDto user_dto, TourCourseDto tour_course_dto) {
		super();
		this.tcp_no = tcp_no;
		this.tcp_tcno = tcp_tcno;
		this.tcp_userno = tcp_userno;
		this.tcp_contentid = tcp_contentid;
		this.tcp_contenttypeid = tcp_contenttypeid;
		this.tcp_content = tcp_content;
		this.tcp_date = tcp_date;
		this.user_dto = user_dto;
		this.tour_course_dto = tour_course_dto;
	}

	public int getTcp_no() {
		return tcp_no;
	}

	public void setTcp_no(int tcp_no) {
		this.tcp_no = tcp_no;
	}

	public int getTcp_tcno() {
		return tcp_tcno;
	}

	public void setTcp_tcno(int tcp_tcno) {
		this.tcp_tcno = tcp_tcno;
	}

	public int getTcp_userno() {
		return tcp_userno;
	}

	public void setTcp_userno(int tcp_userno) {
		this.tcp_userno = tcp_userno;
	}

	public int getTcp_contentid() {
		return tcp_contentid;
	}

	public void setTcp_contentid(int tcp_contentid) {
		this.tcp_contentid = tcp_contentid;
	}

	public int getTcp_contenttypeid() {
		return tcp_contenttypeid;
	}

	public void setTcp_contenttypeid(int tcp_contenttypeid) {
		this.tcp_contenttypeid = tcp_contenttypeid;
	}

	public String getTcp_content() {
		return tcp_content;
	}

	public void setTcp_content(String tcp_content) {
		this.tcp_content = tcp_content;
	}

	public Date getTcp_date() {
		return tcp_date;
	}

	public void setTcp_date(Date tcp_date) {
		this.tcp_date = tcp_date;
	}

	public UserDto getUser_dto() {
		return user_dto;
	}

	public void setUser_dto(UserDto user_dto) {
		this.user_dto = user_dto;
	}

	public TourCourseDto getTour_course_dto() {
		return tour_course_dto;
	}

	public void setTour_course_dto(TourCourseDto tour_course_dto) {
		this.tour_course_dto = tour_course_dto;
	}
	
	
}
