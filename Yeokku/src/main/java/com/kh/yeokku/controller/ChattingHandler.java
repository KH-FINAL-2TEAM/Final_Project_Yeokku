package com.kh.yeokku.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.yeokku.model.dto.ChatRoomDto;
import com.kh.yeokku.model.dto.UserDto;

public class ChattingHandler extends TextWebSocketHandler{
		
		Map<String, ChatRoomDto> roomSessions = new HashMap<>();
		
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception{
			
			System.out.println("접속 시작 단계");

			Map<String, Object> user_no = session.getAttributes(); 
			
			Map<String, String> values = getQueryMap(session.getUri().toString()); 
			
			if( roomSessions.containsKey(values.get("room")) ) { 
				Map<String, WebSocketSession> room = roomSessions.get( values.get("room") ).getSessions();
				room.put( user_no.get("user_no").toString(), session);
				ChatRoomDto roomdto = new ChatRoomDto( values.get("room"), room ); 
				roomSessions.put(values.get("room"), roomdto);
			} else {
				ChatRoomDto room = new ChatRoomDto( values.get("room") ); 
				room.addSessions( user_no.get("user_no").toString(), session);
				roomSessions.put(values.get("room"), room); 
			} 
			
			System.out.println(user_no);
			System.out.println(values);
			System.out.println(roomSessions);
			
			System.out.println("접속 완료");
		}
		
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {		
			session.sendMessage( ( new TextMessage( session.getId() + " : " + message.getPayload() ) ) );
			
			Map<String, String> values = getQueryMap(session.getUri().toString()); 

			Iterator<Entry<String, WebSocketSession>> entries = roomSessions.get(values.get("room")).getSessions().entrySet().iterator();
			while(entries.hasNext()){
			    Map.Entry<String, WebSocketSession> entry = entries.next();
			    if(entry.getValue() != session) { 
			    	entry.getValue().sendMessage( ( new TextMessage( "resources/img/Course/PF1.jpgpfimgline" + message.getPayload()) ) ); // 추후 PF Img로 수정
			    }
			}
		}

		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
			System.out.println("유저가 종료하였습니다 : " + session + " : " + status);
		}
		
		public static Map<String, String> getQueryMap(String query)  
		{  
		    String[] params = query.split("&");  
		    Map<String, String> map = new HashMap<String, String>();  
		    for (String param : params)  
		    {  
		        String name = param.split("=")[0];  
		        String value = param.split("=")[1];  
		        map.put(name, value);  
		    }  
		    return map;  
		}
}