package com.kh.yeokku.model.dto;

public class TourCatDto {
	private String cat1;
	private String cat2;
	private String cat3;
	private String cat1_kor;
	private String cat2_kor;
	private String cat3_kor;
	public TourCatDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TourCatDto(String cat1, String cat2, String cat3, String cat1_kor, String cat2_kor, String cat3_kor) {
		super();
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.cat3 = cat3;
		this.cat1_kor = cat1_kor;
		this.cat2_kor = cat2_kor;
		this.cat3_kor = cat3_kor;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public String getCat1_kor() {
		return cat1_kor;
	}
	public void setCat1_kor(String cat1_kor) {
		this.cat1_kor = cat1_kor;
	}
	public String getCat2_kor() {
		return cat2_kor;
	}
	public void setCat2_kor(String cat2_kor) {
		this.cat2_kor = cat2_kor;
	}
	public String getCat3_kor() {
		return cat3_kor;
	}
	public void setCat3_kor(String cat3_kor) {
		this.cat3_kor = cat3_kor;
	}
	
	
	
	
}
