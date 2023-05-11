package com.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageMapper {
	//크리에이터 등록
	void creaddUpage(HashMap<String, Object> map);
	
	//프로필 수정
	void updateUpage(HashMap<String, Object> map);
	
	//찜 목록 수정
	void jjimUpage(HashMap<String, Object> map);
	
	// 포트폴리오 목록 수정
	void portfileUpage(HashMap<String, Object> map);
}