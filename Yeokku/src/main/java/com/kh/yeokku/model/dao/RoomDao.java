package com.kh.yeokku.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.yeokku.model.dto.RoomDto;

public interface RoomDao {
	
	String NAMESPACE="room.";

	public int createRoom(Map<String, Object> map, String pw);
	public List<RoomDto> selectAll();
	public int roomUpdate(RoomDto dto);
	public RoomDto viewRoom(int room);
	public RoomDto remakeRoom(String pw);
}
