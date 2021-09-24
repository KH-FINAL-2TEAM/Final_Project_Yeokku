package com.kh.yeokku.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.kh.yeokku.model.biz.RoomBiz;
import com.kh.yeokku.model.biz.TestBiz;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.RoomDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;
import com.kh.yeokku.model.dto.testDto;

@Controller
public class TestController {

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	private TestBiz biz;
	@Autowired
	private RoomBiz roomBiz;
	
	
	@RequestMapping(value="/tour_search_list.do",method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public String tourSearchList(HttpServletResponse response, String select, String keyword) throws IOException {
		
		String gson = "";
		JsonArray json_item = biz.tourSearchList(select, keyword);
		if(json_item != null) {
			gson = new Gson().toJson(json_item);			
		}
		return gson;
	}
	
	@RequestMapping(value="/insert_course_review.do",method = RequestMethod.POST)
	@ResponseBody
	public String insertCourseReview(Model model, TourCourseReviewDto dto) {
		int res = biz.insertCourseReview(dto);
		if(res >0) {
			return "true";
			
		}else {
			return "false";
		}
	}
	/*
	@RequestMapping("/course_detail.do")
	public String courseDetail(Model model, int room) {

		RoomDto dto = roomBiz.viewRoom(room);
		model.addAttribute("dto", dto);
		String jpg = "";
		jpg = Base64Utils.encodeToString(dto.getTc_jpg());
		model.addAttribute("jpg", jpg);
		
		List<TourCourseReviewDto> list = biz.courceReviewList(room);
		model.addAttribute("review_list",list);
		return "Course/CourseDetail";
	}
	*/
	@RequestMapping(value="/update_course_review.do",method = RequestMethod.POST)
	@ResponseBody
	public String updateCourseReview(Model model, TourCourseReviewDto dto) {
		int res = biz.updateCourseReview(dto);
		if(res >0) {
			return "true";
			
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="/delete_course_review.do",method = RequestMethod.POST)
	@ResponseBody
	public String deleteCourseReview(Model model, int tcr_no) {
		int res = biz.deleteCourseReview(tcr_no);
		if(res >0) {
			return "true";
			
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="/report_course_review.do",method = RequestMethod.POST)
	@ResponseBody
	public String courseReviewReport(Model model, ReportDto dto) {
		boolean chk = biz.reportChk(dto);
		if(chk == false) {
			int res = biz.courseReviewReport(dto);
			if(res >0) {
				return "true";
				
			}else {
				return "false";
			}
		}else {
			return "chk";
		}
	}
	
}
