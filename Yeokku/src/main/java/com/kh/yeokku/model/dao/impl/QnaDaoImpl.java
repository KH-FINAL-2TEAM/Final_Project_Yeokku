package com.kh.yeokku.model.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.QnaDao;
import com.kh.yeokku.model.dto.NoticeDto;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.util.pagingVO;

@Repository
public class QnaDaoImpl implements QnaDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public int countNotice() {
		int cnt = 0;
		
		try {
			cnt = sqlSession.selectOne(NAMESPACE+"countBoard");
		} catch (Exception e) {
			System.out.println("[error] : count notice list");
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	
	
	
	
	
	@Override
	public List<NoticeDto> selectNoticeList(pagingVO vo) {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectBoard",vo);
		} catch (Exception e) {
			System.out.println("[error] : select notice list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public NoticeDto selectNoticeOne(int notice_no) {
		NoticeDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", notice_no);
		} catch (Exception e) {
			System.out.println("[error] : select notice one");
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public int insertNotice(NoticeDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertNotice",dto);
		} catch (Exception e) {
			System.out.println("[error] : insert notice");
			e.printStackTrace();
		}
						
		return res;
	}

	@Override
	public int updateNotice(NoticeDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateNotice",dto);
		} catch (Exception e) {
			System.out.println("[error] : update notice");
			e.printStackTrace();
		}
				
		return res;
	}

	@Override
	public int deleteNotice(int notice_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteNotice",notice_no);
		} catch (Exception e) {
			System.out.println("[error] : delete notice");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertQna(QaDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertEmail",dto);
		} catch (Exception e) {
			System.out.println("[error] : insert Email");
			e.printStackTrace();
		}
		
		return res;
	}

	
	@Override
	public int updateViewCnt(int notice_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateViewCnt",notice_no);
		} catch (Exception e) {
			System.out.println("[error] : update ViewCnt");
			e.printStackTrace();
		}
				
		return res;
	}
	
	
	
	
	
	
	
	
}
