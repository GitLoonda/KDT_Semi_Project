package com.mini.service;

import java.util.HashMap;

import com.mini.model.Mypg;


public interface MypageService {
	
	// 프로필 아이디/주소 불러오기
	Mypg getUserInfo(HashMap<String, Object> map);
	
	//프로필 하단 정보 수정/업데이트
	Mypg getProDown(HashMap<String, Object> map);

	
} 