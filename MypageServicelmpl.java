package com.mini.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.MypageMapper;

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
	public void updatemy(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mypagemapper.updateUpage(map);
	}
	@Override
	public void updatecre(HashMap<String, Object> map) {
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
	
}
