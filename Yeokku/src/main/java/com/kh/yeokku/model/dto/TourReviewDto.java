package com.kh.yeokku.model.dto;

import java.util.Date;

public class TourReviewDto {
	//db 변수
	private int tr_no;
	private int tr_userno;
	private int tr_contentid;
	private String tr_content;
	private String tr_date;
	
	private UserDto user_dto; // 쿼리로 join할 dto
	private ProfileDto profile_dto;
	
	public TourReviewDto() {
		// TODO Auto-generated constructor stub
	}

	public TourReviewDto(int tr_no, int tr_userno, int tr_contentid, String tr_content, String tr_date, UserDto user_dto,
			ProfileDto profile_dto) {
		super();
		this.tr_no = tr_no;
		this.tr_userno = tr_userno;
		this.tr_contentid = tr_contentid;
		this.tr_content = tr_content;
		this.tr_date = tr_date;
		this.user_dto = user_dto;
		this.profile_dto = profile_dto;
	}

	public int getTr_no() {
		return tr_no;
	}

	public void setTr_no(int tr_no) {
		this.tr_no = tr_no;
	}

	public int getTr_userno() {
		return tr_userno;
	}

	public void setTr_userno(int tr_userno) {
		this.tr_userno = tr_userno;
	}

	public int getTr_contentid() {
		return tr_contentid;
	}

	public void setTr_contentid(int tr_contentid) {
		this.tr_contentid = tr_contentid;
	}

	public String getTr_content() {
		return tr_content;
	}

	public void setTr_content(String tr_content) {
		this.tr_content = tr_content;
	}

	public String getTr_date() {
		return tr_date;
	}

	public void setTr_date(String tr_date) {
		this.tr_date = tr_date;
	}

	public UserDto getUser_dto() {
		return user_dto;
	}

	public void setUser_dto(UserDto user_dto) {
		this.user_dto = user_dto;
	}

	public ProfileDto getProfile_dto() {
		return profile_dto;
	}

	public void setProfile_dto(ProfileDto profile_dto) {
		this.profile_dto = profile_dto;
	}
	
	
}
