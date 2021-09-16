package com.kh.yeokku.model.dao;

public interface TestDao {
	public StringBuilder CourseTourList(String contenttypeid); //투어 api url 생성
	public StringBuilder tourSearchList(String contenttypeid,String keyword); //검색기준 투어 api url 생성
}
