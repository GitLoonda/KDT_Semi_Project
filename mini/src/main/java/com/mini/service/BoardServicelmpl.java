package com.mini.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.BoardMapper;


@Service
public class BoardServicelmpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	// 게시글 리스트 불러오기
	@Override
	public HashMap<String, Object> searchTbrdListInfo(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("cnt", boardMapper.selectTbrdListCnt(resultMap));
		resultMap.put("list", boardMapper.selectTbrdListInfo(map));
		return resultMap;
	}
	// 카테고리 리스트 
	@Override
	public HashMap<String, Object> searchTbrdCateList(HashMap<String, Object> map) {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("listbrdf", boardMapper.selectTbrdListbrdf(map));
		resultMap.put("listcate1", boardMapper.selectTbrdListcate1(map));
		resultMap.put("listcate3", boardMapper.selectTbrdListcate3(map));
		resultMap.put("listlocal1", boardMapper.selectTbrdListlocal1(map));
		return resultMap;
	}
	// 카테2 리스트 불러오기
	@Override
	public HashMap<String, Object> searchTbrdCate2List(HashMap<String, Object> map) {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("listcate2", boardMapper.selectTbrdListcate2(map));
		return resultMap;
	}
	// 사용자 연락처 이메일 가져오기
	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("userinfo", boardMapper.selectUserInfo(map));
		return resultMap;
	}
	// 말머리 불러오기
	@Override
	public HashMap<String, Object> searchTbrdkindList(HashMap<String, Object> map) {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("listkindf", boardMapper.selectTbrdListkindf(map));
		return resultMap;
	}
	//지역 2차 불러오기
	@Override
	public HashMap<String, Object> searchTbrdlocal2List(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("listlocal2", boardMapper.selectTbrdListlocal2(map));
		return resultMap;
	}
	//지역 3차 불러오기
	@Override
	public HashMap<String, Object> searchTbrdlocal3List(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("listlocal3", boardMapper.selectTbrdListlocal3(map));
		return resultMap;
	}

	@Override
	public void TradeInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.TradeAdd(map);
	}
}
