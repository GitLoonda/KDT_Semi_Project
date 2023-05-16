package com.mini.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.LoginMapper;
import com.mini.model.User;

@Service
public class LoginServicelmpl implements LoginService {
	
	@Autowired
	LoginMapper loginmapper;

	@Override
	public HashMap<String, Object> validateUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = loginmapper.selectCntUser(map);
		if(cnt == 1) {
			User user = loginmapper.selectUserInfo(map);
			if (user != null) {
				resultMap.put("result", "success");
				resultMap.put("user", user);
				return resultMap;
			} else {
				resultMap.put("result", "fail");
				return resultMap;
			}
		} else {
			resultMap.put("result", "fail");
			return resultMap;
		}
	}
	
	public HashMap<String, Object> searchId(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = loginmapper.selectCntUser(map);
		if(cnt == 0) {
			resultMap.put("result", "success");
			return resultMap;
		} else {
			resultMap.put("result", "fail");
			return resultMap;
		}
	}

	@Override
	public HashMap<String, Object> searchQuizList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("quiz", loginmapper.selectQuizList(map));
		return resultMap;
	}

	@Override
	public void addId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		loginmapper.insertAccount(map);
		return;
	}
}
