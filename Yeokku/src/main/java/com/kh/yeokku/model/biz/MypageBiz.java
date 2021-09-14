package com.kh.yeokku.model.biz;

import com.kh.yeokku.model.dto.ProfileDto;
import com.kh.yeokku.model.dto.UserDto;

public interface MypageBiz {

	int profileUpload(ProfileDto pfdto); // 프로필 사진 등록

	boolean profileCheck(int user_no); // 프로필 등록 여부 확인

	int profileUpdate(ProfileDto pfdto); // 프로필 사진 수정

	int resign(int user_no); // 회원 탈퇴

	int userInfoUpdate(UserDto dto); // 회원정보 수정

}
