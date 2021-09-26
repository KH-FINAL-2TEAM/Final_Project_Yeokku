package com.kh.yeokku.model.biz;

import java.util.List;
import java.util.Map;

import com.kh.yeokku.model.dto.ResultAirDto;
import com.kh.yeokku.model.dto.SearchAirDto;
import com.kh.yeokku.model.dto.TransResultAirDto;
import com.kh.yeokku.model.dto.TransResultBusDto;
import com.kh.yeokku.model.dto.TransResultShipDto;
import com.kh.yeokku.model.dto.TransResultTrainDto;
import com.kh.yeokku.model.dto.TransSearchDto;

public interface TransBiz {

	public Map<String, List> search_air(TransSearchDto dto);
	public Map<String, List> search_ship(TransSearchDto dto);
	public Map<String, List> search_bus(TransSearchDto dto);
	public Map<String, List> search_train(TransSearchDto dto);
}
