package com.kh.yeokku.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yeokku.model.biz.TransBiz;
import com.kh.yeokku.model.dto.ResultAirDto;
import com.kh.yeokku.model.dto.SearchAirDto;
import com.kh.yeokku.model.dto.TransSearchDto;
import com.kh.yeokku.model.dto.TransResultAirDto;
import com.kh.yeokku.model.dto.TransResultShipDto;
import com.kh.yeokku.model.dto.TransResultBusDto;
import com.kh.yeokku.model.dto.TransResultTrainDto;

@Controller
public class TransController {

	@Autowired
	private TransBiz biz;
	
	@RequestMapping(value="/air_search.do", method=RequestMethod.POST)
	@ResponseBody
	public <TransResultAirDto>List search_air(TransSearchDto dto) {
		
		return biz.search_air(dto);
	}
	
	@RequestMapping(value="/ship_search.do", method=RequestMethod.POST)
	@ResponseBody
	public <TransResultShipDto>List search_ship(TransSearchDto dto) {
		
		return biz.search_ship(dto);
	}
	
	@RequestMapping(value="/train_search.do", method=RequestMethod.POST)
	@ResponseBody
	public <TransResultTrainDto>List search_train(TransSearchDto dto) {
		
		return biz.search_train(dto);	
	}
	
	@RequestMapping(value="/bus_search.do", method=RequestMethod.POST)
	@ResponseBody
	public <TransResultBusDto>List search_bus(TransSearchDto dto) {
		
		return biz.search_bus(dto);
	}
}









// api 승인 나면, 공항코드같은거 미리 다 받아서 db에 저장하고 각 들어온  dto를 요쳥변수에 맞게 변환해주는 작업이 필요함
// 이건 해도 그만 안해도 그만인데 Trans.jsp에서 입력 받을때 지금은 그냥 text 인데 select로 해주는게 좋을것 같음
// 이 2가지 하면 교통은 끝
