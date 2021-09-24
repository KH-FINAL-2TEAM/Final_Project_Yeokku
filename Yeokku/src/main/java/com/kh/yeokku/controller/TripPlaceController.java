package com.kh.yeokku.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yeokku.model.biz.TripplaceBiz;
import com.kh.yeokku.model.dto.LikeTourDto;
import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;
import com.kh.yeokku.model.dto.TourReviewDto;

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
		List<TourResultDto> list = biz.searchResult(dto, arrange);
		model.addAttribute("list", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println("\n"+i+"번째 title: "+list.get(i).getTitle()+", addr1: "+list.get(i).getAddr1()+", contentid: "+list.get(i).getContentid()+", mapx: "+list.get(i).getMapx()+", mapy: "+list.get(i).getMapy());
		}
		return "tripplace/tripplace_show_map";
	}
	
	@ResponseBody
	@RequestMapping(value="/tripplace_marker_click.do", method=RequestMethod.POST)
	public Map<String, String> tripPlaceMarkerClick(Model model, TourResultDto dto){
		
		TourResultDto res = biz.searchResultDetail(dto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("title",res.getTitle());
		map.put("firstimage",res.getFirstimage());
		map.put("overview",res.getOverview());
		map.put("contentid",res.getContentid());
		
		return map;
	}
	
	@RequestMapping("/tripplace_detail_form.do")
	public String tripPlaceShowDetailForm(Model model, TourResultDto dto, String userno) {
		model.addAttribute("blog", biz.tripplaceNaverBlog(dto));
		model.addAttribute("likeUser", biz.tripplaceLikeUser(dto, userno));
		model.addAttribute("likeCount", biz.tripplaceLikeCount(dto));
		model.addAttribute("reviewCount",biz.tripplaceReviewCount(dto));
		model.addAttribute("dto", biz.searchResultDetail(dto));
		model.addAttribute("review",biz.tripplaceReviewList(dto));
		return "tripplace/tripplace_show_detail";
	}
	
	@RequestMapping("/tripplace_close_place.do")
	public String closePlace(Model model, String type, String mapx, String mapy) {
		
		model.addAttribute("list", biz.searchClosePlace(type, mapx, mapy));
		
		return "tripplace/tripplace_search_result";
	}
	
	@RequestMapping("/tripplace_review_form.do")
	public String tripplaceReview(TourReviewDto dto, String title, Model model) {
		
		int res = biz.tripplaceReviewWrite(dto);
		
		if(res>0) {
			model.addAttribute("msg", "리뷰 작성에 성공했습니다.");
			model.addAttribute("url", "tripplace_detail_form.do");
			model.addAttribute("contentid", dto.getTr_contentid());
			model.addAttribute("title", title);
			return "tripplace/tripplace_review_alert";
		} else {
			model.addAttribute("msg", "리뷰 작성에 실패했습니다.");
			model.addAttribute("url", "tripplace_detail_form.do");
			model.addAttribute("contentid", dto.getTr_contentid());
			model.addAttribute("title", title);
			return "tripplace/tripplace_review_alert";
		}
	}
	
	@RequestMapping("/tripplace_review_update.do")
	public String tripplaceReviewUpdate(TourReviewDto dto, String title, Model model) {
		int res = biz.tripplaceReviewUpdate(dto);
		
		if(res>0) {
			model.addAttribute("msg", "리뷰 수정에 성공했습니다.");
			model.addAttribute("url", "tripplace_detail_form.do");
			model.addAttribute("contentid", dto.getTr_contentid());
			model.addAttribute("title", title);
			return "tripplace/tripplace_review_alert";
		} else {
			model.addAttribute("msg", "리뷰 수정에 실패했습니다.");
			model.addAttribute("url", "tripplace_detail_form.do");
			model.addAttribute("contentid", dto.getTr_contentid());
			model.addAttribute("title", title);
			return "tripplace/tripplace_review_alert";
		}
	}
	
	@RequestMapping("/tripplace_review_delete.do")
	public String tripplaceReviewDelete(TourReviewDto dto,String title, Model model) {
		int res = biz.tripplaceReviewDelete(dto);
		
		if(res>0) {
			model.addAttribute("msg", "리뷰 삭제에 성공했습니다.");
			model.addAttribute("url", "tripplace_detail_form.do");
			model.addAttribute("contentid", dto.getTr_contentid());
			model.addAttribute("title", title);
			return "tripplace/tripplace_review_alert";
		} else {
			model.addAttribute("msg", "리뷰 삭제에 실패했습니다.");
			model.addAttribute("url", "tripplace_detail_form.do");
			model.addAttribute("contentid", dto.getTr_contentid());
			model.addAttribute("title", title);
			return "tripplace/tripplace_review_alert";
		}
	}
	
	@ResponseBody
	@RequestMapping("/tripplace_like.do")
	public Map<String,String> tripplaceLike(@RequestBody LikeTourDto dto, Model model) {
		Map<String,String> map= new HashMap<String,String>();
		TourResultDto tr = new TourResultDto();
		
		int res = biz.tripplaceLike(dto);
		if(res>0) {
			String contentid = String.valueOf(dto.getLt_contentid());
			tr.setContentid(contentid);
			map.put("likeCount", String.valueOf(biz.tripplaceLikeCount(tr)));
			map.put("msg1", "<a href=\"#\" onclick=\"return likeInfo();\" style=\"cursor:hand;\" class=\"like-info\" id=\"iconB\"><i class=\"fas fa-heart fa-lg\"></i></a>");
		}else {
			map.put("msg2","좋아요에 실패했습니다.");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/tripplace_like_cancel.do")
	public Map<String,String> tripplaceLikeCancel(@RequestBody LikeTourDto dto, Model model) {
		
		int res = biz.tripplaceLikeCancel(dto);
		
		Map<String,String> map= new HashMap<String,String>();
		TourResultDto tr = new TourResultDto();
		if(res>0) {
			String contentid = String.valueOf(dto.getLt_contentid());
			tr.setContentid(contentid);
			map.put("likeCount", String.valueOf(biz.tripplaceLikeCount(tr)));
			map.put("msg1", "<a href=\"#\" onclick=\"return likeInfo();\" style=\"cursor:hand;\" class=\"like-info\" id=\"iconA\"><i class=\"far fa-heart fa-lg\"></i></a>");
		}else {
			map.put("msg2","좋아요 취소에 실패했습니다.");
		}
		
		return map;
	}
}
