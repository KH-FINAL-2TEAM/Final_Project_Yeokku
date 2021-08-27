package com.kh.yeokku.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/mypage.do")
	public String home(Locale locale, Model model) {
		
		return "tripplace/tripplace_show_map";
	}
	
	
	
	//헤더 네비 이동
	//홈
	@RequestMapping("/main_form.do")
	public String mainForm(Model model) {
		return "main/main";
	}
	//여행지
	@RequestMapping("/tripplace_main_form.do")
	public String tripplaceMainForm(Model model) {
		return "tripplace/tripplace_main";
	}
	//교통
	@RequestMapping("/transportation_form.do")
	public String transportationForm(Model model) {
		return "transportation/transportation";
	}
	//관리자
	@RequestMapping("/admin_user_form.do")
	public String adminUserForm(Model model) {
		return "adminpage/admin_user";
	}
	//로그인
	@RequestMapping("/login_form.do")
	public String loginForm(Model model) {
		return "login/login";
	}
	//마이페이지-정보수정
	@RequestMapping("/mypage_profile_form.do")
	public String mypageProfileForm(Model model) {
		return "mypage/mypage_profile";
	}
	//마이페이지-여행지
	@RequestMapping("/mypage_travel_form.do")
	public String mypageTravelForm(Model model) {
		return "mypage/mypage_travel";
	}
	//마이페이지-여행코스
	@RequestMapping("/mypage_course_form.do")
	public String mypageCourseForm(Model model) {
		return "mypage/mypage_course";
	}
	//마이페이지-리뷰
	@RequestMapping("/mypage_review_form.do")
	public String mypageReviewForm(Model model) {
		return "mypage/mypage_review";
	}
	//마이페이지-문의
	@RequestMapping("/mypage_qna.do")
	public String mypageQnaForm(Model model) {
		return "mypage/mypage_qna";
	}
}