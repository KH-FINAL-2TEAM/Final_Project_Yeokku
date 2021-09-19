package com.kh.yeokku.model.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.dao.RoomDao;

@Service
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createRoom() {
		
		int res = 0;
		int roomNum = 0;
		try {
			roomNum = sqlSession.selectOne(NAMESPACE+"seqCheck");
			res = sqlSession.insert(NAMESPACE+"createRoom");
		} catch ( Exception e ) {
			System.out.println("[ Error !! - Create Room ]");
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
