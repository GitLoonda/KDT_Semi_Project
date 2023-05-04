package com.mini.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.BoardMapper;


@Service
public class BoardServicelmpl implements BoardService{

	@Autowired
	BoardMapper boardmapper;
}
