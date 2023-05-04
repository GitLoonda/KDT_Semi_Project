package com.mini.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.LoginMapper;

@Service
public class LoginServicelmpl implements LoginService {
	
	@Autowired
	LoginMapper loginmapper;
}
