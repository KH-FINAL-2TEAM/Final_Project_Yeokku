package com.kh.yeokku.model.biz;

import java.util.List;

import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.ReportDto;
import com.kh.yeokku.model.dto.UserDto;

public interface AdminpageBiz {

	public List<UserDto> selectUserList(); //유저 목록 조회
	public List<ReportDto> selectReportList(); //신고 목록 조회
	public List<QaDto> selectQnaList(); //문의 목록 조회
	public int qnaConfirm(int qa_no); // 문의 내역 처리
	public int reportConfirm(int report_no); //신고 내역 처리
	public int reportBanConfirm(int report_no, int report_target_userno); //신고 정지 처리
	public int reportUnbanConfirm(int report_no, int report_target_userno); // 정지 해제 처리
	public int qnaSelectedDelete(List<Integer> selected_list);//선택한 문의내역 삭제
	public int qnaAllDelete(); // 문의 전체 삭제
	public int userSelectedDelete(List<Integer> selected_list);//선택한 회원 삭제
	public int userAllDelete(); // 회원 전체 삭제
	public int reportSelectedDelete(List<Integer> selected_list); //선택한 신고 삭제
	public int reportAllDelete(); // 신고 전체 삭제
	public int reviewDelete(int report_reason); // 벤처리시 리뷰 삭제
}
