package com.kh.yeokku.model.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.TripplaceBiz;
import com.kh.yeokku.model.dao.TripplaceDao;
import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;

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
	public TourResultDto searchResultDetail(String contentid) {
		return dao.searchResultDetail(contentid);
	}

	@Override
	public List<TourResultDto> searchClosePlace(String type, String mapx, String mapy) {
		return dao.searchClosePlace(type, mapx, mapy);
	}

}
