package com.kh.yeokku.model.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.LoginpageBiz;
import com.kh.yeokku.model.dao.LoginpageDao;
import com.kh.yeokku.model.dto.UserDto;

@Service
public class LoginpageBizImpl implements LoginpageBiz{

	@Autowired
	private LoginpageDao dao;
	
	//아이디 중복 확인
	@Override
	public String idChk(String user_id) {
		return dao.idChk(user_id);
	}

	//회원가입 
	@Override
	public int insert(UserDto dto) {
		return dao.insert(dto);
	}

	//로그인
	@Override
	public UserDto login(UserDto dto) {
		return dao.login(dto);
	}

	//아이디 찾기 
	@Override
	public UserDto findId(UserDto dto) {
		return dao.findId(dto);
	}

	//비밀번호 찾기 
	@Override
	public UserDto findPw(UserDto dto) {
		return dao.findPw(dto);
	}

}
