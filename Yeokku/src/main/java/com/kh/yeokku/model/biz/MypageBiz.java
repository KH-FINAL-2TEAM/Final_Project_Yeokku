package com.kh.yeokku.model.biz;

import java.util.List;

import com.kh.yeokku.model.dto.LikeTourDto;
import com.kh.yeokku.model.dto.ProfileDto;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.TourCourseDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;
import com.kh.yeokku.model.dto.TourReviewDto;
import com.kh.yeokku.model.dto.UserDto;
import com.kh.yeokku.util.pagingVO;

public interface MypageBiz {

	int profileUpload(ProfileDto pfdto); // 프로필 사진 등록

	boolean profileCheck(int user_no); // 프로필 등록 여부 확인

	int profileUpdate(ProfileDto pfdto); // 프로필 사진 수정

	int resign(int user_no); // 회원 탈퇴

	int userInfoUpdate(UserDto dto); // 회원정보 수정

	List<QaDto> userQnaAllList(QaDto dto); //회원이 문의한 모든 내역 조회

	List<QaDto> userQnaList(QaDto dto); // 처리 상태 기준 회원이 문의한 내역

	List<LikeTourDto> mypageTravel(int no); // 좋아요 여행지 목록

	List<TourReviewDto> tourReviewList(int tr_userno); // 여행지 리뷰 목록

	List<TourCourseReviewDto> courseReviewList(int tcr_userno); // 코스 리뷰 목록
	
	public int countCourse(); /*페이징위한 카운트*/
	
	public List<TourCourseDto> myCourse(pagingVO vo); /*내가 작성한 여행코스 주소 리스트 확인*/
}
