package com.kh.yeokku.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripPlaceController {
	
	@RequestMapping("/tripplace_search_form.do")
	public String tripPlaceSearchResult(Model model) {
		
		return "tripplace/tripplace_search";
	}

	@RequestMapping("/tripplace_search_result_form.do")
	public String tripPlaceSearch(Model model) {
		return "tripplace/tripplace_search_result";
	}
	
	@RequestMapping("/tripplace_show_map_form.do")
	public String tripPlaceShowMap(Model model) {
		return "tripplace/tripplace_show_map";
	}
	
	@RequestMapping("/tripplace_show_detail_form.do")
	public String tripPlaceShowDetailForm(Model model) {
		return "tripplace/tripplace_show_detail";
	}
}
