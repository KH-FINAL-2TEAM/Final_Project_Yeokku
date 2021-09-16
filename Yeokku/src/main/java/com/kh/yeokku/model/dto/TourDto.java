package com.kh.yeokku.model.dto;

public class TourDto {
	private String contentTypeId;
	private String areaCode;
	private String sigunguCode;
	private String keyword;
	
	public TourDto() {
		super();
	}
	public TourDto(String contentTypeId, String areaCode, String sigunguCode, String keyword) {
		super();
		this.contentTypeId = contentTypeId;
		this.areaCode = areaCode;
		this.sigunguCode = sigunguCode;
		this.keyword = keyword;
	}
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
