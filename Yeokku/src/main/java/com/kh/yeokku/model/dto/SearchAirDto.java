package com.kh.yeokku.model.dto;

public class SearchAirDto {
	
	private String air_loc_start;
	private String air_loc_goal;
	private String air_date_start;
	private String air_date_return;
	
	public SearchAirDto() { super(); }

	public SearchAirDto(String air_loc_start, String air_loc_goal, String air_date_start, String air_date_return) {
		super();
		this.air_loc_start = air_loc_start;
		this.air_loc_goal = air_loc_goal;
		this.air_date_start = air_date_start;
		this.air_date_return = air_date_return;
	}

	public String getAir_loc_start() { return air_loc_start; }
	public void setAir_loc_start(String air_loc_start) { this.air_loc_start = air_loc_start; }

	public String getAir_loc_goal() { return air_loc_goal; }
	public void setAir_loc_goal(String air_loc_goal) { this.air_loc_goal = air_loc_goal; }

	public String getAir_date_start() { return air_date_start; }
	public void setAir_date_start(String air_date_start) { this.air_date_start = air_date_start; }

	public String getAir_date_return() { return air_date_return; }
	public void setAir_date_return(String air_date_return) { this.air_date_return = air_date_return; }

	@Override
	public String toString() {
		return "SearchAirDto [air_loc_start=" + air_loc_start + ", air_loc_goal=" + air_loc_goal + ", air_date_start="
				+ air_date_start + ", air_date_return=" + air_date_return + "]";
	}
}
