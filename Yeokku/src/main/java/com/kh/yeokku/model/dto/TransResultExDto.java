package com.kh.yeokku.model.dto;

public class TransResultExDto {

	private String gradeNm;
	private String depPlandTime;
	private String arrPlandTime;
	private String depPlcateNm;
	private String arrplaceNm;
	private String charge;
	
	
	public TransResultExDto() {
		super();
	}

	public TransResultExDto(String gradeNm, String depPlandTime, String arrPlandTime, String depPlcateNm,
			String arrplaceNm, String charge) {
		super();
		this.gradeNm = gradeNm;
		this.depPlandTime = depPlandTime;
		this.arrPlandTime = arrPlandTime;
		this.depPlcateNm = depPlcateNm;
		this.arrplaceNm = arrplaceNm;
		this.charge = charge;
	}

	public String getGradeNm() {
		return gradeNm;
	}

	public void setGradeNm(String gradeNm) {
		this.gradeNm = gradeNm;
	}

	public String getDepPlandTime() {
		return depPlandTime;
	}

	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}

	public String getArrPlandTime() {
		return arrPlandTime;
	}

	public void setArrPlandTime(String arrPlandTime) {
		this.arrPlandTime = arrPlandTime;
	}

	public String getDepPlcateNm() {
		return depPlcateNm;
	}

	public void setDepPlcateNm(String depPlcateNm) {
		this.depPlcateNm = depPlcateNm;
	}

	public String getArrplaceNm() {
		return arrplaceNm;
	}

	public void setArrplaceNm(String arrplaceNm) {
		this.arrplaceNm = arrplaceNm;
	}

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}
	
}
