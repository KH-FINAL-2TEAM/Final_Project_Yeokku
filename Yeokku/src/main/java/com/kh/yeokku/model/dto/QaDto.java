package com.kh.yeokku.model.dto;

import java.util.Date;

public class QaDto {
	//db 변수
	private int qa_no;
	private String qa_name;
	private String qa_title;
	private String qa_content;
	private String qa_email;
	private Date qa_date;
	private Date qa_done_date;
	private String qa_confirm;
	
	public QaDto() {
		// TODO Auto-generated constructor stub
	}

	public QaDto(int qa_no, String qa_name, String qa_title, String qa_content, String qa_email, Date qa_date,
			Date qa_done_date, String qa_confirm) {
		super();
		this.qa_no = qa_no;
		this.qa_name = qa_name;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_email = qa_email;
		this.qa_date = qa_date;
		this.qa_done_date = qa_done_date;
		this.qa_confirm = qa_confirm;
	}


	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public String getQa_name() {
		return qa_name;
	}

	public void setQa_name(String qa_name) {
		this.qa_name = qa_name;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_email() {
		return qa_email;
	}

	public void setQa_email(String qa_email) {
		this.qa_email = qa_email;
	}

	public Date getQa_date() {
		return qa_date;
	}

	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}

	public Date getQa_done_date() {
		return qa_done_date;
	}

	public void setQa_done_date(Date qa_done_date) {
		this.qa_done_date = qa_done_date;
	}

	public String getQa_confirm() {
		return qa_confirm;
	}

	public void setQa_confirm(String qa_confirm) {
		this.qa_confirm = qa_confirm;
	}
	
	
}
