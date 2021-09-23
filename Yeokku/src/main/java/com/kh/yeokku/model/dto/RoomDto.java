package com.kh.yeokku.model.dto;

import java.util.Arrays;

import oracle.sql.BLOB;

public class RoomDto {

	private int tc_no;
	private String tc_userid;
	private String tc_title;
	private String tc_content;
	private String tc_date;
	private int tc_view;
	private int tc_like;
	private byte[] tc_jpg;
	private String tc_pw;
	private String tc_open;
	private String tc_tag;
	private String tc_q;
	private int tc_dc;
	
	public RoomDto() {
		super();
	}

	public RoomDto(int tc_no, String tc_userid, String tc_title, String tc_content, String tc_date, int tc_view,
			int tc_like, byte[] tc_jpg, String tc_pw, String tc_open, String tc_tag, String tc_q, int tc_dc) {
		super();
		this.tc_no = tc_no;
		this.tc_userid = tc_userid;
		this.tc_title = tc_title;
		this.tc_content = tc_content;
		this.tc_date = tc_date;
		this.tc_view = tc_view;
		this.tc_like = tc_like;
		this.tc_jpg = tc_jpg;
		this.tc_pw = tc_pw;
		this.tc_open = tc_open;
		this.tc_tag = tc_tag;
		this.tc_q = tc_q;
		this.tc_dc = tc_dc;
	}

	public int getTc_no() {
		return tc_no;
	}

	public void setTc_no(int tc_no) {
		this.tc_no = tc_no;
	}

	public String getTc_userid() {
		return tc_userid;
	}

	public void setTc_userid(String tc_userid) {
		this.tc_userid = tc_userid;
	}

	public String getTc_title() {
		return tc_title;
	}

	public void setTc_title(String tc_title) {
		this.tc_title = tc_title;
	}

	public String getTc_content() {
		return tc_content;
	}

	public void setTc_content(String tc_content) {
		this.tc_content = tc_content;
	}

	public String getTc_date() {
		return tc_date;
	}

	public void setTc_date(String tc_date) {
		this.tc_date = tc_date;
	}

	public int getTc_view() {
		return tc_view;
	}

	public void setTc_view(int tc_view) {
		this.tc_view = tc_view;
	}

	public int getTc_like() {
		return tc_like;
	}

	public void setTc_like(int tc_like) {
		this.tc_like = tc_like;
	}

	public byte[] getTc_jpg() {
		return tc_jpg;
	}

	public void setTc_jpg(byte[] tc_jpg) {
		this.tc_jpg = tc_jpg;
	}

	public String getTc_pw() {
		return tc_pw;
	}

	public void setTc_pw(String tc_pw) {
		this.tc_pw = tc_pw;
	}

	public String getTc_open() {
		return tc_open;
	}

	public void setTc_open(String tc_open) {
		this.tc_open = tc_open;
	}

	public String getTc_tag() {
		return tc_tag;
	}

	public void setTc_tag(String tc_tag) {
		this.tc_tag = tc_tag;
	}

	public String getTc_q() {
		return tc_q;
	}

	public void setTc_q(String tc_q) {
		this.tc_q = tc_q;
	}

	public int getTc_dc() {
		return tc_dc;
	}

	public void setTc_dc(int tc_dc) {
		this.tc_dc = tc_dc;
	}

	@Override
	public String toString() {
		return "RoomDto [tc_no=" + tc_no + ", tc_userid=" + tc_userid + ", tc_title=" + tc_title + ", tc_content="
				+ tc_content + ", tc_date=" + tc_date + ", tc_view=" + tc_view + ", tc_like=" + tc_like + ", tc_jpg="
				+ Arrays.toString(tc_jpg) + ", tc_pw=" + tc_pw + ", tc_open=" + tc_open + ", tc_tag=" + tc_tag
				+ ", tc_q=" + tc_q + ", tc_dc=" + tc_dc + "]";
	}
	
	
	
}
