package com.mini.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.MypageMapper;

@Service
public class MypageServicelmpl implements MypageService{
	
	@Autowired
	MypageMapper mypagemapper;
}
