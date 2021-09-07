package com.kh.yeokku.model.dto;

public class TransResultShipDto {

	private String vihicleNm;
	private String depPlaceNm;
	private String arrPlaceNm;
	private String depPlandTime;
	private String arrPlandTime;
	private String charge;
	
	public TransResultShipDto() {
		super();
	}
	
	public TransResultShipDto(String vihicleNm, String depPlaceNm, String arrPlaceNm, String depPlandTime,
			String arrPlandTime, String charge) {
		super();
		this.vihicleNm = vihicleNm;
		this.depPlaceNm = depPlaceNm;
		this.arrPlaceNm = arrPlaceNm;
		this.depPlandTime = depPlandTime;
		this.arrPlandTime = arrPlandTime;
		this.charge = charge;
	}

	public String getArrPlaceNm() {
		return arrPlaceNm;
	}
	public void setArrPlaceNm(String arrPlaceNm) {
		this.arrPlaceNm = arrPlaceNm;
	}
	public String getVihicleNm() {
		return vihicleNm;
	}
	public void setVihicleNm(String vihicleNm) {
		this.vihicleNm = vihicleNm;
	}
	public String getDepPlaceNm() {
		return depPlaceNm;
	}
	public void setDepPlaceNm(String depPlaceNm) {
		this.depPlaceNm = depPlaceNm;
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
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	
	@Override
	public String toString() {
		return "TransResultShipDto [vihicleNm=" + vihicleNm + ", depPlaceNm=" + depPlaceNm + ", depPlandTime="
				+ depPlandTime + ", arrPlandTime=" + arrPlandTime + ", charge=" + charge + "]";
	}
	
}
