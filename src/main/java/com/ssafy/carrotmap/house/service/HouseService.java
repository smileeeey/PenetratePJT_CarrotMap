package com.ssafy.carrotmap.house.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ssafy.carrotmap.repository.dto.House;

public interface HouseService {

	void regist(House house);

	void fileupload(List<MultipartFile> files,House house) throws Exception;

}