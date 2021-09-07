package com.kh.yeokku.model.dao;

import com.kh.yeokku.model.dto.ProfileDto;

public interface MypageDao {

	String NAMESPACE="mypage.";
	
	int profileUpload(ProfileDto pfdto);//프로필사진 등록

	boolean profileCheck(int user_no); // 프로필 등록 여부 확인

	int profileUpdate(ProfileDto pfdto); // 프로필 사진 수정

}
