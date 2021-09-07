package com.kh.yeokku.model.dto;

import java.util.Date;

public class UserDto {
	//db 변수
	private int user_no; 
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_nickname;
	private int user_postcode;
	private String user_address;
	private String user_extraaddress;
	private Date user_reg_date;
	private String user_able;
	private String user_role;
	
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}


	public UserDto(int user_no, String user_id, String user_pw, String user_name, String user_email,
			String user_nickname, int user_postcode, String user_address, String user_extraaddress, Date user_reg_date,
			String user_able, String user_role) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.user_postcode = user_postcode;
		this.user_address = user_address;
		this.user_extraaddress = user_extraaddress;
		this.user_reg_date = user_reg_date;
		this.user_able = user_able;
		this.user_role = user_role;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_nickname() {
		return user_nickname;
	}


	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}


	public int getUser_postcode() {
		return user_postcode;
	}


	public void setUser_postcode(int user_postcode) {
		this.user_postcode = user_postcode;
	}


	public String getUser_address() {
		return user_address;
	}


	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}


	public String getUser_extraaddress() {
		return user_extraaddress;
	}


	public void setUser_extraaddress(String user_extraaddress) {
		this.user_extraaddress = user_extraaddress;
	}


	public Date getUser_reg_date() {
		return user_reg_date;
	}


	public void setUser_reg_date(Date user_reg_date) {
		this.user_reg_date = user_reg_date;
	}


	public String getUser_able() {
		return user_able;
	}


	public void setUser_able(String user_able) {
		this.user_able = user_able;
	}


	public String getUser_role() {
		return user_role;
	}


	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}


	
	
	
	
}
