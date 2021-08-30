package com.kh.yeokku.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.yeokku.model.biz.LoginpageBiz;

@Controller
public class LoginController {

	@Autowired
	private LoginpageBiz biz;
	

	@RequestMapping("/login.do")
	public String adminReport() {
		return "main/main";
	}
	
	@RequestMapping("/signup.do")
	public String signUp() {
		return "login/login_regi";
	}
	
	//회원가입 - 아이디 중복확인 
	@RequestMapping("/idchk.do")
	public String idChk(Model model, String user_id) {
		String res = biz.idChk(user_id);
		boolean idnotused;
		
		
		if(res.equals("none")) {
			idnotused = true;
			model.addAttribute("idnotused", idnotused);
		}else {
			idnotused = false;
			model.addAttribute("idnotused", idnotused);
		}
		
		
		return "/login/login_idchk";
	}
	
	
}
