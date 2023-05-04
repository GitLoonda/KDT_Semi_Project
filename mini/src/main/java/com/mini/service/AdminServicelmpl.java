package com.mini.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.AdminMapper;

@Service
public class AdminServicelmpl implements AdminService{

	@Autowired
	AdminMapper adminmapper;
}
