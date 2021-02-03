package com.ssafy.carrotmap.repository.mapper;

import com.ssafy.carrotmap.repository.dto.House;
import com.ssafy.carrotmap.repository.dto.HouseFile;

public interface HouseMapper {

	//방 등록
	void regist(House house);


	void insertHouseFile(HouseFile bf);
	
}
