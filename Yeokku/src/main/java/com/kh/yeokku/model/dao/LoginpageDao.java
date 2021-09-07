package com.kh.yeokku.model.dao;

import com.kh.yeokku.model.dto.UserDto;

public interface LoginpageDao {
	
	String NAMESPACE = "myuser.";
	
	public String idChk(String user_id);//아이디 중복 확인
	public int insert(UserDto dto);//회원가입 
	public UserDto login(UserDto dto);//로그인
	public UserDto findId(UserDto dto);//아이디 찾기 
	public UserDto findPw(UserDto dto);//아이디 찾기 
}
