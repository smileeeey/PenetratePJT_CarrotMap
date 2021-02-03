package com.ssafy.carrotmap.repository.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.carrotmap.repository.dto.House;

public interface MapMapper {
	List<House> selectHouseByDong(String dong);

	Map<String, String> selectBaseLocByDong(String dong);
}
