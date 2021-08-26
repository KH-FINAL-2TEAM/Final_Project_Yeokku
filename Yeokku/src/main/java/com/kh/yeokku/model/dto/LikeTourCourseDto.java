package com.kh.yeokku.model.dto;

import java.util.Date;

public class LikeTourCourseDto {
	//db 변수
	private int ltc_tcno;
	private int ltc_userno;
	private Date ltc_date;
	
	private UserDto user_dto; // 쿼리로 join할 유저 dto
	private TourCourseDto tour_course_dto; // 쿼리로 join할 여행코스 dto
	
	public LikeTourCourseDto() {
		// TODO Auto-generated constructor stub
	}

	public LikeTourCourseDto(int ltc_tcno, int ltc_userno, Date ltc_date, UserDto user_dto,
			TourCourseDto tour_course_dto) {
		super();
		this.ltc_tcno = ltc_tcno;
		this.ltc_userno = ltc_userno;
		this.ltc_date = ltc_date;
		this.user_dto = user_dto;
		this.tour_course_dto = tour_course_dto;
	}

	public int getLtc_tcno() {
		return ltc_tcno;
	}

	public void setLtc_tcno(int ltc_tcno) {
		this.ltc_tcno = ltc_tcno;
	}

	public int getLtc_userno() {
		return ltc_userno;
	}

	public void setLtc_userno(int ltc_userno) {
		this.ltc_userno = ltc_userno;
	}

	public Date getLtc_date() {
		return ltc_date;
	}

	public void setLtc_date(Date ltc_date) {
		this.ltc_date = ltc_date;
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
