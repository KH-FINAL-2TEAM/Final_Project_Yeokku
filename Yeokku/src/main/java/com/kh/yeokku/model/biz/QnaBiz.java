package com.kh.yeokku.model.biz;

import java.util.List;

import com.kh.yeokku.model.dto.NoticeDto;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.util.pagingVO;

public interface QnaBiz {
	
	public int countNotice();
	public List<NoticeDto> selectNoticeList(pagingVO vo);	//공지사항조회
	public NoticeDto selectNoticeOne(int notice_no); 	//공지사항선택
	public int insertNotice(NoticeDto dto);	//공지사항 글쓰기
	public int updateNotice(NoticeDto dto);	//공지사항 수정
	public int deleteNotice(int notice_no);	//공지사항 삭제
	public int insertQna(QaDto dto);	//문의 내역 추가
}
