package com.kh.yeokku.model.dao.impl;

import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.yeokku.model.dao.TransDao;
import com.kh.yeokku.model.dto.TransResultAirDto;
import com.kh.yeokku.model.dto.TransResultBusDto;
import com.kh.yeokku.model.dto.TransResultShipDto;
import com.kh.yeokku.model.dto.TransResultTrainDto;
import com.kh.yeokku.model.dto.TransSearchDto;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@Repository
public class TransDaoImpl implements TransDao {
	
	//String key = "kwDkY16Hb17nzd1oXj1gPDW3w59pp3McZn3hO4ut1mg%2F8HCFskd%2FEqjPgKtYBvkqPIUnPPEgfUudq2lnyFNyvg%3D%3D";
	String key = "kwDkY16Hb17nzd1oXj1gPDW3w59pp3McZn3hO4ut1mg/8HCFskd/EqjPgKtYBvkqPIUnPPEgfUudq2lnyFNyvg==";

	@Override
	public Map<String, List> search_air(TransSearchDto dto) {
		
		List <TransResultAirDto>list = new ArrayList();
		List <TransResultAirDto>list2 = new ArrayList();
		
		Map<String, List> map = new HashMap<String, List>();
		
		try {
			
			StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*출발공항ID*/
	        urlBuilder.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*도착공항ID*/
	        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getStart_time(), "UTF-8")); /*출발일*/

	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");

	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        String part[] = sb.toString().split("<item>"); 
	        
	        /////////////////////////////////////////////////////////////////////////////
	        /////////////////////////////////////////////////////////////////////////////
	        
	        StringBuilder urlBuilder2 = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
	        urlBuilder2.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder2.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*출발공항ID*/
	        urlBuilder2.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*도착공항ID*/
	        urlBuilder2.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getReturn_time(), "UTF-8")); /*출발일*/

	        URL url2 = new URL(urlBuilder2.toString());
	        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
	        conn2.setRequestMethod("GET");
	        conn2.setRequestProperty("Content-type", "application/json");

	        BufferedReader rd2;
	        if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
	            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
	        } else {
	            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
	        }
	        StringBuilder sb2 = new StringBuilder();
	        String line2;
	        while ((line2 = rd2.readLine()) != null) {
	            sb2.append(line2);
	        }
	        rd2.close();
	        conn2.disconnect();
	        
	        String part2[] = sb2.toString().split("<item>"); 
	        
			/////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////
	        
	        for(int i=1; i<part.length; i++) {		
				TransResultAirDto airdto = new TransResultAirDto();

				if(part[i].contains("<vihicleId>")) airdto.setVihicleId( part[i].substring( part[i].indexOf("<vihicleId>")+11, part[i].indexOf("</vihicleId>") ) );
				if(part[i].contains("<airlineNm>")) airdto.setAirlineNm( part[i].substring( part[i].indexOf("<airlineNm>")+11, part[i].indexOf("</airlineNm>") ) );
				if(part[i].contains("<depPlandTime>")) airdto.setDepPlandTime( part[i].substring( part[i].indexOf("<depPlandTime>")+14, part[i].indexOf("</depPlandTime>") ) );
				if(part[i].contains("<arrPlandTime>")) airdto.setArrPlandTime( part[i].substring( part[i].indexOf("<arrPlandTime>")+14, part[i].indexOf("</arrPlandTime>") ) );
				if(part[i].contains("<economyCharge>")) airdto.setEconomyCharge( part[i].substring( part[i].indexOf("<economyCharge>")+15, part[i].indexOf("</economyCharge>") ) );
				if(part[i].contains("<prestigeCharge>")) airdto.setPrestigeCharge( part[i].substring( part[i].indexOf("<prestigeCharge>")+16, part[i].indexOf("</prestigeCharge>") ) );
				if(part[i].contains("<depAirportNm>")) airdto.setDepAirportNm( part[i].substring( part[i].indexOf("<depAirportNm>")+14, part[i].indexOf("</depAirportNm>") ) );
				if(part[i].contains("<arrAirportNm>")) airdto.setArrAirportNm( part[i].substring( part[i].indexOf("<arrAirportNm>")+14, part[i].indexOf("</arrAirportNm>") ) );

				list.add(airdto);
			}
			
			for(int i=1; i<part2.length; i++) {
				TransResultAirDto airdto2 = new TransResultAirDto();

				if(part2[i].contains("<vihicleId>")) airdto2.setVihicleId( part2[i].substring( part2[i].indexOf("<vihicleId>")+11, part2[i].indexOf("</vihicleId>") ) );
				if(part2[i].contains("<airlineNm>")) airdto2.setAirlineNm( part2[i].substring( part2[i].indexOf("<airlineNm>")+11, part2[i].indexOf("</airlineNm>") ) );
				if(part2[i].contains("<depPlandTime>")) airdto2.setDepPlandTime( part2[i].substring( part2[i].indexOf("<depPlandTime>")+14, part2[i].indexOf("</depPlandTime>") ) );
				if(part2[i].contains("<arrPlandTime>")) airdto2.setArrPlandTime( part2[i].substring( part2[i].indexOf("<arrPlandTime>")+14, part2[i].indexOf("</arrPlandTime>") ) );
				if(part2[i].contains("<economyCharge>")) airdto2.setEconomyCharge( part2[i].substring( part2[i].indexOf("<economyCharge>")+15, part2[i].indexOf("</economyCharge>") ) );
				if(part2[i].contains("<prestigeCharge>")) airdto2.setPrestigeCharge( part2[i].substring( part2[i].indexOf("<prestigeCharge>")+16, part2[i].indexOf("</prestigeCharge>") ) );
				if(part2[i].contains("<depAirportNm>")) airdto2.setDepAirportNm( part2[i].substring( part2[i].indexOf("<depAirportNm>")+14, part2[i].indexOf("</depAirportNm>") ) );
				if(part2[i].contains("<arrAirportNm>")) airdto2.setArrAirportNm( part2[i].substring( part2[i].indexOf("<arrAirportNm>")+14, part2[i].indexOf("</arrAirportNm>") ) );

				list2.add(airdto2);
			}
	    	
		} catch( Exception e ) { e.printStackTrace(); }
		
		map.put("go", list);
		map.put("back", list2);

		return map;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public Map<String, List> search_ship(TransSearchDto dto) {
		
		Map<String, List> map = new HashMap<String, List>();
		
		String str="";
		String allstr = "";

		try {
			BufferedReader reader = new BufferedReader( new FileReader("c:\\Temp\\Ship.txt") );
			while ((str = reader.readLine()) != null) { allstr += str; }
			reader.close();
		} catch(Exception e) {}
		
		
		allstr = allstr.replace("</item>", "");
		
		String codelist[] = allstr.split("<item>");
		String temp_all = "a";
		
		for(int i=1; i<codelist.length; i++) {
			if( codelist[i].contains(dto.getStart_loc()) ) {
				if(codelist[i].contains("<terminalNm>")) { temp_all += "&b&SEA" + codelist[i].substring( codelist[i].indexOf("<terminalId>")+12, codelist[i].indexOf("</terminalId>") ) + "0"; continue; }
				if(codelist[i].contains("<adress>")) { temp_all += "&b&SEA" + codelist[i].substring( codelist[i].indexOf("<address>")+9, codelist[i].indexOf("</address>") ) + "0"; continue; }
			}
		}
		
		String codeall[] = temp_all.split("&b&");	
		temp_all = "a";
		
		for(int i=0; i<codelist.length; i++) {
			if( codelist[i].contains(dto.getGoal_loc()) ) {
				if(codelist[i].contains("<terminalNm>")) { temp_all += "&b&SEA" + codelist[i].substring( codelist[i].indexOf("<terminalId>")+12, codelist[i].indexOf("</terminalId>") ) + "0"; continue; }
				if(codelist[i].contains("<adress>")) { temp_all += "&b&SEA" + codelist[i].substring( codelist[i].indexOf("<address>")+9, codelist[i].indexOf("</address>") ) + "0"; continue; }
			}
		}
		
		String codeall2[] = temp_all.split("&b&");
		
		System.out.println("출:");
		for(String s : codeall) {
			  
			 System.out.println(s);
					  
			}
		System.out.println("골:");
		for(String s : codeall2) {
			  
			 System.out.println(s);
					  
			}
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		List <TransResultShipDto>list = new ArrayList();
		List <TransResultShipDto>list2 = new ArrayList();
		
		try {		
			
			StringBuilder sb = new StringBuilder();
			
			for(int i=1; i<codeall.length; i++) {
				
				for(int j=1; j<codeall2.length; j++) {
					
					StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcShipNvgInfoService/getShipOpratInfoList"); /*URL*/
			        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
			        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getStart_time(), "UTF-8")); /*출발일*/
			        urlBuilder.append("&" + URLEncoder.encode("arrNodeId","UTF-8") + "=" + URLEncoder.encode(codeall[i], "UTF-8")); /*출발지ID*/
			        urlBuilder.append("&" + URLEncoder.encode("depNodeId","UTF-8") + "=" + URLEncoder.encode(codeall2[j], "UTF-8")); /*도착지ID*/

			        URL url = new URL(urlBuilder.toString());
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("GET");
			        conn.setRequestProperty("Content-type", "application/json");

			        BufferedReader rd;
			        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        } else {
			            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			        }
			        String line;
			        while ((line = rd.readLine()) != null) {
			            sb.append(line);
			        }
			        rd.close();
			        conn.disconnect();
			        
			        if(sb.toString().length() < 1) { return map; }
				}
				
			}
	        
	        String part[] = sb.toString().split("<item>"); 
	        
	        /////////////////////////////////////////////////////////////////////////////
	        /////////////////////////////////////////////////////////////////////////////
	        
	        StringBuilder sb2 = new StringBuilder();
	        
	        for(int i=1; i<codeall.length; i++) {
				
				for(int j=1; j<codeall2.length; j++) {
					
					StringBuilder urlBuilder2 = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcShipNvgInfoService/getShipOpratInfoList"); /*URL*/
			        urlBuilder2.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
			        urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			        urlBuilder2.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(codeall2[j], "UTF-8")); /*출발일*/
			        urlBuilder2.append("&" + URLEncoder.encode("depNodeId","UTF-8") + "=" + URLEncoder.encode(codeall[i], "UTF-8")); /*출발지ID*/

			        URL url2 = new URL(urlBuilder2.toString());
			        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
			        conn2.setRequestMethod("GET");
			        conn2.setRequestProperty("Content-type", "application/json");

			        BufferedReader rd2;
			        if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
			            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
			        } else {
			            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
			        }
			        String line2;
			        while ((line2 = rd2.readLine()) != null) {
			            sb2.append(line2);
			        }
			        rd2.close();
			        conn2.disconnect();
				}
				
			}

	        String part2[] = sb2.toString().split("<item>"); 
	        
			/////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////
	        
	        for(int i=1; i<part.length; i++) {
				
	            TransResultShipDto Shipdto = new TransResultShipDto();
	            
	            if(part[i].contains("<vihicleNm>")) Shipdto.setVihicleNm( part[i].substring( part[i].indexOf("<vihicleNm>")+11, part[i].indexOf("</vihicleNm>") ) );
	            if(part[i].contains("<depPlaceNm>")) Shipdto.setDepPlaceNm( part[i].substring( part[i].indexOf("<depPlaceNm>")+12, part[i].indexOf("</depPlaceNm>") ) );
	            if(part[i].contains("<arrPlaceNm>")) Shipdto.setArrPlaceNm( part[i].substring( part[i].indexOf("<arrPlaceNm>")+12, part[i].indexOf("</arrPlaceNm>") ) );
	            if(part[i].contains("<depPlandTime>")) Shipdto.setDepPlandTime( part[i].substring( part[i].indexOf("<depPlandTime>")+14, part[i].indexOf("</depPlandTime>") ) );
	            if(part[i].contains("<arrPlandTime>\"")) Shipdto.setArrPlandTime( part[i].substring( part[i].indexOf("<arrPlandTime>")+14, part[i].indexOf("</arrPlandTime>") ) );
	            if(part[i].contains("<charge>")) Shipdto.setCharge( part[i].substring( part[i].indexOf("<charge>")+8, part[i].indexOf("</charge>") ) );

	            list.add(Shipdto);
	        }
	        for(int i=1; i<part2.length; i++) {
	            
	            TransResultShipDto Shipdto2 = new TransResultShipDto();
	            
	            if(part2[i].contains("<vihicleNm>")) Shipdto2.setVihicleNm( part2[i].substring( part2[i].indexOf("<vihicleNm>")+11, part2[i].indexOf("</vihicleNm>") ) );
	            if(part2[i].contains("<depPlaceNm>")) Shipdto2.setDepPlaceNm( part2[i].substring( part2[i].indexOf("<depPlaceNm>")+12, part2[i].indexOf("</depPlaceNm>") ) );
	            if(part2[i].contains("<arrPlaceNm>")) Shipdto2.setArrPlaceNm( part2[i].substring( part2[i].indexOf("<arrPlaceNm>")+12, part2[i].indexOf("</arrPlaceNm>") ) );
	            if(part2[i].contains("<depPlandTime>")) Shipdto2.setDepPlandTime( part2[i].substring( part2[i].indexOf("<depPlandTime>")+14, part2[i].indexOf("</depPlandTime>") ) );
	            if(part2[i].contains("<arrPlandTime>\"")) Shipdto2.setArrPlandTime( part2[i].substring( part2[i].indexOf("<arrPlandTime>")+14, part2[i].indexOf("</arrPlandTime>") ) );
	            if(part2[i].contains("<charge>")) Shipdto2.setCharge( part2[i].substring( part2[i].indexOf("<charge>")+8, part2[i].indexOf("</charge>") ) );

	            list2.add(Shipdto2);
	        }
			
		} catch( Exception e ) { e.printStackTrace(); }
		
		map.put("go", list);
		map.put("back", list2);

		return map;	
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public Map<String, List> search_train(TransSearchDto dto) {
		
		String str="";
		String allstr = "";
		Map<String, String> city = new HashMap<String, String>();

		try {
			BufferedReader reader = new BufferedReader( new FileReader("c:\\Temp\\City.txt") );
			while ((str = reader.readLine()) != null) { allstr += str; }
			reader.close();
		} catch(Exception e) {}
		
		allstr = allstr.replace("</item1>", "");
		
		String codelist[] = allstr.split("<item1>");

		for(int i=1; i<codelist.length; i++) {
			String cityname = codelist[i].substring( codelist[i].indexOf("<cityname>")+10, codelist[i].indexOf("</cityname>") );
			String citycode = codelist[i].substring( codelist[i].indexOf("<citycode>")+10, codelist[i].indexOf("</citycode>") );
			city.put(cityname, citycode);
		}
		
		/*
		for(String key : city.keySet()){
            String value = city.get(key);
            System.out.println(key+" : "+value);
        }*/
		
		// 전체 도시이름과 도시 코드 받아오는 부분
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		String start_loc = "";
		
		for(String key : city.keySet()){
			String value = city.get(key);
			if( key.contains(dto.getStart_loc()) ) { start_loc = value; }
		}
		
		String goal_loc = "";
		
		for(String key : city.keySet()){
			String value = city.get(key);
			if( key.contains(dto.getGoal_loc()) ) { goal_loc = value; }
		}
		
		// 입력받은게 두루뭉실해서
		// 서울, 부산처럼 내부에 더 많은 역이 있다면 해당 지역의 코드를 xxxx_loc에 저장
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		Map<String, String> city_station_all = new HashMap<String, String>();
		Map<String, String> city_station_start = new HashMap<String, String>();
		Map<String, String> city_station_goal = new HashMap<String, String>();
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		try {
			String[] city_no = {"11", "12", "21", "22", "23", "24" , "25", "26", "31", "32", "33", "34", "35", "36", "37", "38"};

			for(int i=0; i<city_no.length; i++) {
				
				StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList"); /*URL*/
				urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(city_no[i], "UTF-8")); /*시/도ID*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        
		        System.out.println( sb.toString() );
		        String temp_city_no = "";
		        temp_city_no = sb.toString();
				temp_city_no = temp_city_no.replace("</item>", "");
				String[] temp_city = temp_city_no.split("<item>");
				
				for(int z=1; z<temp_city.length; z++) {
					String nodeid = temp_city[z].substring( temp_city[z].indexOf("<nodeid>")+8, temp_city[z].indexOf("</nodeid>") );
					String nodename = temp_city[z].substring( temp_city[z].indexOf("<nodename>")+10, temp_city[z].indexOf("</nodename>") );
					
					if((start_loc.length() <= 1) && ( nodename.contains(dto.getStart_loc()))) { 
						city_station_start.put(nodename, nodeid);
					}
					if((goal_loc.length() <= 1) && ( nodename.contains(dto.getGoal_loc()))) { 
						city_station_goal.put(nodename, nodeid);
					}
				}
			}
		} catch ( Exception e ) {}
		
		// 만약, 상세하게 단일 역 또는 단일 지역을 적었다면 해당 지역의 이름과 코드를 city_station_xxx 에 저장
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		try {
			String[] city_no = {"11", "12", "21", "22", "23", "24" , "25", "26", "31", "32", "33", "34", "35", "36", "37", "38"};

			for(int i=0; i<city_no.length; i++) {
				
				if(!start_loc.equals(city_no[i])) { continue; }
				
				StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList"); /*URL*/
				urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(city_no[i], "UTF-8")); /*시/도ID*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");

		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        
		        String temp_city_no = "";
		        temp_city_no = sb.toString();
				temp_city_no = temp_city_no.replace("</item>", "");
				String[] temp_city = temp_city_no.split("<item>");
				
				for(int z=1; z<temp_city.length; z++) {
					String nodeid = temp_city[z].substring( temp_city[z].indexOf("<nodeid>")+8, temp_city[z].indexOf("</nodeid>") );
					String nodename = temp_city[z].substring( temp_city[z].indexOf("<nodename>")+10, temp_city[z].indexOf("</nodename>") );
					city_station_start.put(nodename, nodeid);
				}
			}
		} catch ( Exception e ) {}
		
		try {
			String[] city_no = {"11", "12", "21", "22", "23", "24" , "25", "26", "31", "32", "33", "34", "35", "36", "37", "38"};

			for(int i=0; i<city_no.length; i++) {
				
				if(!goal_loc.equals(city_no[i])) { continue; }
				
				StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList"); /*URL*/
				urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(city_no[i], "UTF-8")); /*시/도ID*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        
		        String temp_city_no = "";
		        temp_city_no = sb.toString();
				temp_city_no = temp_city_no.replace("</item>", "");
				String[] temp_city = temp_city_no.split("<item>");
				
				for(int z=1; z<temp_city.length; z++) {
					String nodeid = temp_city[z].substring( temp_city[z].indexOf("<nodeid>")+8, temp_city[z].indexOf("</nodeid>") );
					String nodename = temp_city[z].substring( temp_city[z].indexOf("<nodename>")+10, temp_city[z].indexOf("</nodename>") );
					city_station_goal.put(nodename, nodeid);
				}
			}
		} catch ( Exception e ) {}
		
		for(String key : city_station_start.keySet()){
            String value = city_station_start.get(key);
            System.out.println(key+" : "+value);
        }
		System.out.println("= = = = = = = = = = = = = = = = =");
		for(String key : city_station_goal.keySet()){
            String value = city_station_goal.get(key);
            System.out.println(key+" : "+value);
        }
		
		// 만약, 두루뭉실하게 지역명을 적어서 그 아래에 역이 많다면 포함되는 모든 역을 city_station_xxx에 저장
		// 즉, 여기까지면 start와 goal의 모든 코드가 city_station_xxx에 저장됨.

		/////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		String city_station_temp = "";

		List <TransResultTrainDto>list = new ArrayList();
		
		try {
			
			for(String start : city_station_start.keySet()){
				
				for(String goal : city_station_goal.keySet()){
					
					String start_value = city_station_start.get(start);	
					String goal_value = city_station_goal.get(goal);
					
					StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
			        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
			        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode(start_value, "UTF-8")); /*출발기차역ID*/
			        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(goal_value, "UTF-8")); /*도착기차역ID*/
			        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getStart_time(), "UTF-8")); /*출발일*/

			        URL url = new URL(urlBuilder.toString());
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("GET");
			        conn.setRequestProperty("Content-type", "application/json");

			        BufferedReader rd;
			        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        } else {
			            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			        }
			        StringBuilder sb = new StringBuilder();
			        String line;
			        while ((line = rd.readLine()) != null) {
			            sb.append(line);
			        }
			        rd.close();
			        conn.disconnect();
			        
			        String temp_all = sb.toString();
			        temp_all = temp_all.replace("</item>", "");
			        String part[] = sb.toString().split("<item>");
			        
			        for(int i=1; i<part.length; i++) {
						
						TransResultTrainDto Traindto = new TransResultTrainDto();
						
						Traindto.setTraingradename( part[i].substring( part[i].indexOf("<traingradename>")+16, part[i].indexOf("</traingradename>") ) );
						Traindto.setDepplandtime( part[i].substring( part[i].indexOf("<depplandtime>")+14, part[i].indexOf("</depplandtime>") ) );
						Traindto.setArrplandtime( part[i].substring( part[i].indexOf("<arrplandtime>")+14, part[i].indexOf("</arrplandtime>") ) );
						Traindto.setDepplacename( part[i].substring( part[i].indexOf("<depplacename>")+14, part[i].indexOf("</depplacename>") ) );
						Traindto.setArrplacename( part[i].substring( part[i].indexOf("<arrplacename>")+14, part[i].indexOf("</arrplacename>") ) );
						Traindto.setAdultcharge( part[i].substring( part[i].indexOf("<adultcharge>")+13, part[i].indexOf("</adultcharge>") ) );
						Traindto.setTrainno( part[i].substring( part[i].indexOf("<trainno>")+9, part[i].indexOf("</trainno>") ) );

						list.add(Traindto);
					}
				}
			}
			
		} catch( Exception e ) {
			e.printStackTrace();
		}
		
		/////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////
		
		List <TransResultTrainDto>list2 = new ArrayList();
		
		try {
			
			for(String start : city_station_goal.keySet()){
				
				for(String goal : city_station_start.keySet()){
					
					String start_value = city_station_goal.get(start);	
					String goal_value = city_station_start.get(goal);
					
					StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
			        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
			        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode(start_value, "UTF-8")); /*출발기차역ID*/
			        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(goal_value, "UTF-8")); /*도착기차역ID*/
			        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getStart_time(), "UTF-8")); /*출발일*/

			        URL url = new URL(urlBuilder.toString());
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("GET");
			        conn.setRequestProperty("Content-type", "application/json");

			        BufferedReader rd;
			        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        } else {
			            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			        }
			        StringBuilder sb = new StringBuilder();
			        String line;
			        while ((line = rd.readLine()) != null) {
			            sb.append(line);
			        }
			        rd.close();
			        conn.disconnect();
			        
			        String temp_all = sb.toString();
			        temp_all = temp_all.replace("</item>", "");
			        String part[] = sb.toString().split("<item>");
			        
			        for(int i=1; i<part.length; i++) {
						
						TransResultTrainDto Traindto = new TransResultTrainDto();
						
						Traindto.setTraingradename( part[i].substring( part[i].indexOf("<traingradename>")+16, part[i].indexOf("</traingradename>") ) );
						Traindto.setDepplandtime( part[i].substring( part[i].indexOf("<depplandtime>")+14, part[i].indexOf("</depplandtime>") ) );
						Traindto.setArrplandtime( part[i].substring( part[i].indexOf("<arrplandtime>")+14, part[i].indexOf("</arrplandtime>") ) );
						Traindto.setDepplacename( part[i].substring( part[i].indexOf("<depplacename>")+14, part[i].indexOf("</depplacename>") ) );
						Traindto.setArrplacename( part[i].substring( part[i].indexOf("<arrplacename>")+14, part[i].indexOf("</arrplacename>") ) );
						Traindto.setAdultcharge( part[i].substring( part[i].indexOf("<adultcharge>")+13, part[i].indexOf("</adultcharge>") ) );
						Traindto.setTrainno( part[i].substring( part[i].indexOf("<trainno>")+9, part[i].indexOf("</trainno>") ) );

						list2.add(Traindto);
					}
				}
			}
			
		} catch( Exception e ) {
			e.printStackTrace();
		}
		
		Map<String, List> map = new HashMap<String, List>();
		
		System.out.println(list); System.out.println(list2);
		map.put("go", list);
		map.put("back", list2);
		
		return map;
		
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public Map<String, List> search_bus(TransSearchDto dto) {
		
		Map<String, List> map = new HashMap<String, List>();
		List <TransResultBusDto>list = new ArrayList();
		
		try {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/SuburbsBusInfoService/getStrtpntAlocFndSuberbsBusInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +  URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("depTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*출발터미널ID*/
	        urlBuilder.append("&" + URLEncoder.encode("arrTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*도착터미널ID*/
	        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getStart_time(), "UTF-8")); /*출발일*/

	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");

	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        String part[] = sb.toString().split("<item>"); 
	        
	        /////////////////////////////////////////////////////////////////////////////
	        /////////////////////////////////////////////////////////////////////////////
	        
	        StringBuilder urlBuilder2 = new StringBuilder("http://openapi.tago.go.kr/openapi/service/SuburbsBusInfoService/getStrtpntAlocFndSuberbsBusInfo"); /*URL*/
	        urlBuilder2.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +  URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder2.append("&" + URLEncoder.encode("depTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*출발터미널ID*/
	        urlBuilder2.append("&" + URLEncoder.encode("arrTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*도착터미널ID*/
	        urlBuilder2.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getReturn_time(), "UTF-8")); /*출발일*/

	        URL url2 = new URL(urlBuilder2.toString());
	        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
	        conn2.setRequestMethod("GET");
	        conn2.setRequestProperty("Content-type", "application/json");

	        BufferedReader rd2;
	        if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
	            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
	        } else {
	            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
	        }
	        StringBuilder sb2 = new StringBuilder();
	        String line2;
	        while ((line2 = rd2.readLine()) != null) {
	            sb2.append(line2);
	        }
	        rd2.close();
	        conn2.disconnect();
	        
	        String part2[] = sb2.toString().split("<item>"); 
	        
			/////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////        
	        
	        StringBuilder urlBuilder3 = new StringBuilder("http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getStrtpntAlocFndExpbusInfo"); /*URL*/
	        urlBuilder3.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder3.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder3.append("&" + URLEncoder.encode("depTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*출발터미널ID*/
	        urlBuilder3.append("&" + URLEncoder.encode("arrTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*도착터미널ID*/
	        urlBuilder3.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getStart_time(), "UTF-8")); /*출발일*/

	        URL url3 = new URL(urlBuilder3.toString());
	        HttpURLConnection conn3 = (HttpURLConnection) url3.openConnection();
	        conn3.setRequestMethod("GET");
	        conn3.setRequestProperty("Content-type", "application/json");

	        BufferedReader rd3;
	        if(conn3.getResponseCode() >= 200 && conn3.getResponseCode() <= 200) {
	            rd3 = new BufferedReader(new InputStreamReader(conn3.getInputStream()));
	        } else {
	            rd3 = new BufferedReader(new InputStreamReader(conn3.getErrorStream()));
	        }
	        StringBuilder sb3 = new StringBuilder();
	        String line3;
	        while ((line3 = rd3.readLine()) != null) {
	            sb3.append(line3);
	        }
	        rd3.close();
	        conn3.disconnect();
	        
	        String part3[] = sb3.toString().split("<item>"); 
	        
			/////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////
	        
	        StringBuilder urlBuilder4 = new StringBuilder("http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getStrtpntAlocFndExpbusInfo"); /*URL*/
	        urlBuilder4.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +  URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder4.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder4.append("&" + URLEncoder.encode("depTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*출발터미널ID*/
	        urlBuilder4.append("&" + URLEncoder.encode("arrTerminalId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*도착터미널ID*/
	        urlBuilder4.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getReturn_time(), "UTF-8")); /*출발일*/
	        
	        URL url4 = new URL(urlBuilder4.toString());
	        HttpURLConnection conn4 = (HttpURLConnection) url4.openConnection();
	        conn4.setRequestMethod("GET");
	        conn4.setRequestProperty("Content-type", "application/json");

	        BufferedReader rd4;
	        if(conn4.getResponseCode() >= 200 && conn4.getResponseCode() <= 300) {
	            rd4 = new BufferedReader(new InputStreamReader(conn4.getInputStream()));
	        } else {
	            rd4 = new BufferedReader(new InputStreamReader(conn4.getErrorStream()));
	        }
	        StringBuilder sb4 = new StringBuilder();
	        String line4;
	        while ((line4 = rd4.readLine()) != null) {
	            sb4.append(line4);
	        }
	        rd4.close();
	        conn4.disconnect();
	        
	        String part4[] = sb4.toString().split("<item>"); 
	        
			/////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////
	        
			for(int i=1; i<part.length; i++) {
				
				TransResultBusDto Busdto = new TransResultBusDto();
				
				Busdto.setGradeNm( part[i].substring( part[i].indexOf("<gradeNm>")+9, part[i].indexOf("</gradeNm>") ) );
				Busdto.setDepPlandTime( part[i].substring( part[i].indexOf("<depPlandTime>")+14, part[i].indexOf("</depPlandTime>") ) );
				Busdto.setArrPlandTime( part[i].substring( part[i].indexOf("<arrPlandTime>")+14, part[i].indexOf("</arrPlandTime>") ) );
				Busdto.setDepPlaceNm( part[i].substring( part[i].indexOf("<depPlaceNm>")+12, part[i].indexOf("</depPlaceNm>") ) );
				Busdto.setArrPlaceNm( part[i].substring( part[i].indexOf("<arrPlaceNm>")+12, part[i].indexOf("</arrPlaceNm>") ) );
				Busdto.setCharge( part[i].substring( part[i].indexOf("<charge>")+8, part[i].indexOf("</charge>") ) );
				Busdto.setType("시외버스");

				list.add(Busdto);
			}
			for(int i=1; i<part2.length; i++) {
				
				TransResultBusDto Busdto2 = new TransResultBusDto();
				
				Busdto2.setGradeNm( part2[i].substring( part2[i].indexOf("<gradeNm>")+9, part2[i].indexOf("</gradeNm>") ) );
				Busdto2.setDepPlandTime( part2[i].substring( part2[i].indexOf("<depPlandTime>")+14, part2[i].indexOf("</depPlandTime>") ) );
				Busdto2.setArrPlandTime( part2[i].substring( part2[i].indexOf("<arrPlandTime>")+14, part2[i].indexOf("</arrPlandTime>") ) );
				Busdto2.setDepPlaceNm( part2[i].substring( part2[i].indexOf("<depPlaceNm>")+12, part2[i].indexOf("</depPlaceNm>") ) );
				Busdto2.setArrPlaceNm( part2[i].substring( part2[i].indexOf("<arrPlaceNm>")+12, part2[i].indexOf("</arrPlaceNm>") ) );
				Busdto2.setCharge( part2[i].substring( part2[i].indexOf("<charge>")+8, part2[i].indexOf("</charge>") ) );
				Busdto2.setType("시외버스");

				list.add(Busdto2);
			}
			for(int i=1; i<part3.length; i++) {
				
				TransResultBusDto Busdto3 = new TransResultBusDto();
				
				Busdto3.setGradeNm( part3[i].substring( part3[i].indexOf("<gradeNm>")+9, part3[i].indexOf("</gradeNm>") ) );
				Busdto3.setDepPlandTime( part3[i].substring( part3[i].indexOf("<depPlandTime>")+14, part3[i].indexOf("</depPlandTime>") ) );
				Busdto3.setArrPlandTime( part3[i].substring( part3[i].indexOf("<arrPlandTime>")+14, part3[i].indexOf("</arrPlandTime>") ) );
				Busdto3.setDepPlaceNm( part3[i].substring( part3[i].indexOf("<depPlaceNm>")+12, part3[i].indexOf("</depPlaceNm>") ) );
				Busdto3.setArrPlaceNm( part3[i].substring( part3[i].indexOf("<arrPlaceNm>")+12, part3[i].indexOf("</arrPlaceNm>") ) );
				Busdto3.setCharge( part3[i].substring( part3[i].indexOf("<charge>")+8, part3[i].indexOf("</charge>") ) );
				Busdto3.setType("고속버스");

				list.add(Busdto3);
			}
			for(int i=1; i<part4.length; i++) {
				
				TransResultBusDto Busdto4 = new TransResultBusDto();
				
				Busdto4.setGradeNm( part4[i].substring( part4[i].indexOf("<gradeNm>")+9, part4[i].indexOf("</gradeNm>") ) );
				Busdto4.setDepPlandTime( part4[i].substring( part4[i].indexOf("<depPlandTime>")+14, part4[i].indexOf("</depPlandTime>") ) );
				Busdto4.setArrPlandTime( part4[i].substring( part4[i].indexOf("<arrPlandTime>")+14, part4[i].indexOf("</arrPlandTime>") ) );
				Busdto4.setDepPlaceNm( part4[i].substring( part4[i].indexOf("<depPlaceNm>")+12, part4[i].indexOf("</depPlaceNm>") ) );
				Busdto4.setArrPlaceNm( part4[i].substring( part4[i].indexOf("<arrPlaceNm>")+12, part4[i].indexOf("</arrPlaceNm>") ) );
				Busdto4.setCharge( part4[i].substring( part4[i].indexOf("<charge>")+8, part4[i].indexOf("</charge>") ) );
				Busdto4.setType("고속버스");

				list.add(Busdto4);
			}
	        
		} catch( Exception e ) { e.printStackTrace(); }

		return map;
		
	}
}
