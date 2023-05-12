package com.mini.service;

import java.util.HashMap;

import com.mini.model.User;

public interface MypageService {
	
	//크리에이터 등록
	void creadd(HashMap<String, Object> map);
	
	//사용자프로필 수정
	void updatemy(HashMap<String, Object> map);
	
	//크리에이터프로필 수정
	void updatecre(HashMap<String, Object> map);
	
	//찜목록 수정
	void upjjim(HashMap<String, Object> map);
	
	//포트폴리오 수정
	void uppoto(HashMap<String, Object> map);

}
