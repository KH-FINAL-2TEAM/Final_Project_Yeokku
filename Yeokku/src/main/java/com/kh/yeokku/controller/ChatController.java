package com.kh.yeokku.controller;

import java.util.ArrayList;
import java.util.List;
 
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
import javax.websocket.RemoteEndpoint.Basic;
 
@Controller
@ServerEndpoint(value="/ccchat.do")
public class ChatController {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
    
    public ChatController() {}
    
    @RequestMapping(value="/chat.do")
    public ModelAndView getChatViewPage(ModelAndView mav) {
        mav.setViewName("chat");
        return mav;
    }
    
    @OnOpen
    public void onOpen(Session session) {

        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("소켓 연결을 알림 : Connection Established");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }

    private void sendAllSessionToMessage(Session self,String message) {
        try {
            for(Session session : ChatController.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(message);
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
        	String pfimg = "resources/img/Course/PF1.jpg"; // 임시 내용. 이후 로그인한 유저의 pfimg 경로 따와야함
            final Basic basic=session.getBasicRemote();
            basic.sendText(pfimg + "pfimgline111" + message);
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {}
    
    @OnClose
    public void onClose(Session session) {
        logger.info("세선 종료를 알림 : Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}