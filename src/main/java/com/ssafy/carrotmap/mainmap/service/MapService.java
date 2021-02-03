package com.ssafy.carrotmap.mainmap.service;

import java.util.List;
import java.util.Map;

import com.ssafy.carrotmap.repository.dto.House;

public interface MapService {

	List<House> selectHouseByDong(String dong);

	Map<String,String> selectBaseLocByDong(String dong);

}