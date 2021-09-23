package com.kh.yeokku.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.yeokku.model.biz.TripplaceBiz;
import com.kh.yeokku.model.biz.impl.TripplaceBizImpl;
import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private TripplaceBiz tour_biz;
	
	@RequestMapping("/mypage.do")
	public String home(HttpSession session, Locale locale, Model model) {
		
		// 이거 나중에 제가 지울테니까 잠시 냅둬주세요.
		session.setAttribute("user_no", 1+Math.random()*1000);
		session.setAttribute("pfimg", 1+Math.random()*1000);
		
		return "main/main";
	}
	
	
	//헤더 네비 이동
	//홈
	@RequestMapping("/main_form.do")
	public String mainForm(Model model) {
		model.addAttribute("tour_list",tour_biz.tripplaceMain());
		return "main/main";
	}
	//여행지
	@RequestMapping("/tripplace_main_form.do")
	public String tripplaceMainForm(Model model) {
		return "redirect:tripplace_search_form.do";
	}
	//여행코스
	@RequestMapping("/course_list.do")
	public String courseMainForm(Model model) {
		return "Course/CourseList";
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
