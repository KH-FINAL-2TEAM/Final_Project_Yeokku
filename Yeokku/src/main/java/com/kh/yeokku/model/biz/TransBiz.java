package com.kh.yeokku.model.biz;

import java.util.List;

import com.kh.yeokku.model.dto.ResultAirDto;
import com.kh.yeokku.model.dto.SearchAirDto;
import com.kh.yeokku.model.dto.TransResultAirDto;
import com.kh.yeokku.model.dto.TransResultBusDto;
import com.kh.yeokku.model.dto.TransResultShipDto;
import com.kh.yeokku.model.dto.TransResultTrainDto;
import com.kh.yeokku.model.dto.TransSearchDto;

public interface TransBiz {

	public List<TransResultAirDto> search_air(TransSearchDto dto);
	public List<TransResultShipDto> search_ship(TransSearchDto dto);
	public List<TransResultBusDto> search_bus(TransSearchDto dto);
	public List<TransResultTrainDto> search_train(TransSearchDto dto);
}
