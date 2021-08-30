package com.kh.yeokku.model.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.LoginpageDao;
import com.kh.yeokku.model.dto.UserDto;


@Repository
public class LoginpageDaoImpl implements LoginpageDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//아이디 중복 확인 
	@Override
	public String idChk(String user_id) {
		String res;
		UserDto dto;
		dto = sqlSession.selectOne(NAMESPACE+"idchk", user_id);//맵퍼추가하기 
		
		if(dto!=null) {
			
			res = dto.getUser_id(); 
			return res;
		}else {
			
			res = "none";
			return res;
		}
	}

}
