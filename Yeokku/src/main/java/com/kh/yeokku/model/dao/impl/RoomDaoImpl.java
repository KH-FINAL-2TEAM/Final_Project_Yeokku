package com.kh.yeokku.model.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.dao.RoomDao;
import com.kh.yeokku.model.dto.LikeTourCourseDto;
import com.kh.yeokku.model.dto.RoomDto;
import com.kh.yeokku.model.dto.UserDto;

@Service
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createRoom(Map<String, Object> map, String pw) {
		
		map.put("pw", pw);
		
		try {
			sqlSession.insert(NAMESPACE+"createRoom", map);
		} catch ( Exception e ) {
			System.out.println("[ Error !! - Create Room ]");
			e.printStackTrace();
		}
		
		return Integer.parseInt(map.get("seq").toString());
	}
	
	@Override
	public RoomDto remakeRoom(String pw) {
		
		RoomDto dto = new RoomDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"remakeRoom", pw);
		} catch ( Exception e ) {
			System.out.println("[ Error !! - Remake Room ]");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public List<RoomDto> selectAll() {
		
		List<RoomDto> list = new ArrayList<RoomDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"selectAll");
		} catch ( Exception e ) {
			System.out.println("[ Error !! - Select All ]");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int roomUpdate(RoomDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"imgUpdate", dto);
			res = sqlSession.update(NAMESPACE+"roomUpdate", dto);
		} catch ( Exception e ) {
			System.out.println("[ Error !! - Room Update ]");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public RoomDto viewRoom(int room) {
		
		RoomDto dto = new RoomDto();
		try {
			sqlSession.update(NAMESPACE+"viewPlus", room);
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", room);
		} catch ( Exception e ) {
			System.out.println("[ Error !! - Select One ]");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int roomLike(LikeTourCourseDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"roomLike", dto);
			res = sqlSession.insert(NAMESPACE+"likeCourse",dto);
		} catch ( Exception e ) {
			System.out.println("[ Error !! - Room Like ]");
			e.printStackTrace();
		}
		
		return res;
	}


}

/*
 
CREATE TABLE USERBOARD (
	USER_NO	VARCHAR(255)	NOT NULL,
	USER_ID	VARCHAR(255)	NULL,
	USER_PW	VARCHAR(255)	NULL,
	USER_NAME	VARCHAR(255)	NULL,
	USER_EMAIL	VARCHAR(255)	NULL,
	USER_NICKNAME	VARCHAR(255)	NULL,
	USER_POSTCODE	VARCHAR(255)	NULL,
	USER_ADDRESS	VARCHAR(255)	NULL,
	USER_EXTRAADDRESS	VARCHAR(255)	NULL,
	USER_DETAILADDRESS	VARCHAR(255)	NULL,
	USER_REG_DATE	VARCHAR(255)	NULL,
	USER_ABLE	VARCHAR(255)	NULL,
	USER_ROLE	VARCHAR(255)	NULL
);

CREATE TABLE TCBOARD (
	TC_NO	VARCHAR(255)	NOT NULL,
	TC_USERNO	VARCHAR(255)	NOT NULL,
	TC_TITLE	VARCHAR(255)	NULL,
	TC_DAYS	VARCHAR(255)	NULL,
	TC_DAY	VARCHAR(255)	NULL,
	TC_REGION	VARCHAR(255)	NULL,
	TC_PRE_CONTENTID	VARCHAR(255)	NULL,
	TC_NEXT_CONTENTID	VARCHAR(255)	NULL,
    TC_CONTENT LONG NOT NULL,
	TC_CONTENTID	VARCHAR(255)	NULL,
	TC_CONTENTTYPEID	VARCHAR(255)	NULL,
	TC_DATE	VARCHAR(255)	NULL,
	TC_VIEW	VARCHAR(255)	NULL
);

 */
