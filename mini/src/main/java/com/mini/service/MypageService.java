package com.mini.service;

import java.util.HashMap;

import com.mini.model.User;

public interface MypageService {
	
	// 프로필 아이디/주소 불러오기
	User getUserInfo(HashMap<String, Object> map);
	
	//프로필 하단 정보 수정/업데이트
	User getProDown(HashMap<String, Object> map);
	
	//프로필 상단 업데이트
	User getUserUpdate(HashMap<String, Object> map);
	
	//프로필 상단(남김말/정보) 불러오기
	User getProUp(HashMap<String, Object> map);
	
	
} 