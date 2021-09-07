package com.kh.yeokku.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.yeokku.model.dto.UserDto;

@Controller
public class ChatController {

	@GetMapping("/chat")
	public void chat(Model model, HttpSession session) {
		
		UserDto user = new UserDto();
		
		user = (UserDto) session.getAttribute("login");
		
		model.addAttribute("userid", user.getUser_id());
	}
}