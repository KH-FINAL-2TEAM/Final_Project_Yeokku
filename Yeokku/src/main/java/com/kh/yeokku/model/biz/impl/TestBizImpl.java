package com.kh.yeokku.model.biz.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.yeokku.model.biz.TestBiz;
import com.kh.yeokku.model.dao.TestDao;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.RoomDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;

@Service
public class TestBizImpl implements TestBiz{
	@Autowired
	private TestDao dao; 
	
	@Override
	public JsonArray CourseTourList(String contenttypeid) throws IOException {
		StringBuilder url_builder = dao.CourseTourList(contenttypeid);
		 URL url = new URL(url_builder.toString());
	        // 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        // 5. 통신을 위한 메소드 SET.
	        conn.setRequestMethod("GET");
	        // 6. 통신을 위한 Content-type SET. 
	        conn.setRequestProperty("Content-type", "application/json");
	        // 7. 통신 응답 코드 확인.
	        System.out.println("Response code: " + conn.getResponseCode());
	        // 8. 전달받은 데이터를 BufferedReader 객체로 저장.
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        // 10. 객체 해제.
	        rd.close();
	        conn.disconnect();
	        // 11. 전달받은 데이터 확인.
	        
		return parSer(sb);
	}


	@Override
	public JsonArray tourSearchList(String contenttypeid, String keyword) throws IOException {
		StringBuilder url_builder = dao.tourSearchList(contenttypeid, keyword);
		 URL url = new URL(url_builder.toString());
	        // 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        // 5. 통신을 위한 메소드 SET.
	        conn.setRequestMethod("GET");
	        // 6. 통신을 위한 Content-type SET. 
	        conn.setRequestProperty("Content-type", "application/json");
	        // 7. 통신 응답 코드 확인.
	        System.out.println("Response code: " + conn.getResponseCode());
	        // 8. 전달받은 데이터를 BufferedReader 객체로 저장.
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        // 10. 객체 해제.
	        rd.close();
	        conn.disconnect();
	        // 11. 전달받은 데이터 확인.
	        
		return parSer(sb);
	}
	
	
	public JsonArray parSer(StringBuilder sb) {
		JsonParser json_parser = new JsonParser();
		JsonArray json_item = new JsonArray();
		JsonObject json_object = (JsonObject) json_parser.parse(sb.toString());
		JsonObject json_response = (JsonObject) json_object.get("response");
		JsonObject json_body = (JsonObject) json_response.get("body");
		
		String str = json_body.get("totalCount").toString();
		int i = Integer.parseInt(str);
		
		if(i > 0) {
			JsonObject json_items = (JsonObject) json_body.get("items");
			json_item = (JsonArray) json_items.get("item");
		}
		return json_item;
	}


	@Override
	public int insertCourseReview(TourCourseReviewDto dto) {
		return dao.insertCourseReview(dto);
	}


	@Override
	public List<TourCourseReviewDto> courceReviewList(int tc_no) {
		return dao.courceReviewList(tc_no);
	}


	@Override
	public int updateCourseReview(TourCourseReviewDto dto) {
		return dao.updateCourseReview(dto);
	}


	@Override
	public int deleteCourseReview(int tcr_no) {
		return dao.deleteCourseReview(tcr_no);
	}


	@Override
	public int courseReviewReport(ReportDto dto) {
		return dao.courseReviewReport(dto);
	}


	@Override
	public boolean reportChk(ReportDto dto) {
		return dao.reportChk(dto);
	}
	
	
	
}
