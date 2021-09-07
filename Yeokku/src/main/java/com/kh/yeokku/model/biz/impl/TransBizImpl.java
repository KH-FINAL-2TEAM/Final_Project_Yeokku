package com.kh.yeokku.model.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yeokku.model.biz.TransBiz;
import com.kh.yeokku.model.dao.TransDao;
import com.kh.yeokku.model.dto.ResultAirDto;
import com.kh.yeokku.model.dto.SearchAirDto;
import com.kh.yeokku.model.dto.TransResultAirDto;
import com.kh.yeokku.model.dto.TransResultBusDto;
import com.kh.yeokku.model.dto.TransResultShipDto;
import com.kh.yeokku.model.dto.TransResultTrainDto;
import com.kh.yeokku.model.dto.TransSearchDto;


@Service
public class TransBizImpl implements TransBiz {
	
	@Autowired
	private TransDao dao;

	@Override
	public List<TransResultAirDto> search_air(TransSearchDto dto) {
		return dao.search_air(dto);	
	}

	@Override
	public List<TransResultShipDto> search_ship(TransSearchDto dto) {
		return dao.search_ship(dto);	
	}

	@Override
	public List<TransResultBusDto> search_bus(TransSearchDto dto) {
		return dao.search_bus(dto);	
	}

	@Override
	public List<TransResultTrainDto> search_train(TransSearchDto dto) {
		return dao.search_train(dto);	
	}

}
