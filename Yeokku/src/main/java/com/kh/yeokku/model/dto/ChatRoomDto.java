package com.kh.yeokku.model.dto;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import com.kh.yeokku.controller.ChattingHandler;

public class ChatRoomDto {

    private String roomId;
    private Map<String, WebSocketSession> sessions = new HashMap<>();
    
	public ChatRoomDto(String roomId ) {
		super();
		this.roomId = roomId;
	}
	
	public ChatRoomDto(String roomId, Map<String, WebSocketSession> sessions) {
		super();
		this.roomId = roomId;
		this.sessions = sessions;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public Map<String, WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(Map<String, WebSocketSession> sessions) {
		this.sessions = sessions;
	}
	
	public void addSessions( String key, WebSocketSession session) {
		this.sessions.put( key, session );
	}

	@Override
	public String toString() {
		return "ChatRoomDto [roomId=" + roomId + ", sessions=" + sessions + "]";
	}
	
	public void sendMsg(String msg) {
		
	}

    
}
