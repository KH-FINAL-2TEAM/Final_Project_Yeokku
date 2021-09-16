package com.kh.yeokku.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yeokku.model.biz.TripplaceBiz;
import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;

@Controller
public class TripPlaceController {
	@Autowired
	private TripplaceBiz biz;
	
	@RequestMapping("/tripplace_search_form.do")
	public String tripPlaceSearchResult(Model model) {
		
		model.addAttribute("list",biz.tripplaceMain());
		
		return "tripplace/tripplace_search";
	}

	@RequestMapping("/tripplace_result_form.do")
	public String tripPlaceSearch(Model model, TourDto dto, String arrange) {
		
		model.addAttribute("list", biz.searchResult(dto,arrange));
		model.addAttribute("dto", dto);
		
		return "tripplace/tripplace_search_result";
	}
	
	@RequestMapping("/tripplace_map_form.do")
	public String tripPlaceShowMap(Model model, TourDto dto, String arrange) {
		
		model.addAttribute("list", biz.searchResult(dto, arrange));
		
		return "tripplace/tripplace_show_map";
	}
	
	@ResponseBody
	@RequestMapping(value="/tripplace_marker_click.do", method=RequestMethod.POST)
	public Map<String, String> tripPlaceMarkerClick(Model model, String contentid, HttpSession session){
		
		TourResultDto dto = biz.searchResultDetail(contentid);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("title",dto.getTitle());
		map.put("firstimage",dto.getFirstimage());
		map.put("overview",dto.getOverview());
		map.put("contentid",contentid);
		
		return map;
	}
	
	@RequestMapping("/tripplace_detail_form.do")
	public String tripPlaceShowDetailForm(Model model, String contentid) {

		model.addAttribute("dto", biz.searchResultDetail(contentid));
		
		return "tripplace/tripplace_show_detail";
	}
	
	@RequestMapping("/tripplace_close_place.do")
	public String closePlace(Model model, String type, String mapx, String mapy) {
		
		model.addAttribute("list", biz.searchClosePlace(type, mapx, mapy));
		
		return "tripplace/tripplace_search_result";
	}
	
	
}
