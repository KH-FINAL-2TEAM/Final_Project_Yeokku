package com.kh.yeokku.model.dao;

import java.util.List;

import com.kh.yeokku.model.dto.NoticeDto;
import com.kh.yeokku.model.dto.QaDto;

public interface QnaDao {

	String NAMESPACE="qna.";
	
	public List<NoticeDto> selectNoticeList();	//공지사항조회
	public NoticeDto selectNoticeOne(int notice_no); 	//공지사항선택
	public int insertNotice(NoticeDto dto);	//공지사항 글쓰기
	public int updateNotice(NoticeDto dto);	//공지사항 수정
	public int deleteNotice(int notice_no);	//공지사항 삭제
	public int insertQna(QaDto dto);	//문의 내역 추가
	
	
	
	
}
