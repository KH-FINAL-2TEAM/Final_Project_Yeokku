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
		model.addAttribute("list", roomBiz.selectAll());
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
	
	public static byte[] decodeBase64ToBytes(String imageString) {
        if (imageString.startsWith("data:image/png;base64,"))
            return Base64.getDecoder().decode(imageString.substring("data:image/png;base64,".length()));
        else
            throw new IllegalStateException("it is not base 64 string");
    }

}
