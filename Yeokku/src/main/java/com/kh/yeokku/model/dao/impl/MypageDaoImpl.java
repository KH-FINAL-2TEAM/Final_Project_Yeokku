package com.kh.yeokku.model.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.MypageDao;
import com.kh.yeokku.model.dto.ProfileDto;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int profileUpload(ProfileDto pfdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"profile_upload",pfdto);
			
		} catch (Exception e) {
			System.out.println("[error] : profile upload error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public boolean profileCheck(int user_no) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"profile_check",user_no);
			System.out.println("개수 : " +res);
			
		} catch (Exception e) {
			System.out.println("[error] : profile check error");
			e.printStackTrace();
		}
		
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int profileUpdate(ProfileDto pfdto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"profile_update",pfdto);
			
		} catch (Exception e) {
			System.out.println("[error] : profile update error");
			e.printStackTrace();
		}
		return res;
	}

}
