package com.kh.yeokku.model.dto;

public class TransResultAirDto {
	
	private String vihicleId;
	private String airlineNm;
	private String depPlandTime;
	private String arrPlandTime;
	private String economyCharge;
	private String prestigeCharge;
	private String depAirportNm;
	private String arrAirportNm;
	
	public TransResultAirDto() {
		super();
	}
	
	public TransResultAirDto(String vihicleId, String airlineNm, String depPlandTime, String arrPlandTime,
			String economyCharge, String prestigeCharge, String depAirportNm, String arrAirportNm) {
		super();
		this.vihicleId = vihicleId;
		this.airlineNm = airlineNm;
		this.depPlandTime = depPlandTime;
		this.arrPlandTime = arrPlandTime;
		this.economyCharge = economyCharge;
		this.prestigeCharge = prestigeCharge;
		this.depAirportNm = depAirportNm;
		this.arrAirportNm = arrAirportNm;
	}
	
	public String getVihicleId() {
		return vihicleId;
	}
	public void setVihicleId(String vihicleId) {
		this.vihicleId = vihicleId;
	}
	public String getAirlineNm() {
		return airlineNm;
	}
	public void setAirlineNm(String airlineNm) {
		this.airlineNm = airlineNm;
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
	public String getEconomyCharge() {
		return economyCharge;
	}
	public void setEconomyCharge(String economyCharge) {
		this.economyCharge = economyCharge;
	}
	public String getPrestigeCharge() {
		return prestigeCharge;
	}
	public void setPrestigeCharge(String prestigeCharge) {
		this.prestigeCharge = prestigeCharge;
	}
	public String getDepAirportNm() {
		return depAirportNm;
	}
	public void setDepAirportNm(String depAirportNm) {
		this.depAirportNm = depAirportNm;
	}
	public String getArrAirportNm() {
		return arrAirportNm;
	}
	public void setArrAirportNm(String arrAirportNm) {
		this.arrAirportNm = arrAirportNm;
	}

	@Override
	public String toString() {
		return "TransResultAirDto [vihicleId=" + vihicleId + ", airlineNm=" + airlineNm + ", depPlandTime="
				+ depPlandTime + ", arrPlandTime=" + arrPlandTime + ", economyCharge=" + economyCharge
				+ ", prestigeCharge=" + prestigeCharge + ", depAirportNm=" + depAirportNm + ", arrAirportNm="
				+ arrAirportNm + "]";
	}
	
}
