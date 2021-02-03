package com.ssafy.carrotmap.mainmap.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.carrotmap.repository.dto.House;
import com.ssafy.carrotmap.repository.mapper.MapMapper;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	MapMapper mapMapper;
	
	@Override
	public List<House> selectHouseByDong(String dong) {
		return mapMapper.selectHouseByDong(dong);
	}

	@Override
	public Map<String, String> selectBaseLocByDong(String dong) {
		return mapMapper.selectBaseLocByDong(dong);
	}

}
