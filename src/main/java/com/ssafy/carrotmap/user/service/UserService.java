package com.ssafy.carrotmap.user.service;

import java.util.Map;

import com.ssafy.carrotmap.repository.dto.User;

public interface UserService {

	

	void update(User user);
	
	User selectById(String id);

	User login(Map<String, String> map);

	void regist(User user);

	void delete(String id);

	int emailCheck(String email);

	int idCheck(String id);

	
	
}
