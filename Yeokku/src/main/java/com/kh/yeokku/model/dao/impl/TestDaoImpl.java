package com.kh.yeokku.model.dao.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.TestDao;
@Repository
public class TestDaoImpl implements TestDao{

	@Override
	public StringBuilder CourseTourList(String contenttypeid) {
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        // 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
        try {
        	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=jLK5HOYHfkNqmB%2FXB1nEWEI66%2B%2BWD2DHpwrgEIKFd31SjomZJRf%2B3KsfW36QN%2BN2Noix9ae2l%2BuCuPRKEzeOVg%3D%3D"); /*Service Key*/
        	urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        	//urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        	urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=AppTest"); 
        	urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=ETC");
        	urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=A");
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=json");
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			System.out.println("api url create");
			e.printStackTrace();
		}
		return urlBuilder;
	}

	@Override
	public StringBuilder tourSearchList(String contenttypeid, String keyword) {
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
        // 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
        try {
        	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=jLK5HOYHfkNqmB%2FXB1nEWEI66%2B%2BWD2DHpwrgEIKFd31SjomZJRf%2B3KsfW36QN%2BN2Noix9ae2l%2BuCuPRKEzeOVg%3D%3D"); /*Service Key*/
        	urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        	//urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        	urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=AppTest"); 
        	urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=ETC");
        	urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=A");
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=json");
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttypeid,"UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(keyword,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			System.out.println("api url create");
			e.printStackTrace();
		}
		return urlBuilder;
	}

}
