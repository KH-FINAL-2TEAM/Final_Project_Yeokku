package com.kh.yeokku.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yeokku.model.biz.RoomBiz;
import com.kh.yeokku.model.dto.RoomDto;
import com.kh.yeokku.model.dto.UserDto;

@Controller
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RoomBiz roomBiz;

	@RequestMapping("/course_making.do")
	public String courseMakingForm(Model model, HttpSession session) {
		//UserDto user = new UserDto();
		//user = (UserDto)session.getAttribute("user");	
		// int res = roomBiz.createRoom(user.getUser_id());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", "임시아이디");
		String pw = RandomStringUtils.randomAlphanumeric(20);
		int res = roomBiz.createRoom(map, pw);
		session.setAttribute("roomNo", res);
		model.addAttribute("link", pw);
		return "Course/CourseMaking";
		
		/*
		UserDto user = new UserDto();
		user = (UserDto)session.getAttribute("user");	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user.getUser_id());
		String pw = RandomStringUtils.randomAlphanumeric(20);
		int res = roomBiz.createRoom(map, pw);
		session.setAttribute("roomNo", res);
		model.addAttribute("link", pw);
		return "Course/CourseMaking"; */
	}
	
	@RequestMapping("/course_remake.do")
	public String courseRemake(Model model, HttpSession session, String room) {
		RoomDto dto = roomBiz.remakeRoom(room);

		model.addAttribute("dto", dto);
		String png = "";
		png = Base64Utils.encodeToString(dto.getTc_jpg());
		model.addAttribute("png", png);
		model.addAttribute("link", dto.getTc_pw());
		session.setAttribute("roomNo", dto.getTc_no());

		return "Course/CourseMaking";
	}
	
	@RequestMapping("/course_list.do")
	public String courseMainForm(Model model) {
		
		List<RoomDto> list = new ArrayList<RoomDto>();
		list = roomBiz.selectAll();
		
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

		model.addAttribute("list", list);
		return "Course/CourseList";
	}
	
	@RequestMapping(value="/roomsave.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> courseSave(Model model, HttpSession session, @RequestBody RoomDto dto) {

		dto.setTc_no( Integer.parseInt(session.getAttribute("roomNo").toString()) );

		int res = roomBiz.roomUpdate(dto);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;

		if(res >= 1) {
			map.put("check",  true);
		} else {
			map.put("check",  false);
		}
		
		return map;
	}
	
	@RequestMapping("/course_detail.do")
	public String courseDetail(Model model, int room) {

		RoomDto dto = roomBiz.viewRoom(room);
		model.addAttribute("dto", dto);
		String jpg = "";
		jpg = Base64Utils.encodeToString(dto.getTc_jpg());
		model.addAttribute("jpg", jpg);
		
		return "Course/CourseDetail";
	}
	
	@RequestMapping("/like.do")
	@ResponseBody
	public Map<String, Boolean> courseLike(Model model, int room) {
		
		int res = roomBiz.roomLike(room);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;

		if(res >= 1) {
			map.put("check",  true);
		} else {
			map.put("check",  false);
		}
		
		return map;
	}
	
	public static byte[] decodeBase64ToBytes(String imageString) {
        if (imageString.startsWith("data:image/png;base64,"))
            return Base64.getDecoder().decode(imageString.substring("data:image/png;base64,".length()));
        else
            throw new IllegalStateException("it is not base 64 string");
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
