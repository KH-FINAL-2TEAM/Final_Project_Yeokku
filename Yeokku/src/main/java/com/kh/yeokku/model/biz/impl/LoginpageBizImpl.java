package com.kh.yeokku.model.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.LoginpageBiz;
import com.kh.yeokku.model.dao.LoginpageDao;

@Service
public class LoginpageBizImpl implements LoginpageBiz{

	@Autowired
	private LoginpageDao dao;
	
	//아이디 중복 확인
	@Override
	public String idChk(String user_id) {
		return dao.idChk(user_id);
	}

}
