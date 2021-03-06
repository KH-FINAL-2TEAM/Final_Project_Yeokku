package com.kh.yeokku.controller;

import java.text.DateFormat;
import java.util.ArrayList;
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

import com.kh.yeokku.model.biz.RoomBiz;
import com.kh.yeokku.model.biz.TripplaceBiz;
import com.kh.yeokku.model.dto.RoomDto;

@Controller
public class HomeController {
	@Autowired
	private TripplaceBiz biz;
	@Autowired
	private RoomBiz roombiz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
		model.addAttribute("tour_list",biz.tripplaceMain());
		List<RoomDto> list = new ArrayList<RoomDto>();
		list = roombiz.selectAll();
		
		for(int i=0; i<list.size(); i++) {
			RoomDto dto = new RoomDto();
			dto = list.get(i);
			String temp_content = dto.getTc_content();
			temp_content = temp_content.replace( "<img class=\"OF\" src=\"resources/img/Course/Minus.png\">", "");
			temp_content = substringBetween(temp_content, "<img class=", ">");
			temp_content = substringBetween(temp_content, "src=\"", "\"");
			dto.setTc_content( temp_content );	
			list.set(i, dto);
		}

		model.addAttribute("course_list",list);
		return "main/main";
	}
	//여행지
	@RequestMapping("/tripplace_main_form.do")
	public String tripplaceMainForm(Model model) {
		return "redirect:tripplace_search_form.do";
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
	
	private String substringBetween(String str, String open, String close) {
	    if (str == null || open == null || close == null) {
	       return null;
	    }
	    int start = str.indexOf(open);
	    if (start != -1) {
	       int end = str.indexOf(close, start + open.length());
	       if (end != -1) {
	          return str.substring(start + open.length(), end);
	       }
	    }
	    return null;
	}
}
