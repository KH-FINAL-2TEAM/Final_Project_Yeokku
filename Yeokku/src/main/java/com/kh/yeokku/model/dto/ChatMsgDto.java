package com.kh.yeokku.model.dto;


public class ChatMsgDto {

    public enum MessageType { ENTER, TALK}
    
    private MessageType type;
    private String roomId;
    private String sender;
    private String message;
    
	public ChatMsgDto(MessageType type, String roomId, String sender, String message) {
		super();
		this.type = type;
		this.roomId = roomId;
		this.sender = sender;
		this.message = message;
	}
	
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "ChatMsg [type=" + type + ", roomId=" + roomId + ", sender=" + sender + ", message=" + message + "]";
	}
}