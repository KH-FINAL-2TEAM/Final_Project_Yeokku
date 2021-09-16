package com.kh.yeokku.model.biz;

import java.io.IOException;

import com.google.gson.JsonArray;

public interface TestBiz {
	public JsonArray CourseTourList(String contenttypeid) throws IOException; //투어 api url 객체생성 
	public JsonArray tourSearchList(String contenttypeid,String keyword) throws IOException; //검색기준 투어 api url 생성
	public JsonArray parSer(StringBuilder sb); //api 리턴 파서

}
