package com.kh.yeokku.model.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.LoginpageDao;
import com.kh.yeokku.model.dto.ProfileDto;
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
		dto = sqlSession.selectOne(NAMESPACE+"idchk", user_id);
		
		if(dto!=null) {
			
			res = dto.getUser_id(); 
			return res;
		}else {
			
			res = "none";
			return res;
		}
	}

	//회원가입 
	@Override
	public int insert(UserDto dto) {
		int res = 0;
		
		System.out.println(dto.toString());
		
		try {
			res = sqlSession.insert(NAMESPACE+"signup", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	//로그인
	@Override
	public UserDto login(UserDto dto) {
		UserDto user = null;
		
		try {
			user = sqlSession.selectOne(NAMESPACE+"login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
		
	}

	//아이디 찾기 
	@Override
	public UserDto findId(UserDto dto) {
		UserDto user = null;
		
		user = sqlSession.selectOne(NAMESPACE+"idfind", dto);
		
		
		return user;
	}
	//비밀번호 찾기 
	@Override
	public UserDto findPw(UserDto dto) {
		UserDto user = null;
		
		user = sqlSession.selectOne(NAMESPACE+"pwfind", dto);
		
		
		return user;
	}

	//프로필사진
	@Override
	public ProfileDto profile(UserDto user) {
		ProfileDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"profile",user);
		} catch (Exception e) {
			System.out.println("[error] : user profile info error");
			e.printStackTrace();
		}
		
		return res;
	}

	
	//소셜로그인 db insert
	@Override
	public int kakao_insert(UserDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"kakaologin", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
