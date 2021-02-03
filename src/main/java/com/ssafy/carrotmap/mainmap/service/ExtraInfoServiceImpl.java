package com.ssafy.carrotmap.mainmap.service;

import java.util.Arrays;
import java.util.Map;


public class ExtraInfoServiceImpl implements ExtraInfoService {

	@Override
	public void select(Map<String, String> map) {
		String category =map.get("category"); 
		String dong=map.get("dong");
		
		/**
		 *food : 음식점 
		 *cafe : 카페
		 *mart : 마트
		 *parking : 주차장
		 *gasStation : 주유소/충전소
		 *hotel : 호텔/콘도
		 *motel : 모텔
		 *pharmacy : 약국
		 *hairShop : 미용실
		 */
		String TempCommercial[]={"food","cafe","mart","parking","gasStation","hotel","motel","pharmacy","hairShop"};
		
		
		if(Arrays.asList(TempCommercial).contains(category)) {
			//
		}else if(category.equals("coronaHospital")) {
			//
		}else if(category.equals("hospital")) {
			//
		}
		
	}

}
