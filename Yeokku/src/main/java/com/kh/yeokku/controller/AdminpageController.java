package com.kh.yeokku.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yeokku.model.biz.AdminpageBiz;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.UserDto;

@Controller
public class AdminpageController {

	private static final Logger logger = LoggerFactory.getLogger(AdminpageController.class);
	
	
	@Autowired
	private AdminpageBiz biz;
	
	@RequestMapping("/admin_user.do")
	public String userReport(Model model) {
		
		List<UserDto> list = biz.selectUserList();
		
		model.addAttribute("list",list);
		
		return "adminpage/admin_user";
	}
	
	@RequestMapping("/admin_report.do")
	public String adminReport(Model model) {
		
		List<ReportDto> list = biz.selectReportList();
						
		model.addAttribute("list",list);
		
		return "adminpage/admin_report";
	}
	
	@RequestMapping("/admin_qna.do")
	public String adminQna(Model model) {
		
		List<QaDto> list = biz.selectQnaList();
						
		model.addAttribute("list",list);
		
		return "adminpage/admin_qna";
	}
	
	
	@RequestMapping(value = "/qna_confirm.do", method = RequestMethod.POST)
	@ResponseBody
	public String qnaConfirm(Model model, int qa_no) {
		int res = biz.qnaConfirm(qa_no);
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping(value = "/report_confirm.do", method = RequestMethod.POST)
	@ResponseBody
	public String reportConfirm(Model model, int report_no) {
		int res = biz.reportConfirm(report_no);
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping(value = "/report_ban_confirm.do", method = RequestMethod.POST)
	@ResponseBody
	public String reportBanConfirm(Model model, int report_no, int report_target_userno) {
		int res = biz.reportBanConfirm(report_no, report_target_userno);
		System.out.println(res);
		
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping(value = "/report_unban_confirm.do", method = RequestMethod.POST)
	@ResponseBody
	public String reportUnbanConfirm(Model model, int report_no, int report_target_userno) {
		int res = biz.reportUnbanConfirm(report_no, report_target_userno);
		System.out.println(res);
		
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping(value = "/qna_selected_delete.do", method = RequestMethod.POST)
	@ResponseBody
	public String qnaSelectedDelete(Model model,@RequestParam(value="selected[]") List<Integer> selected_list) {
		
		int res = biz.qnaSelectedDelete(selected_list);
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="/qna_all_delete.do",method = RequestMethod.POST)
	@ResponseBody
	public String qnaAllDelete(Model model) {
		
		int res = biz.qnaAllDelete();
		
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/user_selected_delete.do", method = RequestMethod.POST)
	@ResponseBody
	public String userSelectedDelete(Model model,@RequestParam(value="selected[]") List<Integer> selected_list) {
		
		int res = biz.userSelectedDelete(selected_list);
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="/user_all_delete.do",method = RequestMethod.POST)
	@ResponseBody
	public String userAllDelete(Model model) {
		
		int res = biz.userAllDelete();
		
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/report_selected_delete.do", method = RequestMethod.POST)
	@ResponseBody
	public String reportSelectedDelete(Model model,@RequestParam(value="selected[]") List<Integer> selected_list) {
		
		int res = biz.reportSelectedDelete(selected_list);
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="/report_all_delete.do",method = RequestMethod.POST)
	@ResponseBody
	public String reportAllDelete(Model model) {
		
		int res = biz.reportAllDelete();
		
		if(res>0) {
			return "true";
		}else {
			return "false";
		}
	}
}
