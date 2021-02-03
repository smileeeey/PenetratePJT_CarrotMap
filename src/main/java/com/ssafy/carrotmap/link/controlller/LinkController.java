package com.ssafy.carrotmap.link.controlller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LinkController {
	
	@GetMapping("/about")
	public String insert() {		
		return "/about/about";
	}	
}
