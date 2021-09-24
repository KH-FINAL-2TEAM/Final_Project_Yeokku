package com.kh.yeokku.model.dto;

import java.util.Date;

public class TourCourseReviewDto {
	//db 변수
	private int tcr_no;
	private int tcr_tcno;
	private int tcr_userno;
	private String tcr_content;
	private Date tcr_date;

	private UserDto user_dto; // 쿼리로 join할 유저 dto
	private ProfileDto profile_dto;
	private TourCourseDto tour_course_dto; // 쿼리로 join할 여행코스 dto
	
	public TourCourseReviewDto() {
		// TODO Auto-generated constructor stub
	}

	
	public TourCourseReviewDto(int tcr_no, int tcr_tcno, int tcr_userno, String tcr_content, Date tcr_date,
			UserDto user_dto, ProfileDto profile_dto, TourCourseDto tour_course_dto) {
		super();
		this.tcr_no = tcr_no;
		this.tcr_tcno = tcr_tcno;
		this.tcr_userno = tcr_userno;
		this.tcr_content = tcr_content;
		this.tcr_date = tcr_date;
		this.user_dto = user_dto;
		this.profile_dto = profile_dto;
		this.tour_course_dto = tour_course_dto;
	}


	public int getTcr_no() {
		return tcr_no;
	}

	public void setTcr_no(int tcr_no) {
		this.tcr_no = tcr_no;
	}

	public int getTcr_tcno() {
		return tcr_tcno;
	}

	public void setTcr_tcno(int tcr_tcno) {
		this.tcr_tcno = tcr_tcno;
	}

	public int getTcr_userno() {
		return tcr_userno;
	}

	public void setTcr_userno(int tcr_userno) {
		this.tcr_userno = tcr_userno;
	}

	public String getTcr_content() {
		return tcr_content;
	}

	public void setTcr_content(String tcr_content) {
		this.tcr_content = tcr_content;
	}

	public Date getTcr_date() {
		return tcr_date;
	}

	public void setTcr_date(Date tcr_date) {
		this.tcr_date = tcr_date;
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


	public ProfileDto getProfile_dto() {
		return profile_dto;
	}


	public void setProfile_dto(ProfileDto profile_dto) {
		this.profile_dto = profile_dto;
	}


	@Override
	public String toString() {
		return "TourCourseReviewDto [tcr_no=" + tcr_no + ", tcr_tcno=" + tcr_tcno + ", tcr_userno=" + tcr_userno
				+ ", tcr_content=" + tcr_content + ", tcr_date=" + tcr_date + ", user_dto=" + user_dto
				+ ", profile_dto=" + profile_dto + ", tour_course_dto=" + tour_course_dto + "]";
	}

	
}
