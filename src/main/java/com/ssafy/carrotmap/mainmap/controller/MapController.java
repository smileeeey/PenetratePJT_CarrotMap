package com.ssafy.carrotmap.mainmap.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ssafy.carrotmap.mainmap.service.MapService;
import com.ssafy.carrotmap.repository.dto.House;

@Controller
@RequestMapping("/mainmap")
public class MapController {

	@Autowired
	MapService mapService;

	@GetMapping("/map")
	public void mapPage(Model model) {
		// 기본적으로 넘겨줘야할 정보들 줘야함!

	}
	
	@GetMapping("/mapchart")
	public void mapchartPage(Model model) {
		// 기본적으로 넘겨줘야할 정보들 줘야함!

	}
	
	private String getInfo(String dong) {
		JSONObject result = new JSONObject();
		System.out.println("00");
		JSONArray arr = new JSONArray();
		List<House> house = mapService.selectHouseByDong(dong);
		System.out.println(house);
		System.out.println("1");
		for (int i = 0; i < house.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("dealAmount", house.get(i).getDealAmount());
			obj.put("floor", house.get(i).getFloor());
			obj.put("area", house.get(i).getArea());
			obj.put("dong", house.get(i).getDong());
			obj.put("buildYear", house.get(i).getBuildYear());
			StringBuilder address = new StringBuilder();
			address.append(house.get(i).getDong());
			address.append(house.get(i).getJibun());
			obj.put("address", address.toString());
			obj.put("AptName", house.get(i).getAptName());
			arr.add(obj);
		}
		result.put("house", arr);
		
		Map<String,String> loc = mapService.selectBaseLocByDong(dong);
		JSONObject obj = new JSONObject();
		obj.put("lng", loc.get("lng"));
		obj.put("lat", loc.get("lat"));
		result.put("loc", obj);
		
		String houselist = result.toJSONString();
		
		return houselist;
	}
	
	
	@GetMapping(value="/house", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectHouseList(String dong) {
		String houselist = getInfo(dong);
		System.out.println("houselist:"+houselist);
		return houselist;
	}

	@GetMapping(value="/map", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String BaseMapLoc(String dong) {
		Gson gson = new Gson();

		String loc = gson.toJson(mapService.selectBaseLocByDong(dong));
		System.out.println("위도경도이다!! "+loc);
		return loc;
	}
}
