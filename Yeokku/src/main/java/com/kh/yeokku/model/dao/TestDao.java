package com.kh.yeokku.model.dao;

import java.util.List;

import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;

public interface TestDao {
	String NAMESPACE="test.";
	public StringBuilder CourseTourList(String contenttypeid); //투어 api url 생성
	public StringBuilder tourSearchList(String contenttypeid,String keyword); //검색기준 투어 api url 생성
	public int insertCourseReview(TourCourseReviewDto dto); // 코스 리뷰 작성
	public List<TourCourseReviewDto> courceReviewList(int tc_no); // 코스 리뷰 리스트 조회
	public int updateCourseReview(TourCourseReviewDto dto); //코스 리뷰 수정
	public int deleteCourseReview(int tcr_no); // 코스 리뷰 삭제
	public int courseReviewReport(ReportDto dto);//리뷰 신고
	public boolean reportChk(ReportDto dto); //신고 체크
}
