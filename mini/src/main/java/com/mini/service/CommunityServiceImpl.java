package com.mini.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityMapper communityMapper;
	
	@Override
	public HashMap<String, Object> searchCbrdList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cnt", communityMapper.selectCbrdListCnt(resultMap));
		resultMap.put("list", communityMapper.selectCbrdList(map));
		return resultMap;
	}

}
