package com.mini.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.BoardMapper;


@Service
public class BoardServicelmpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;

	@Override
	public HashMap<String, Object> searchTbrdListInfo(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("cnt", boardMapper.selectTbrdListCnt(resultMap));
		resultMap.put("list", boardMapper.selectTbrdListInfo(map));
		return resultMap;
	}
}
