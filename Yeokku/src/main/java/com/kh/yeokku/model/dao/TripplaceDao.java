package com.kh.yeokku.model.dao;

import java.util.List;

import com.kh.yeokku.model.dto.TourDto;
import com.kh.yeokku.model.dto.TourResultDto;

public interface TripplaceDao {
	public List<TourResultDto> tripplaceMain();
	public List<TourResultDto> searchResult(TourDto dto, String arrange);
	public TourResultDto searchResultDetail(String contentid);
	public List<TourResultDto> searchClosePlace(String type, String mapx, String mapy);

}
