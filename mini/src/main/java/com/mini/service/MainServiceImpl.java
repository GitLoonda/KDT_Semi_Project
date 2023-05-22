package com.mini.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.BoardMapper;
import com.mini.mapper.MainMapper;
import com.mini.model.Desc;


@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainMapper mainMapper;

	@Override
	public List<Desc> searchInitialList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("category", );
		return mainMapper.selectCategoryList(map);
	}

	@Override
	public HashMap<String, Object> searchRcmdList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sell", mainMapper.selectSellList(map));
		resultMap.put("buy", mainMapper.selectBuyList(map));
		resultMap.put("comm", mainMapper.selectCommList(map));
		return resultMap;
	}
}
