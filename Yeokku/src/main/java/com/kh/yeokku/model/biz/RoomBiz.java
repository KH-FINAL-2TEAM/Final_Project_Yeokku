package com.kh.yeokku.model.biz;

import java.util.List;
import java.util.Map;

import com.kh.yeokku.model.dto.RoomDto;

public interface RoomBiz {
	
	public int createRoom(Map<String, Object> map, String pw);
	public List<RoomDto> selectAll();
	public int roomUpdate(RoomDto dto);
	public RoomDto viewRoom(int room);
	public RoomDto remakeRoom(String pw);
	public int roomLike(int room);
	
}
