package com.kh.yeokku.model.dao;

import java.util.List;

import com.kh.yeokku.model.dto.UserDto;

public interface AdminpageDao {

	String NAMESPACE="admin_page.";
	
	public List<UserDto> select_user_list(); //유저 목록 리스트 조회
}