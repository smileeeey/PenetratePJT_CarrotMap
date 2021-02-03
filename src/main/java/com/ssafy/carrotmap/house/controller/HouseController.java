package com.ssafy.carrotmap.house.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.carrotmap.house.service.HouseService;
import com.ssafy.carrotmap.repository.dto.House;

@Controller
@RequestMapping("/house")
public class HouseController {

	@Autowired
	HouseService houseService;

	@GetMapping("/houseform")
	public void form() {
	}

	@PostMapping("/regist")
	public String regist(House house, Model model,@RequestParam("file") List<MultipartFile>  files) {


		String date[] = house.getBuildYear().split("-");
		house.setBuildYear(date[0]);

		System.out.println("house/regist : " + house);
		try {
			houseService.regist(house);
			model.addAttribute("houseinfo", house);
			model.addAttribute("msg", "방 정보 등록 성공!");

		} catch (Exception e) {
			model.addAttribute("msg", "방 정보 등록 실패!");
		}

		try {
			houseService.fileupload(files,house);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return "house/houseform";

	}

}
