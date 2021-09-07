package com.kh.yeokku.model.dto;

public class TransResultBusDto {

	private String gradeNm;
	private String depPlandTime;
	private String arrPlandTime;
	private String depPlaceNm;
	private String arrPlaceNm;
	private String charge;
	private String type;
	
	public TransResultBusDto() {
		super();
	}

	public TransResultBusDto(String gradeNm, String depPlandTime, String arrPlandTime, String depPlaceNm,
			String arrPlaceNm, String charge, String type) {
		super();
		this.gradeNm = gradeNm;
		this.depPlandTime = depPlandTime;
		this.arrPlandTime = arrPlandTime;
		this.depPlaceNm = depPlaceNm;
		this.arrPlaceNm = arrPlaceNm;
		this.charge = charge;
		this.type = type;
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
	public String getDepPlaceNm() {
		return depPlaceNm;
	}
	public void setDepPlaceNm(String depPlaceNm) {
		this.depPlaceNm = depPlaceNm;
	}
	public String getArrPlaceNm() {
		return arrPlaceNm;
	}
	public void setArrPlaceNm(String arrPlaceNm) {
		this.arrPlaceNm = arrPlaceNm;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "TransResultBusDto [gradeNm=" + gradeNm + ", depPlandTime=" + depPlandTime + ", arrPlandTime="
				+ arrPlandTime + ", depPlaceNm=" + depPlaceNm + ", arrPlaceNm=" + arrPlaceNm + ", charge=" + charge
				+ ", type=" + type + "]";
	}
	
}
