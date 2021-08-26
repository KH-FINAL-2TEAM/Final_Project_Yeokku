package com.kh.yeokku.model.dto;

public class TourDto {
	//db 변수
	private int tour_contentid;
	private int tour_contenttypeid;
	private int tour_view;
	
	//select 변수
	private int tour_lt_cnt; //여행지 좋아요 수 담는 변수
	
	public TourDto() {
		// TODO Auto-generated constructor stub
	}

	public TourDto(int tour_contentid, int tour_contenttypeid, int tour_view, int tour_lt_cnt) {
		super();
		this.tour_contentid = tour_contentid;
		this.tour_contenttypeid = tour_contenttypeid;
		this.tour_view = tour_view;
		this.tour_lt_cnt = tour_lt_cnt;
	}

	public int getTour_contentid() {
		return tour_contentid;
	}

	public void setTour_contentid(int tour_contentid) {
		this.tour_contentid = tour_contentid;
	}

	public int getTour_contenttypeid() {
		return tour_contenttypeid;
	}

	public void setTour_contenttypeid(int tour_contenttypeid) {
		this.tour_contenttypeid = tour_contenttypeid;
	}

	public int getTour_view() {
		return tour_view;
	}

	public void setTour_view(int tour_view) {
		this.tour_view = tour_view;
	}

	public int getTour_lt_cnt() {
		return tour_lt_cnt;
	}

	public void setTour_lt_cnt(int tour_lt_cnt) {
		this.tour_lt_cnt = tour_lt_cnt;
	}
	
	
	
}
