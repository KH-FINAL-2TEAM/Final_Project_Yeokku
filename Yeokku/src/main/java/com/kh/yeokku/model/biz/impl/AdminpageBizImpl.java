package com.kh.yeokku.model.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.AdminpageBiz;
import com.kh.yeokku.model.dao.AdminpageDao;
import com.kh.yeokku.model.dao.TestDao;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.UserDto;

@Service
public class AdminpageBizImpl implements AdminpageBiz{

	@Autowired
	private AdminpageDao dao;
	@Autowired
	private TestDao testdao;
	@Override
	public List<UserDto> selectUserList() {
		return dao.selectUserList();
	}

	@Override
	public List<ReportDto> selectReportList() {
		return dao.selectReportList();
	}

	@Override
	public List<QaDto> selectQnaList() {
		return dao.selectQnatList();
	}

	@Override
	public int qnaConfirm(int qa_no) {
		return dao.qnaConfirm(qa_no);
	}

	@Override
	public int reportConfirm(int report_no) {
		return dao.reportConfirm(report_no);
	}

	@Override
	public int reportBanConfirm(int report_no, int report_target_userno) {
		return dao.reportBanConfirm(report_no,report_target_userno);
	}

	@Override
	public int reportUnbanConfirm(int report_no, int report_target_userno) {
		return dao.reportUnbanConfirm(report_no,report_target_userno);
	}

	@Override
	public int qnaSelectedDelete(List<Integer> selected_list) {
		return dao.qnaSelectedDelete(selected_list);
	}

	@Override
	public int qnaAllDelete() {
		return dao.qnaAllDelete();
	}
	
	@Override
	public int userSelectedDelete(List<Integer> selected_list) {
		return dao.userSelectedDelete(selected_list);
	}

	@Override
	public int userAllDelete() {
		return dao.userAllDelete();
	}
	
	@Override
	public int reportSelectedDelete(List<Integer> selected_list) {
		return dao.reportSelectedDelete(selected_list);
	}

	@Override
	public int reportAllDelete() {
		return dao.reportAllDelete();
	}

	@Override
	public int reviewDelete(int report_reason) {
		// TODO Auto-generated method stub
		return testdao.deleteCourseReview(report_reason);
	}
}
