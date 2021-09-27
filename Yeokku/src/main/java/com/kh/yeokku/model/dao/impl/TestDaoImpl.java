package com.kh.yeokku.model.dao.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.TestDao;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.RoomDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;
@Repository
public class TestDaoImpl implements TestDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public StringBuilder CourseTourList(String contenttypeid) {
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        // 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
        try {
        	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="); /*Service Key*/
        	urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        	//urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        	urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=AppTest"); 
        	urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=ETC");
        	urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=A");
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=json");
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			System.out.println("api url create");
			e.printStackTrace();
		}
		return urlBuilder;
	}

	@Override
	public StringBuilder tourSearchList(String contenttypeid, String keyword) {
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
        // 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
        try {
        	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="); /*Service Key*/
        	urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        	//urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        	urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=AppTest"); 
        	urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=ETC");
        	urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=A");
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=json");
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid,"UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(keyword,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			System.out.println("api url create");
			e.printStackTrace();
		}
		return urlBuilder;
	}

	@Override
	public int insertCourseReview(TourCourseReviewDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert_course_review", dto);
			
		} catch (Exception e) {
			System.out.println("[error] : insert course review error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<TourCourseReviewDto> courceReviewList(int tc_no) {
		List<TourCourseReviewDto> list = new ArrayList<TourCourseReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"course_review_list",tc_no);
			
		} catch (Exception e) {
			System.out.println("[error] : course review list error");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateCourseReview(TourCourseReviewDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"update_course_review", dto);
			
		} catch (Exception e) {
			System.out.println("[error] : update course review error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteCourseReview(int tcr_no) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"delete_course_review", tcr_no);
			
		} catch (Exception e) {
			System.out.println("[error] : delete course review error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int courseReviewReport(ReportDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"course_review_report", dto);
			
		} catch (Exception e) {
			System.out.println("[error] : course review report error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public boolean reportChk(ReportDto dto) {
		boolean chk = false;
		int res = 0;
		try {
			res= sqlSession.selectOne(NAMESPACE+"report_chk", dto);
			if(res>0) {
				chk = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chk;
	}

	@Override
	public List<RoomDto> courseSearch(String keyword) {
		List<RoomDto> list = new ArrayList<RoomDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"course_search",keyword);
			
		} catch (Exception e) {
			System.out.println("[error] : course search list");
			e.printStackTrace();
		}
		return list;
	}

}
