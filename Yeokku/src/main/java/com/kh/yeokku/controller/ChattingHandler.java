package com.kh.yeokku.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChattingHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {	
		System.out.println("접속" + session);
		//sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//for(WebSocketSession s : sessionList) {
		//	s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
		//}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("퇴장" + session);
		//sessionList.remove(session);
	}
}
