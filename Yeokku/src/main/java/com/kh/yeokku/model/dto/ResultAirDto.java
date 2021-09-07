package com.kh.yeokku.model.dto;

public class ResultAirDto {

	private String airlineEnglish;
	private String airlineKorean;
	private String arrivalcity;
	private String arrivalcityCode;
	private String domesticArrivalTime;
	private String domesticEddate;
	private String domesticFri;
	private String domesticMon;
	private String domesticNum;
	private String domesticSat;
	private String domesticStartTime;
	private String domesticStdate;
	private String domesticSun;
	private String domesticThu;
	private String domesticTue;
	private String domesticWed;
	private String flightPurpose;
	private String startcity;
	private String startcityCode;
	
	
	public ResultAirDto() {
		super();
	}

	public ResultAirDto(String airlineEnglish, String airlineKorean, String arrivalcity, String arrivalcityCode,
			String domesticArrivalTime, String domesticEddate, String domesticFri, String domesticMon,
			String domesticNum, String domesticSat, String domesticStartTime, String domesticStdate, String domesticSun,
			String domesticThu, String domesticTue, String domesticWed, String flightPurpose, String startcity,
			String startcityCode) {
		super();
		this.airlineEnglish = airlineEnglish;
		this.airlineKorean = airlineKorean;
		this.arrivalcity = arrivalcity;
		this.arrivalcityCode = arrivalcityCode;
		this.domesticArrivalTime = domesticArrivalTime;
		this.domesticEddate = domesticEddate;
		this.domesticFri = domesticFri;
		this.domesticMon = domesticMon;
		this.domesticNum = domesticNum;
		this.domesticSat = domesticSat;
		this.domesticStartTime = domesticStartTime;
		this.domesticStdate = domesticStdate;
		this.domesticSun = domesticSun;
		this.domesticThu = domesticThu;
		this.domesticTue = domesticTue;
		this.domesticWed = domesticWed;
		this.flightPurpose = flightPurpose;
		this.startcity = startcity;
		this.startcityCode = startcityCode;
	}

	public String getAirlineEnglish() {
		return airlineEnglish;
	}

	public void setAirlineEnglish(String airlineEnglish) {
		this.airlineEnglish = airlineEnglish;
	}

	public String getAirlineKorean() {
		return airlineKorean;
	}

	public void setAirlineKorean(String airlineKorean) {
		this.airlineKorean = airlineKorean;
	}

	public String getArrivalcity() {
		return arrivalcity;
	}

	public void setArrivalcity(String arrivalcity) {
		this.arrivalcity = arrivalcity;
	}

	public String getArrivalcityCode() {
		return arrivalcityCode;
	}

	public void setArrivalcityCode(String arrivalcityCode) {
		this.arrivalcityCode = arrivalcityCode;
	}

	public String getDomesticArrivalTime() {
		return domesticArrivalTime;
	}

	public void setDomesticArrivalTime(String domesticArrivalTime) {
		this.domesticArrivalTime = domesticArrivalTime;
	}

	public String getDomesticEddate() {
		return domesticEddate;
	}

	public void setDomesticEddate(String domesticEddate) {
		this.domesticEddate = domesticEddate;
	}

	public String getDomesticFri() {
		return domesticFri;
	}

	public void setDomesticFri(String domesticFri) {
		this.domesticFri = domesticFri;
	}

	public String getDomesticMon() {
		return domesticMon;
	}

	public void setDomesticMon(String domesticMon) {
		this.domesticMon = domesticMon;
	}

	public String getDomesticNum() {
		return domesticNum;
	}

	public void setDomesticNum(String domesticNum) {
		this.domesticNum = domesticNum;
	}

	public String getDomesticSat() {
		return domesticSat;
	}

	public void setDomesticSat(String domesticSat) {
		this.domesticSat = domesticSat;
	}

	public String getDomesticStartTime() {
		return domesticStartTime;
	}

	public void setDomesticStartTime(String domesticStartTime) {
		this.domesticStartTime = domesticStartTime;
	}

	public String getDomesticStdate() {
		return domesticStdate;
	}

	public void setDomesticStdate(String domesticStdate) {
		this.domesticStdate = domesticStdate;
	}

	public String getDomesticSun() {
		return domesticSun;
	}

	public void setDomesticSun(String domesticSun) {
		this.domesticSun = domesticSun;
	}

	public String getDomesticThu() {
		return domesticThu;
	}

	public void setDomesticThu(String domesticThu) {
		this.domesticThu = domesticThu;
	}

	public String getDomesticTue() {
		return domesticTue;
	}

	public void setDomesticTue(String domesticTue) {
		this.domesticTue = domesticTue;
	}

	public String getDomesticWed() {
		return domesticWed;
	}

	public void setDomesticWed(String domesticWed) {
		this.domesticWed = domesticWed;
	}

	public String getFlightPurpose() {
		return flightPurpose;
	}

	public void setFlightPurpose(String flightPurpose) {
		this.flightPurpose = flightPurpose;
	}

	public String getStartcity() {
		return startcity;
	}

	public void setStartcity(String startcity) {
		this.startcity = startcity;
	}

	public String getStartcityCode() {
		return startcityCode;
	}

	public void setStartcityCode(String startcityCode) {
		this.startcityCode = startcityCode;
	}

	@Override
	public String toString() {
		return "ResultAirDto [airlineEnglish=" + airlineEnglish + ", airlineKorean=" + airlineKorean + ", arrivalcity="
				+ arrivalcity + ", arrivalcityCode=" + arrivalcityCode + ", domesticArrivalTime=" + domesticArrivalTime
				+ ", domesticEddate=" + domesticEddate + ", domesticFri=" + domesticFri + ", domesticMon=" + domesticMon
				+ ", domesticNum=" + domesticNum + ", domesticSat=" + domesticSat + ", domesticStartTime="
				+ domesticStartTime + ", domesticStdate=" + domesticStdate + ", domesticSun=" + domesticSun
				+ ", domesticThu=" + domesticThu + ", domesticTue=" + domesticTue + ", domesticWed=" + domesticWed
				+ ", flightPurpose=" + flightPurpose + ", startcity=" + startcity + ", startcityCode=" + startcityCode
				+ "]";
	}
	
}
