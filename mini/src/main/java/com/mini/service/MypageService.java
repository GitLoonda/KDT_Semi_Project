package com.mini.service;

import java.util.HashMap;

import com.mini.model.Mypg;

  
public interface MypageService {
	
	// 프로필 아이디/주소 불러오기
	Mypg getUserInfo(HashMap<String, Object> map);
	
	//프로필 하단 정보 수정/업데이트
	Mypg getProDown(HashMap<String, Object> map);
	
	//크리에이터 신청
	Mypg upcreadd(HashMap<String, Object> map);
	
	//프로필 후기, 커뮤작성, 찜목록 , 등록제품 불러오기
	Mypg getUserPro(HashMap<String, Object> map);
		
	void addMyPageImg(HashMap<String, Object> map);
	
} 