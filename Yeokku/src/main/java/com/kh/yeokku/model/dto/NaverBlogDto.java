package com.kh.yeokku.model.dto;

public class NaverBlogDto {
	private String keyword;
	private String title;
	private String description;
	private String link;
	
	public NaverBlogDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NaverBlogDto(String keyword, String title, String description, String link) {
		super();
		this.keyword = keyword;
		this.title = title;
		this.description = description;
		this.link = link;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	

}
