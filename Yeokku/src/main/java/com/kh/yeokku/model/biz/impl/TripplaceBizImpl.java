package com.kh.yeokku.model.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.TripplaceBiz;
import com.kh.yeokku.model.dao.TripplaceDao;
import com.kh.yeokku.model.dto.LikeTourDto;
import com.kh.yeokku.model.dto.NaverBlogDto;
import com.kh.yeokku.model.dto.TourCatDto;
import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;
import com.kh.yeokku.model.dto.TourReviewDto;

@Service
public class TripplaceBizImpl implements TripplaceBiz{
	@Autowired
	TripplaceDao dao;

	@Override
	public List<TourResultDto> tripplaceMain() {
		return dao.tripplaceMain();
	}

	@Override
	public List<TourResultDto> searchResult(TourDto dto, String arrange) {
		return dao.searchResult(dto, arrange);
	}

	@Override
	public TourResultDto searchResultDetail(TourResultDto dto) {
		return dao.searchResultDetail(dto);
	}

	@Override
	public List<TourResultDto> searchClosePlace(String type, String mapx, String mapy) {
		return dao.searchClosePlace(type, mapx, mapy);
	}

	@Override
	public List<TourReviewDto> tripplaceReviewList(TourResultDto dto) {
		return dao.tripplaceReviewList(dto);
	}

	@Override
	public int tripplaceReviewCount(TourResultDto dto) {
		return dao.tripplaceReviewCount(dto);
	}

	@Override
	public int tripplaceReviewWrite(TourReviewDto dto) {
		return dao.tripplaceReviewWrite(dto);
	}

	@Override
	public int tripplaceReviewUpdate(TourReviewDto dto) {
		return dao.tripplaceReviewUpdate(dto);
	}
	
	@Override
	public int tripplaceReviewDelete(TourReviewDto dto) {
		return dao.tripplaceReviewDelete(dto);
	}

	@Override
	public LikeTourDto tripplaceLikeUser(TourResultDto dto, String userno) {
		return dao.tripplaceLikeUser(dto, userno);
	}
	
	@Override
	public int tripplaceLikeCount(TourResultDto dto) {
		return dao.tripplaceLikeCount(dto);
	}
	
	@Override
	public int tripplaceLike(LikeTourDto dto) {
		return dao.tripplaceLike(dto);
	}

	@Override
	public int tripplaceLikeCancel(LikeTourDto dto) {
		return dao.tripplaceLikeCancel(dto);
	}

	@Override
	public List<NaverBlogDto> tripplaceNaverBlog(TourResultDto dto) {
		return dao.tripplaceNaverBlog(dto);
	}

	@Override
	public TourCatDto tripplaceCat(TourResultDto dto) {
		return dao.tripplaceCat(dto);
	}

}
