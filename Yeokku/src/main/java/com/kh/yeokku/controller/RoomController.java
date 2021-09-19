package com.kh.yeokku.controller;

import java.text.DateFormat;
import java.util.Date;
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

@Controller
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RoomBiz roomBiz;

	@RequestMapping("/course_making.do")
	public String courseMakingForm(Model model) {
		int res = roomBiz.createRoom();
		return "Course/CourseMaking?room="+res;
	}
}
