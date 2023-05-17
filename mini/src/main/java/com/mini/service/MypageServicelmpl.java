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
	
	@Override
	public void creadd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.creaddUpage(map);
	}
	@Override
	public void editMyPageUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.updatemyPage(map);
	}
	@Override
	public void editMyCreUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.updateCrePage(map);
	}
	@Override
	public void upjjim(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.jjimUpage(map);
	}
	@Override
	public void uppoto(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.portfileUpage(map);
	}
	@Override
	public User getUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mypagemapper.selectUserInfo(map);
	}
	
}
