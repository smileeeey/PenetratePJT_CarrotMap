package com.ssafy.carrotmap.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.carrotmap.repository.dto.User;
import com.ssafy.carrotmap.repository.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	
	@Override
	public User login(Map<String, String> map) {		
		return userMapper.login(map);
	}
	

	@Override
	public User selectById(String id) {
		return userMapper.selectById(id);
	}



	@Override
	public void update(User user) {	
		System.out.println("update:"+user);
		userMapper.update(user);
	}


	@Override
	public void regist(User user) {
		System.out.println("서비스 도착");
		userMapper.regist(user);
	}


	@Override
	public void delete(String id) {
		userMapper.delete(id);		
	}


	@Override
	public int emailCheck(String email) {
		if(userMapper.emailCheck(email)==null) {
			return 1;
		}
		return 0;
		
	}


	@Override
	public int idCheck(String id) {
		if(userMapper.idCheck(id)==null) {
			return 1;
		}
		return 0;
	}


}
