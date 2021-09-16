package com.kh.yeokku.model.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.QnaBiz;
import com.kh.yeokku.model.dao.QnaDao;
import com.kh.yeokku.model.dto.NoticeDto;
import com.kh.yeokku.model.dto.QaDto;

@Service
public class QnaBizImpl implements QnaBiz{
	
	@Autowired
	private QnaDao dao;
	
	
	@Override
	public List<NoticeDto> selectNoticeList() {
		return dao.selectNoticeList();
	}

	@Override
	public NoticeDto selectNoticeOne(int notice_no) {
		return dao.selectNoticeOne(notice_no);
	}

	@Override
	public int insertNotice(NoticeDto dto) {
		return dao.insertNotice(dto);
	}

	@Override
	public int updateNotice(NoticeDto dto) {
		return dao.updateNotice(dto);
	}

	@Override
	public int deleteNotice(int notice_no) {
		return dao.deleteNotice(notice_no);
	}

	@Override
	public int insertQna(QaDto dto) {
		return dao.insertQna(dto);
	}

	
	
}
