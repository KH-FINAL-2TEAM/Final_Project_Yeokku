package com.kh.yeokku.model.dao.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

import com.kh.yeokku.model.dao.TripplaceDao;
import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;

@Repository
public class TripplaceDaoImpl implements TripplaceDao{
	String serviceKey ="ZQscfOiocZrQpK8kXr9QPPdHPfyhCNoAZ8fMA%2BO83K3x1rrMn8AL%2FP%2FvKnQghMb8XezP4cqE%2Fpree8FPMqfdwQ%3D%3D";
	
	@Override
	public List<TourResultDto> tripplaceMain() {
		String baseUrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		
		List<TourResultDto> list = new ArrayList<TourResultDto>();
		
		String deKey = null;
		try {
			deKey=URLDecoder.decode(serviceKey,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("서비스키 디코딩 에러");
			e.printStackTrace();
		}
		String etcUrl = "&arrange=B&MobileOS=ETC&MobileApp=AppTest";
		String addr = baseUrl+deKey+etcUrl;
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);
		
		rt.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));	//한글깨짐 이슈 해결
		
		ResponseEntity<String> res = rt.exchange(addr, HttpMethod.GET, entity, String.class);
		JSONParser parser = new JSONParser();
		
		JSONObject obj;
		
		try {
			obj = (JSONObject) parser.parse(res.getBody());
			JSONObject jsonResponse = (JSONObject) obj.get("response");
			JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
			JSONObject jsonItems = (JSONObject) jsonBody.get("items");
			JSONArray jsonItem = (JSONArray) jsonItems.get("item");
			
			for(int i=0; i<8; i++) {
				JSONObject itemObject = (JSONObject) jsonItem.get(i);
				
				TourResultDto resDto = new TourResultDto();
				
				String title = (String) itemObject.get("title");
				String addr1 = (String) itemObject.get("addr1");
				String firstimage = (String) itemObject.get("firstimage");
				String contentid = String.valueOf(itemObject.get("contentid"));
				
				resDto.setTitle(title);
				resDto.setAddr1(addr1);
				resDto.setFirstimage(firstimage);
				resDto.setContentid(contentid);
				
				list.add(resDto);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<TourResultDto> searchResult(TourDto dto, String arrange) {
		List<TourResultDto> list = new ArrayList<TourResultDto>();
		
		String contentTypeId = dto.getContentTypeId();
		String areaCode = dto.getAreaCode();
		String sigunguCode = dto.getSigunguCode();
		String keyword = dto.getKeyword();		//RestTemplate이 자동 인코딩하기 때문에 인코딩 필요 없음
		String baseUrl ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String deKey = null;	//RestTemplate이 자동 인코딩하기 때문에 디코딩 해줘야함
		try {
			deKey = URLDecoder.decode(serviceKey, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			System.out.println("서비스키 디코딩 에러");
			e1.printStackTrace();
		}
		if(contentTypeId==null) {contentTypeId="";}
		if(areaCode==null) {areaCode="";}
		if(sigunguCode==null) {sigunguCode="";}
		if(keyword==null) {keyword="";}
		if(arrange==null||arrange=="") { arrange="A"; }
		
		String etcUrl ="&contentTypeId="+contentTypeId+"&areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&arrange="+arrange+"&numOfRows=1000&pageNo=1&listYN=Y&MobileOS=ETC&MobileApp=TestApp";
		String addr = baseUrl+deKey+etcUrl;
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8); 
		HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);

		rt.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));	//한글깨짐 이슈 해결
		 
		ResponseEntity<String> res = rt.exchange(addr, HttpMethod.GET,entity, String.class);
		
		JSONParser jParser = new JSONParser();
		 
		 
		try {
			JSONObject obj = (JSONObject) jParser.parse(res.getBody());
			JSONObject jsonResponse = (JSONObject) obj.get("response");
			JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
			
			if(jsonBody.get("items")==""||jsonBody.get("items")==null) {
				
				return list;
			}
			
			String totalCount = String.valueOf(jsonBody.get("totalCount"));
			
			String addr2 = baseUrl+deKey+"&keyword="+keyword+"&contentTypeId="+contentTypeId+"&areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&numOfRows="+totalCount+"&pageNo=1&listYN=Y&arrange="+arrange+"&MobileOS=ETC&MobileApp=TestApp";
			
			ResponseEntity<String> res2 = rt.exchange(addr2, HttpMethod.GET, entity, String.class);
			
			JSONObject obj2 = (JSONObject) jParser.parse(res2.getBody());
			JSONObject jsonResponse2 = (JSONObject) obj2.get("response");
			JSONObject jsonBody2 = (JSONObject) jsonResponse2.get("body");
			
			if(jsonBody.get("items") instanceof String) {
				
				return list;
			} else {
				JSONObject jsonItems = (JSONObject) jsonBody2.get("items");
				
				if( jsonItems.get("item") instanceof JSONObject) {
					JSONObject jsonItem = (JSONObject) jsonItems.get("item");
					
					TourResultDto resDto = new TourResultDto();
					 
					String title = (String) jsonItem.get("title");
					String addr1 = (String) jsonItem.get("addr1");
					String firstimage = (String) jsonItem.get("firstimage");
					String contentid = String.valueOf(jsonItem.get("contentid"));;
					String mapx = String.valueOf(jsonItem.get("mapx"));
					String mapy = String.valueOf(jsonItem.get("mapy"));
					 
					resDto.setTitle(title);
					resDto.setAddr1(addr1);
					resDto.setFirstimage(firstimage);
					resDto.setContentid(contentid);
					resDto.setMapx(mapx);
					resDto.setMapy(mapy);
					
					list.add(resDto);
					
				} else {
					JSONArray jsonItem = (JSONArray) jsonItems.get("item");
					
					for(int i=0; i<jsonItem.size(); i++) {
						
						JSONObject itemObject = (JSONObject) jsonItem.get(i);
						
						TourResultDto resDto = new TourResultDto();
						
						String title = (String) itemObject.get("title");
						String addr1 = (String) itemObject.get("addr1");
						String firstimage = (String) itemObject.get("firstimage");
						String contentid = String.valueOf(itemObject.get("contentid"));
						String mapx = String.valueOf(itemObject.get("mapx"));
						String mapy = String.valueOf(itemObject.get("mapy"));
						
						resDto.setTitle(title);
						resDto.setAddr1(addr1);
						resDto.setFirstimage(firstimage);
						resDto.setContentid(contentid);
						resDto.setMapx(mapx);
						resDto.setMapy(mapy);
						
						list.add(resDto);
					}
				}
			}
				
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

	@Override
	public TourResultDto searchResultDetail(String contentid) {
		TourResultDto resDto = new TourResultDto();
		
		String baseUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String etcUrl = "&contentId="+contentid+"&defaultYN=Y&firstImageYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&&MobileOS=ETC&MobileApp=AppTest";
		String deKey = null;
		try {
			deKey=URLDecoder.decode(serviceKey,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("서비스키 디코딩 에러");
			e.printStackTrace();
		}
		
		String addr = baseUrl+deKey+etcUrl;
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);
		rt.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));	
		
		ResponseEntity<String> res = rt.exchange(addr, HttpMethod.GET,entity, String.class);
		
		JSONParser parser = new JSONParser();
		JSONObject obj;
		
		try {
			obj = (JSONObject) parser.parse(res.getBody());
			JSONObject jsonResponse = (JSONObject) obj.get("response");
			JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
			JSONObject jsonItems = (JSONObject) jsonBody.get("items");
			JSONObject jsonItem = (JSONObject) jsonItems.get("item");
			
			String homepage = (String) jsonItem.get("homepage");
			String tel = (String) jsonItem.get("tel");
			String title = (String) jsonItem.get("title");
			String firstimage = (String) jsonItem.get("firstimage");
			String cat1 = (String) jsonItem.get("cat1");
			String cat2 = (String) jsonItem.get("cat2");
			String cat3 = (String) jsonItem.get("cat3");
			String addr1 = (String) jsonItem.get("addr1");
			String addr2 = (String) jsonItem.get("addr2");
			String zipcode = String.valueOf(jsonItem.get("zipcode"));
			String mapx = String.valueOf(jsonItem.get("mapx"));
			String mapy = String.valueOf(jsonItem.get("mapy"));
			String mlevel = String.valueOf(jsonItem.get("mlevel"));
			String overview = (String) jsonItem.get("overview");
			
			resDto.setHomepage(homepage);
			resDto.setTel(tel);
			resDto.setTitle(title);
			resDto.setFirstimage(firstimage);
			resDto.setCat1(cat1);
			resDto.setCat2(cat2);
			resDto.setCat3(cat3);
			resDto.setAddr1(addr1);
			resDto.setAddr2(addr2);
			resDto.setZipcode(zipcode);
			resDto.setMapx(mapx);
			resDto.setMapy(mapy);
			resDto.setMlevel(mlevel);
			resDto.setOverview(overview);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return resDto;
	}

	@Override
	public List<TourResultDto> searchClosePlace(String type, String mapx, String mapy) {
		List<TourResultDto> list = new ArrayList<TourResultDto>();
		
		String baseUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=";
		String deKey=null;
		try {
			deKey = URLDecoder.decode(serviceKey, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("서비스키 디코딩에러");
			e.printStackTrace();
		}
		String etcUrl = "&mapX="+mapx+"&mapY="+mapy+"&contentTypeId="+type+"&radius=2000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTest";
		String addr = baseUrl+deKey+etcUrl;
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);
		rt.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		
		ResponseEntity<String> res = rt.exchange(addr, HttpMethod.GET, entity, String.class);
		
		JSONParser parser = new JSONParser();
		
		JSONObject obj;
		
		try {
			obj = (JSONObject) parser.parse(res.getBody());
			JSONObject jsonResponse = (JSONObject) obj.get("response");
			JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
			
			if(jsonBody.get("items") instanceof String) {
				
				return list;
				
			} else {
				JSONObject jsonItems = (JSONObject) jsonBody.get("items");
				
				if( jsonItems.get("item") instanceof JSONObject) {
					JSONObject jsonItem = (JSONObject) jsonItems.get("item");
					
					TourResultDto resDto = new TourResultDto();
					
					String title = (String) jsonItem.get("title");
					String addr1 = (String) jsonItem.get("addr1");
					String firstimage = (String) jsonItem.get("firstimage");
					String contentid = String.valueOf(jsonItem.get("contentid"));
					
					resDto.setTitle(title);
					resDto.setAddr1(addr1);
					resDto.setFirstimage(firstimage);
					resDto.setContentid(contentid);
					
					list.add(resDto);
					
				} else {
					JSONArray jsonItem = (JSONArray) jsonItems.get("item");
					
					for(int i=0; i<jsonItem.size(); i++) {
						
						JSONObject itemObject = (JSONObject) jsonItem.get(i);
						
						TourResultDto resDto = new TourResultDto();
						
						String title = (String) itemObject.get("title");
						String addr1 = (String) itemObject.get("addr1");
						String firstimage = (String) itemObject.get("firstimage");
						String contentid = String.valueOf(itemObject.get("contentid"));
						
						resDto.setTitle(title);
						resDto.setAddr1(addr1);
						resDto.setFirstimage(firstimage);
						resDto.setContentid(contentid);
						
						list.add(resDto);
					}
				}
			} 
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
