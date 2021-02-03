package com.ssafy.carrotmap.mainmap.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.carrotmap.mainmap.service.ExtraInfoService;

@Controller
@RequestMapping("/mainmap/extrainfo")
public class ExtraInfoController {	

//	@Autowired
//	ExtraInfoService extraInfoService;
	
//	map : String dong,String category
	@PostMapping(value ="/select")
	public void select(Model model, Map<String, String> map) {
//		extraInfoService.select(map);
	}
	
}
