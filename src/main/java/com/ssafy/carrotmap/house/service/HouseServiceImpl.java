package com.ssafy.carrotmap.house.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.carrotmap.repository.dto.House;
import com.ssafy.carrotmap.repository.dto.HouseFile;
import com.ssafy.carrotmap.repository.mapper.HouseMapper;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	HouseMapper houseMapper;

	@Override
	public void regist(House house) {
		houseMapper.regist(house);
	}

	@Override
	public void fileupload(List<MultipartFile> files,House house) throws Exception {

		for (MultipartFile file : files) {
			System.out.println("파일 이름 : " + file);
		}

		for (MultipartFile mf : files) {
			if (mf.isEmpty())
				continue;
			
			System.out.println(mf);
			
			String orgName=mf.getOriginalFilename();
			String ext="";
			int index=orgName.lastIndexOf(".");
			if(index!=-1) {
				ext=orgName.substring(index);
			}
			
			//저장할 이름
			String systemName= UUID.randomUUID().toString()+ext;
			
			//저장될 경로
			String pathRoot="C://SSAFY/upload";
			String modulePath="/board"+new SimpleDateFormat("/yyyy/MM/dd").format(new Date());
			File pFile=new File(pathRoot+modulePath);
			//폴더 있는지 확인하고 폴더 생성
			if(pFile.exists()==false) {
				pFile.mkdirs();
			}
			
			
			//서버에 파일 생성하기 
			//pfile의 설정된 경로를 준다 
			mf.transferTo(new File(pFile,systemName));
			
			System.out.println("NO : "+house.getNo());
			HouseFile bf= new HouseFile();
			
			bf.setFilePath(modulePath);
			bf.setFileSize((int)mf.getSize());
			bf.setFileType(mf.getContentType());
			bf.setOrgFileName(orgName);
			bf.setSystemName(systemName);
			
			houseMapper.insertHouseFile(bf);		
			
		}

	}

}
