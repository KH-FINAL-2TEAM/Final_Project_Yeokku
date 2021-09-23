package com.kh.yeokku.model.dto;

public class TourResultDto {
	private String homepage;
	private String title;
	private String addr1;
	private String addr2;
	private String cat1;
	private String cat2;
	private String cat3;
	private String firstimage;
	private String mapx;
	private String mapy;
	private String contentid;
	private String zipcode;
	private String tel;
	private String overview;
	
	public TourResultDto() {
		super();
	}
	public TourResultDto(String homepage, String title, String addr1, String addr2, String cat1, String cat2,
			String cat3, String firstimage, String mapx, String mapy, String contentid, String zipcode, String tel,
			String overview) {
		super();
		this.homepage = homepage;
		this.title = title;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.cat3 = cat3;
		this.firstimage = firstimage;
		this.mapx = mapx;
		this.mapy = mapy;
		this.contentid = contentid;
		this.zipcode = zipcode;
		this.tel = tel;
		this.overview = overview;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	
	
	
	
}
