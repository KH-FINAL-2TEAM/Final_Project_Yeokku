package com.kh.yeokku.model.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.MypageBiz;
import com.kh.yeokku.model.dao.MypageDao;
import com.kh.yeokku.model.dao.impl.MypageDaoImpl;
import com.kh.yeokku.model.dto.ProfileDto;

@Service
public class MypageBizImpl implements MypageBiz {

	@Autowired
	private MypageDao dao;

	@Override
	public int profileUpload(ProfileDto pfdto) {
		// TODO Auto-generated method stub
		return dao.profileUpload(pfdto);
	}

	@Override
	public boolean profileCheck(int user_no) {
		return dao.profileCheck(user_no);
	}

	@Override
	public int profileUpdate(ProfileDto pfdto) {
		return dao.profileUpdate(pfdto);
	}

}
