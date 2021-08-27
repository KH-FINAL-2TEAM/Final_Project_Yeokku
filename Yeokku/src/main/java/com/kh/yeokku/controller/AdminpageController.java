package com.kh.yeokku.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminpageController {

	@RequestMapping("/admin_report.do")
	public String adminReport() {
		return "adminpage/admin_report";
	}
}
