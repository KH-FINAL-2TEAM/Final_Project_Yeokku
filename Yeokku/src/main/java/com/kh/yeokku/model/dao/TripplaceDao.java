package com.kh.yeokku.model.dao;

import java.util.List;

import com.kh.yeokku.model.dto.LikeTourDto;
import com.kh.yeokku.model.dto.NaverBlogDto;
import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;
import com.kh.yeokku.model.dto.TourReviewDto;

public interface TripplaceDao {
	String NAMESPACE="tourreview.";
	String NAMESPACE2 ="liketour.";
	
	public List<TourResultDto> tripplaceMain();
	public List<TourResultDto> searchResult(TourDto dto, String arrange);
	public TourResultDto searchResultDetail(TourResultDto dto);
	public List<TourResultDto> searchClosePlace(String type, String mapx, String mapy);
	public List<TourReviewDto> tripplaceReviewList(TourResultDto dto);
	public int tripplaceReviewCount(TourResultDto dto);
	public int tripplaceReviewWrite(TourReviewDto dto);
	public int tripplaceReviewUpdate(TourReviewDto dto);
	public int tripplaceReviewDelete(TourReviewDto dto);
	public LikeTourDto tripplaceLikeUser(TourResultDto dto, String userno);
	public int tripplaceLikeCount(TourResultDto dto);
	public int tripplaceLike(LikeTourDto dto);
	public int tripplaceLikeCancel(LikeTourDto dto);
	public List<NaverBlogDto> tripplaceNaverBlog(TourResultDto dto);
}
