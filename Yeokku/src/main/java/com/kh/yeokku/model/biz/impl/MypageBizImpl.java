package com.kh.yeokku.model.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.MypageBiz;
import com.kh.yeokku.model.dao.MypageDao;
import com.kh.yeokku.model.dao.impl.MypageDaoImpl;
import com.kh.yeokku.model.dto.LikeTourDto;
import com.kh.yeokku.model.dto.ProfileDto;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;
import com.kh.yeokku.model.dto.TourReviewDto;
import com.kh.yeokku.model.dto.UserDto;

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

	@Override
	public int resign(int user_no) {
		return dao.resign(user_no);
	}

	@Override
	public int userInfoUpdate(UserDto dto) {
		return dao.userInfoUpdate(dto);
	}

	@Override
	public List<QaDto> userQnaAllList(QaDto dto) {
		return dao.userQnaAllList(dto);
	}

	@Override
	public List<QaDto> userQnaList(QaDto dto) {
		return dao.userQnaList(dto);
	}

	@Override
	public List<LikeTourDto> mypageTravel(int no) {
		return dao.mypageTravel(no);
	}

	@Override
	public List<TourReviewDto> tourReviewList(int tr_userno) {
		return dao.tourReviewList(tr_userno);
	}

	@Override
	public List<TourCourseReviewDto> courseReviewList(int tcr_userno) {
		return dao.courseReviewList(tcr_userno);
	}

}
