package com.kh.yeokku.model.dao;

public interface LoginpageDao {
	
	String NAMESPACE = "myuser.";//맵퍼 추가하기 
	
	//아이디 중복 확인 
	public String idChk(String user_id);
}
