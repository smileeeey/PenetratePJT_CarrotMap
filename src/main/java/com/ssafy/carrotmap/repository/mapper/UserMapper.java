package com.ssafy.carrotmap.repository.mapper;

import java.util.Map;

import com.ssafy.carrotmap.repository.dto.User;

public interface UserMapper {

	//로그인
	User login(Map<String, String> map);	
	
	User selectById(String id);

	//사용자 정보 업데이트
	void update(User user);

	//사용자 등록
	void regist(User user);

	//사용자 삭제
	void delete(String id);

	//이메일 유효성 검사 
	User emailCheck(String email);

	User idCheck(String id);

}
