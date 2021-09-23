package com.kh.yeokku.model.biz.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.RoomBiz;
import com.kh.yeokku.model.dao.RoomDao;
import com.kh.yeokku.model.dto.RoomDto;

@Service
public class RoomBizImpl implements RoomBiz {
	
	@Autowired
	private RoomDao dao;

	@Override
	public int createRoom(Map<String, Object> map, String pw) {
		return dao.createRoom(map, pw);
	}

	@Override
	public List<RoomDto> selectAll() {
		return dao.selectAll();
	}
	
	@Override
	public int roomUpdate(RoomDto dto) {	
		return dao.roomUpdate(dto);
	}
	
	@Override
	public RoomDto viewRoom(int room) {
		return dao.viewRoom(room);
	}
	
	@Override
	public RoomDto remakeRoom(String pw) {
		return dao.remakeRoom(pw);
	}
}
