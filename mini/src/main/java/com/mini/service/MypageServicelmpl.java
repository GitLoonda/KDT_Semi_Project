package com.mini.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.MypageMapper;
import com.mini.model.User;

@Service
public class MypageServicelmpl implements MypageService{
	
	@Autowired
	MypageMapper mypagemapper;
	
	// 프로필 아이디/주소 불러오기
	@Override
	public User getUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mypagemapper.selectUserInfo(map);
	}
	
	//프로필 하단 정보 수정/업데이트
	@Override
	public User getProDown(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	//프로필 상단 업데이트
	@Override
	public User getUserUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	//프로필 상단(남김말/정보) 불러오기
	@Override
	public User getProUp(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	



}
