package com.mini.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.MypageMapper;
import com.mini.model.Mypg;

@Service
public class MypageServicelmpl implements MypageService{
	
	@Autowired
	MypageMapper mypagemapper;
	
	// 프로필 아이디/주소 불러오기
	@Override
	public Mypg getUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mypagemapper.selectUserInfo(map);
	} 
	
	//프로필 하단 정보 수정/업데이트
	@Override
	public Mypg getProDown(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
			mypagemapper.updateMyPage(map);
			mypagemapper.updateUppro(map);
			return null;	
	}
	 
	//크리에이터 신청
	@Override
	public Mypg upcreadd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.insCreadd(map);
		//mypagemapper.insCreimg(map);
		//mypagemapper.insCrebor(map);
		return null; 
	}
	// 프로필에서 후기 , 커뮤니티작성글 , 찜목록 , 등록제품 불러오기
	@Override
	public Mypg getUserPro(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.selectHugi(map);
		mypagemapper.selectcommu(map);
		mypagemapper.selectjjim(map);
		mypagemapper.selectpro(map);
		return null;
	}




}
