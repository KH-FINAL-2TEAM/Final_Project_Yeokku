package com.kh.yeokku.model.biz;

import java.io.IOException;
import java.util.List;

import com.google.gson.JsonArray;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.RoomDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;

public interface TestBiz {
	public JsonArray CourseTourList(String contenttypeid) throws IOException; //투어 api url 객체생성 
	public JsonArray tourSearchList(String contenttypeid,String keyword) throws IOException; //검색기준 투어 api url 생성
	public JsonArray parSer(StringBuilder sb); //api 리턴 파서
	public int insertCourseReview(TourCourseReviewDto dto); // 코스 리뷰 작성
	public List<TourCourseReviewDto> courceReviewList(int room); // 코스 리뷰 리스트 조회
	public int updateCourseReview(TourCourseReviewDto dto); // 코스 리뷰 수정
	public int deleteCourseReview(int tcr_no); // 코스 리뷰 삭제
	public int courseReviewReport(ReportDto dto); // 리뷰 신고
	public boolean reportChk(ReportDto dto); // 신고 체크
	public List<RoomDto> courseSearch(String keyword); // 여행코스 리스트 검색 조회

}
