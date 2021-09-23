package com.kh.yeokku.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.kh.yeokku.model.biz.TestBiz;
import com.kh.yeokku.model.dto.testDto;

@Controller
public class TestController {

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	private TestBiz biz;
	
	@RequestMapping(value="/couse_tour_list.do")
	public String CourseTourList(Model model) throws IOException {
		System.out.println("리스트");
		return "Course/CourseMaking";
	}
	
	@RequestMapping(value="/tour_search_list.do",method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public String tourSearchList(HttpServletResponse response, String select, String keyword) throws IOException {
		
		System.out.println(select+keyword);
		String gson = "";
		JsonArray json_item = biz.tourSearchList(select, keyword);
		if(json_item != null) {
			gson = new Gson().toJson(json_item);			
		}
		return gson;
	}
	/*
	@RequestMapping("/tripplace_result_form.do")
	public String tourSearch(Model model,String contentTypeId, String areaCode, String sigunguCode) {
		
		
		System.out.println("dd");
		return "tripplace/tripplace_search_result";
	}*/
}
