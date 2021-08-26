package com.kh.yeokku.model.dto;

public class ProfileDto {
	//db 변수
	private int pf_no;
	private int pf_userno;
	private String pf_name;
	private String pf_src;
	private String pf_type;
	private int pf_size;
	
	private UserDto user_dto; // 쿼리로 join할 dto
	
	public ProfileDto() {
		// TODO Auto-generated constructor stub
	}

	public ProfileDto(int pf_no, int pf_userno, String pf_name, String pf_src, String pf_type, int pf_size,
			UserDto user_dto) {
		super();
		this.pf_no = pf_no;
		this.pf_userno = pf_userno;
		this.pf_name = pf_name;
		this.pf_src = pf_src;
		this.pf_type = pf_type;
		this.pf_size = pf_size;
		this.user_dto = user_dto;
	}

	public int getPf_no() {
		return pf_no;
	}

	public void setPf_no(int pf_no) {
		this.pf_no = pf_no;
	}

	public int getPf_userno() {
		return pf_userno;
	}

	public void setPf_userno(int pf_userno) {
		this.pf_userno = pf_userno;
	}

	public String getPf_name() {
		return pf_name;
	}

	public void setPf_name(String pf_name) {
		this.pf_name = pf_name;
	}

	public String getPf_src() {
		return pf_src;
	}

	public void setPf_src(String pf_src) {
		this.pf_src = pf_src;
	}

	public String getPf_type() {
		return pf_type;
	}

	public void setPf_type(String pf_type) {
		this.pf_type = pf_type;
	}

	public int getPf_size() {
		return pf_size;
	}

	public void setPf_size(int pf_size) {
		this.pf_size = pf_size;
	}

	public UserDto getUserboardDto() {
		return user_dto;
	}

	public void setUserboardDto(UserDto user_dto) {
		this.user_dto = user_dto;
	}
	
	
	
}
