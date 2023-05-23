package com.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Mypg;

 
@Mapper
public interface MypageMapper { 

	// 프로필 아이디/주소 불러오기
	Mypg selectUserInfo(HashMap<String, Object> map);
	
	//프로필 하단 정보 수정/업데이트
	void updateMyPage(HashMap<String, Object> map);
	
	//프로필 상단 정보 수정/업데이트
	void updateUppro(HashMap<String, Object> map);

	//크리에이터 신청
	void insCreadd(HashMap<String, Object> map);
	
	void insCreimg(HashMap<String, Object> map);
	
	void insCrebor(HashMap<String, Object> map);
	
	//프로필에서 후기 , 커뮤니티작성글 , 찜목록 , 등록제품 불러오기
	Mypg selectHugi(HashMap<String, Object> map);
	
	Mypg selectcommu(HashMap<String, Object> map);
	
	Mypg selectjjim(HashMap<String, Object> map);
	
	Mypg selectpro(HashMap<String, Object> map);
	
	void deleteMyPageImg(HashMap<String, Object> map);
	
	void insertMyPageImg(HashMap<String, Object> map);
}