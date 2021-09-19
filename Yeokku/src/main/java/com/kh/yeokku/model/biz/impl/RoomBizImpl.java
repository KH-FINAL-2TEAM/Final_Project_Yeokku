package com.kh.yeokku.model.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.RoomBiz;
import com.kh.yeokku.model.dao.RoomDao;

@Service
public class RoomBizImpl implements RoomBiz {
	
	@Autowired
	private RoomDao dao;

	@Override
	public int createRoom() {

		return dao.createRoom();
	}

}
