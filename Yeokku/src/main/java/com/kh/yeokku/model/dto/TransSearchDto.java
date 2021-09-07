package com.kh.yeokku.model.dto;

public class TransSearchDto {
	
	private String start_loc;
	private String goal_loc;
	private String start_time;
	private String return_time;
	
	
	public TransSearchDto() { super(); }

	public TransSearchDto(String start_loc, String goal_loc, String start_time, String return_time) {
		super();
		this.start_loc = start_loc;
		this.goal_loc = goal_loc;
		this.start_time = start_time;
		this.return_time = return_time;
	}
	
	public String getStart_loc() {
		return start_loc;
	}
	public void setStart_loc(String start_loc) {
		this.start_loc = start_loc;
	}
	public String getGoal_loc() {
		return goal_loc;
	}
	public void setGoal_loc(String goal_loc) {
		this.goal_loc = goal_loc;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getReturn_time() {
		return return_time;
	}
	public void setReturn_time(String return_time) {
		this.return_time = return_time;
	}

	@Override
	public String toString() {
		return "TransSearchDto [start_loc=" + start_loc + ", goal_loc=" + goal_loc + ", start_time=" + start_time
				+ ", return_time=" + return_time + "]";
	}
	
}
