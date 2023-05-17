package com.mini.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.BoardMapper;
import com.mini.model.TbrdList;


@Service
public class BoardServicelmpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	// trade.do
	// 게시글 리스트 불러오기
	@Override
	public HashMap<String, Object> searchTbrdListInfo(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("jimsumcnt",boardMapper.selectjimtbnoList(map));
		resultMap.put("cnt", boardMapper.selectTbrdListCnt(map));
		resultMap.put("list", boardMapper.selectTbrdListInfo(map));
		return resultMap;
	}

	    // tradeadd.do
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
	//게시글 등록
	@Override
	public void TradeInsert(HashMap<String, Object> map) {
		boardMapper.TradeAdd(map);
		
	}
	//게시글 이미지 등록
	public void TradeImgInsert(HashMap<String, Object> map){
		boardMapper.TradeImgAdd(map);
	}

	//게시물 상세
	@Override
	public HashMap<String, Object> searchTbrdInfo(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("ujimcnt",boardMapper.jimCnt(map));
		resultMap.put("list", boardMapper.selectTbrdInfo(map));
		return resultMap;
	}
	//게시글 찜 갯수
	@Override
	public int searchjimcnt(HashMap<String, Object> map){
		return boardMapper.selectjimcnt(map);
	}
	// 거래상테 변경
	@Override
	public void Tbrdbstupdate(HashMap<String, Object> map) {
		boardMapper.TbrdbstModify(map);
	}

	//찜 등록
	@Override
	public void Jjiminsert(HashMap<String, Object> map) {
		boardMapper.jimAdd(map);
		boardMapper.likeAdd(map);
	}

	//찜 삭제
	@Override
	public void Jjimdelete(HashMap<String, Object> map) {
		boardMapper.jimDel(map);
		boardMapper.likeDel(map);
	}

	//게시글 삭제
	@Override
	public void BrdDelete(HashMap<String, Object> map) {
		boardMapper.BrdDel(map);
	}

	//게시물 상세 댓글 등록
	@Override
	public void TbrdcommInsert(HashMap<String, Object> map) {
		boardMapper.TbrdcommAdd(map);
	}

	@Override
	public HashMap<String, Object> searchCommInfo(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("commlist", boardMapper.selectTbrdcomm(map));
		resultMap.put("cnt", boardMapper.selectsumcnt(map));
		return resultMap;
	}
	
}
