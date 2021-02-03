package com.ssafy.carrotmap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = {"/","/main"}, method = RequestMethod.GET)
	public String home() {
		System.out.println("HomeController");
		return "index";
	}
	
	@RequestMapping(value = "main/board/notice/list", method = RequestMethod.GET)
	public String noticeboardlist() {
		System.out.println("HomeController list");
		return "board/notice/noticeboard";
	}
	
	@RequestMapping(value = "main/board/notice/detail", method = RequestMethod.GET)
	public String noticeboardlistdetail() {
		System.out.println("HomeController detail");
		return "board/notice/noticeboarddetail";
	}
	
}