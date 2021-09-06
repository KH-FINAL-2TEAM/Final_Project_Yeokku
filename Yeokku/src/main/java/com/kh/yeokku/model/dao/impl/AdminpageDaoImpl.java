package com.kh.yeokku.model.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.AdminpageDao;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.UserDto;

@Repository
public class AdminpageDaoImpl implements AdminpageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<UserDto> selectUserList() {
		List<UserDto> list = new ArrayList<UserDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"select_user_list");
			
		} catch (Exception e) {
			System.out.println("[error] : select user list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ReportDto> selectReportList() {
		List<ReportDto> list = new ArrayList<ReportDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"select_report_list");
		} catch (Exception e) {
			System.out.println("[error] : select report list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<QaDto> selectQnatList() {
		List<QaDto> list = new ArrayList<QaDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"select_qna_list");
		} catch (Exception e) {
			System.out.println("[error] : select qna list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int qnaConfirm(int qa_no) {
		int res=0;
		try {
			res = sqlSession.update(NAMESPACE+"qna_confirm",qa_no);
			
		} catch (Exception e) {
			System.out.println("[error] : update qna confirm");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int reportConfirm(int report_no) {
		int res=0;
		try {
			res = sqlSession.update(NAMESPACE+"report_confirm",report_no);
			
		} catch (Exception e) {
			System.out.println("[error] : update report confirm");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int reportBanConfirm(int report_no, int report_target_userno) {
		int res=0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("report_no",report_no);
		map.put("report_target_userno",report_target_userno);
		
		try {
			sqlSession.update(NAMESPACE+"report_ban_confirm",map);
			res = 1;
		} catch (Exception e) {
			System.out.println("[error] : update report ban confirm");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int reportUnbanConfirm(int report_no, int report_target_userno) {
		int res=0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("report_no",report_no);
		map.put("report_target_userno",report_target_userno);
		
		try {
			sqlSession.update(NAMESPACE+"report_unban_confirm",map);
			res = 1;
		} catch (Exception e) {
			System.out.println("[error] : update report unban confirm");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int qnaSelectedDelete(List<Integer> selected_list) {
		int res =0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"qna_selected_delete",selected_list);
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("[error] : delete qna selected list");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int qnaAllDelete() {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"qna_all_delete");
			
		} catch (Exception e) {
			System.out.println("[error] : delete qna all");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int userSelectedDelete(List<Integer> selected_list) {
		int res =0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"user_selected_delete",selected_list);
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("[error] : delete user selected list");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int userAllDelete() {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"user_all_delete");
			
		} catch (Exception e) {
			System.out.println("[error] : delete user all");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int reportSelectedDelete(List<Integer> selected_list) {
		int res =0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"report_selected_delete",selected_list);
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("[error] : delete report selected list");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int reportAllDelete() {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"report_all_delete");
			
		} catch (Exception e) {
			System.out.println("[error] : delete report all");
			e.printStackTrace();
		}
		return res;
	}
}
