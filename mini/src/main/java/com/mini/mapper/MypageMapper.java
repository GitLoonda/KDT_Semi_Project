package com.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.User;

@Mapper
public interface MypageMapper {
	//크리에이터 등록
	void creaddUpage(HashMap<String, Object> map);
	
	//프로필 수정
	void updatemyPage(HashMap<String, Object> map);
	
	//크리에이터 프로필 수정
	void updateCrePage(HashMap<String, Object> map);
	
	//찜 목록 수정
	void jjimUpage(HashMap<String, Object> map);
	
	// 포트폴리오 목록 수정
	void portfileUpage(HashMap<String, Object> map);
	
	User selectUserInfo(HashMap<String, Object> map);
	
	void insertAccount(HashMap<String, Object> map);
}