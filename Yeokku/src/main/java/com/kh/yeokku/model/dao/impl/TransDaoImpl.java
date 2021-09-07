package com.kh.yeokku.model.dao.impl;

import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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
import java.io.IOException;

@Repository
public class TransDaoImpl implements TransDao {
	
	String key = "kwDkY16Hb17nzd1oXj1gPDW3w59pp3McZn3hO4ut1mg%2F8HCFskd%2FEqjPgKtYBvkqPIUnPPEgfUudq2lnyFNyvg%3D%3D";

	@Override
	public List<TransResultAirDto> search_air(TransSearchDto dto) {
		
		List <TransResultAirDto>list = new ArrayList();
		
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
				
				airdto.setVihicleId( part[i].substring( part[i].indexOf("<vihicleId>")+11, part[i].indexOf("</vihicleId>") ) );
				airdto.setAirlineNm( part[i].substring( part[i].indexOf("<airlineNm>")+11, part[i].indexOf("</airlineNm>") ) );
				airdto.setDepPlandTime( part[i].substring( part[i].indexOf("<depPlandTime>")+14, part[i].indexOf("</depPlandTime>") ) );
				airdto.setArrPlandTime( part[i].substring( part[i].indexOf("<arrPlandTime>")+14, part[i].indexOf("</arrPlandTime>") ) );
				airdto.setEconomyCharge( part[i].substring( part[i].indexOf("<economyCharge>")+15, part[i].indexOf("</economyCharge>") ) );
				airdto.setPrestigeCharge( part[i].substring( part[i].indexOf("<prestigeCharge>")+16, part[i].indexOf("</prestigeCharge>") ) );
				airdto.setDepAirportNm( part[i].substring( part[i].indexOf("<depAirportNm>")+14, part[i].indexOf("</depAirportNm>") ) );
				airdto.setArrAirportNm( part[i].substring( part[i].indexOf("<arrAirportNm>")+14, part[i].indexOf("</arrAirportNm>") ) );

				list.add(airdto);
			}
			
			for(int i=1; i<part2.length; i++) {
				TransResultAirDto airdto2 = new TransResultAirDto();
			
				airdto2.setVihicleId( part2[i].substring( part2[i].indexOf("<vihicleId>")+11, part2[i].indexOf("</vihicleId>") ) );
				airdto2.setAirlineNm( part2[i].substring( part2[i].indexOf("<airlineNm>")+11, part2[i].indexOf("</airlineNm>") ) );
				airdto2.setDepPlandTime( part2[i].substring( part2[i].indexOf("<depPlandTime>")+14, part2[i].indexOf("</depPlandTime>") ) );
				airdto2.setArrPlandTime( part2[i].substring( part2[i].indexOf("<arrPlandTime>")+14, part2[i].indexOf("</arrPlandTime>") ) );
				airdto2.setEconomyCharge( part2[i].substring( part2[i].indexOf("<economyCharge>")+15, part2[i].indexOf("</economyCharge>") ) );
				airdto2.setPrestigeCharge( part2[i].substring( part2[i].indexOf("<prestigeCharge>")+16, part2[i].indexOf("</prestigeCharge>") ) );
				airdto2.setDepAirportNm( part2[i].substring( part2[i].indexOf("<depAirportNm>")+14, part2[i].indexOf("</depAirportNm>") ) );
				airdto2.setArrAirportNm( part2[i].substring( part2[i].indexOf("<arrAirportNm>")+14, part2[i].indexOf("</arrAirportNm>") ) );

				list.add(airdto2);
			}
	    	
		} catch( Exception e ) { e.printStackTrace(); }

		return list;
	}
	
	@Override
	public List<TransResultShipDto> search_ship(TransSearchDto dto) {
		
		List <TransResultShipDto>list = new ArrayList();
		
		try {		
			StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcShipNvgInfoService/getShipOpratInfoList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getStart_time(), "UTF-8")); /*출발일*/
	        urlBuilder.append("&" + URLEncoder.encode("depNodeId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*출발지ID*/

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
	        
	        if(sb.toString().length() < 1) { return list; }
	        
	        String part[] = sb.toString().split("<item>"); 
	        
	        /////////////////////////////////////////////////////////////////////////////
	        /////////////////////////////////////////////////////////////////////////////
	        
	        StringBuilder urlBuilder2 = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcShipNvgInfoService/getShipOpratInfoList"); /*URL*/
	        urlBuilder2.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder2.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(dto.getReturn_time(), "UTF-8")); /*출발일*/
	        urlBuilder2.append("&" + URLEncoder.encode("depNodeId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*출발지ID*/

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
				
				TransResultShipDto Shipdto = new TransResultShipDto();
				
				Shipdto.setVihicleNm( part[i].substring( part[i].indexOf("<vihicleNm>")+11, part[i].indexOf("</vihicleNm>") ) );
				Shipdto.setDepPlandTime( part[i].substring( part[i].indexOf("<depPlandTime>")+14, part[i].indexOf("</depPlandTime>") ) );
				Shipdto.setArrPlandTime( part[i].substring( part[i].indexOf("<arrPlandTime>")+14, part[i].indexOf("</arrPlandTime>") ) );
				Shipdto.setDepPlandTime( part[i].substring( part[i].indexOf("<depPlandTime>")+14, part[i].indexOf("</depPlandTime>") ) );
				Shipdto.setArrPlandTime( part[i].substring( part[i].indexOf("<arrPlandTime>")+14, part[i].indexOf("</arrPlandTime>") ) );
				Shipdto.setCharge( part[i].substring( part[i].indexOf("<charge>")+8, part[i].indexOf("</charge>") ) );

				list.add(Shipdto);
			}
			for(int i=1; i<part2.length; i++) {
				
				TransResultShipDto Shipdto2 = new TransResultShipDto();
				
				Shipdto2.setVihicleNm( part2[i].substring( part2[i].indexOf("<vihicleNm>")+11, part2[i].indexOf("</vihicleNm>") ) );
				Shipdto2.setDepPlandTime( part2[i].substring( part2[i].indexOf("<depPlandTime>")+14, part2[i].indexOf("</depPlandTime>") ) );
				Shipdto2.setArrPlandTime( part2[i].substring( part2[i].indexOf("<arrPlandTime>")+14, part2[i].indexOf("</arrPlandTime>") ) );
				Shipdto2.setDepPlandTime( part2[i].substring( part2[i].indexOf("<depPlandTime>")+14, part2[i].indexOf("</depPlandTime>") ) );
				Shipdto2.setArrPlandTime( part2[i].substring( part2[i].indexOf("<arrPlandTime>")+14, part2[i].indexOf("</arrPlandTime>") ) );
				Shipdto2.setCharge( part2[i].substring( part2[i].indexOf("<charge>")+8, part2[i].indexOf("</charge>") ) );

				list.add(Shipdto2);
			}
			
		} catch( Exception e ) { e.printStackTrace(); }

		return list;	
	}
	
	@Override
	public List<TransResultTrainDto> search_train(TransSearchDto dto) {
		
		List <TransResultTrainDto>list = new ArrayList();
		
		try {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*출발기차역ID*/
	        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*도착기차역ID*/
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
	        
	        StringBuilder urlBuilder2 = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
	        urlBuilder2.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(key,"UTF-8")); /*Service Key*/
	        urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder2.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode(dto.getGoal_loc(), "UTF-8")); /*출발기차역ID*/
	        urlBuilder2.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(dto.getStart_loc(), "UTF-8")); /*도착기차역ID*/
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
			
			for(int i=1; i<part2.length; i++) {
				
				TransResultTrainDto Train2dto = new TransResultTrainDto();
				
				Train2dto.setTraingradename( part2[i].substring( part2[i].indexOf("<train2gradename>")+16, part2[i].indexOf("</train2gradename>") ) );
				Train2dto.setDepplandtime( part2[i].substring( part2[i].indexOf("<depplandtime>")+14, part2[i].indexOf("</depplandtime>") ) );
				Train2dto.setArrplandtime( part2[i].substring( part2[i].indexOf("<arrplandtime>")+14, part2[i].indexOf("</arrplandtime>") ) );
				Train2dto.setDepplacename( part2[i].substring( part2[i].indexOf("<depplacename>")+14, part2[i].indexOf("</depplacename>") ) );
				Train2dto.setArrplacename( part2[i].substring( part2[i].indexOf("<arrplacename>")+14, part2[i].indexOf("</arrplacename>") ) );
				Train2dto.setAdultcharge( part2[i].substring( part2[i].indexOf("<adultcharge>")+13, part2[i].indexOf("</adultcharge>") ) );
				Train2dto.setTrainno( part2[i].substring( part2[i].indexOf("<trainno>")+9, part2[i].indexOf("</trainno>") ) );

				list.add(Train2dto);
						
			}
	    	
		} catch( Exception e ) { e.printStackTrace(); }

		return list;
		
	}
	
	@Override
	public List<TransResultBusDto> search_bus(TransSearchDto dto) {
		
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

		return list;
		
	}
}
