package com.kh.yeokku.model.dto;

public class LikeTourDto {
	//db 변수
	private int lt_contentid;
	private int lt_contenttypeid;
	private int lt_userno;
	
	private UserDto user_dto; // 쿼리로 join할 dto
	
	public LikeTourDto() {
		// TODO Auto-generated constructor stub
	}

	public LikeTourDto(int lt_contentid, int lt_contenttypeid, int lt_userno, UserDto user_dto) {
		super();
		this.lt_contentid = lt_contentid;
		this.lt_contenttypeid = lt_contenttypeid;
		this.lt_userno = lt_userno;
		this.user_dto = user_dto;
	}

	public int getLt_contentid() {
		return lt_contentid;
	}

	public void setLt_contentid(int lt_contentid) {
		this.lt_contentid = lt_contentid;
	}

	public int getLt_contenttypeid() {
		return lt_contenttypeid;
	}

	public void setLt_contenttypeid(int lt_contenttypeid) {
		this.lt_contenttypeid = lt_contenttypeid;
	}

	public int getLt_userno() {
		return lt_userno;
	}

	public void setLt_userno(int lt_userno) {
		this.lt_userno = lt_userno;
	}

	public UserDto getUser_dto() {
		return user_dto;
	}

	public void setUser_dto(UserDto user_dto) {
		this.user_dto = user_dto;
	}
	
	
}
