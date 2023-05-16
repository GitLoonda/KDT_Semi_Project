package com.mini.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.CommunityMapper;
import com.mini.model.Cbrd;
import com.mini.model.Cmre;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityMapper communityMapper;
	
	//커뮤니티 게시판 목록
	@Override
	public HashMap<String, Object> searchCbrdList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cnt", communityMapper.selectCbrdListCnt(resultMap));
		resultMap.put("list", communityMapper.selectCbrdList(map));
		return resultMap;
	}
	
	//카테고리 리스트 1
	@Override
	public HashMap<String, Object> searchCbrdCate1List(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("listcate1", communityMapper.selectCbrdListcate1(map));
		return resultMap;
	
	}
	
	//카테고리 리스트 2
	@Override
	public HashMap<String, Object> searchCbrdCate2List(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("listcate2", communityMapper.selectCbrdListcate2(map));
		return resultMap;
	}

	//게시글 추가
	@Override
	public void addCbrd(HashMap<String, Object> map) {
		communityMapper.insertCbrd(map);
	}
	
	//게시글 삭제
	@Override
	public void removeCbrd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		communityMapper.deleteCbrd(map);
	}
	
	//게시글 상세
	@Override
	public HashMap<String, Object> searchCbrd(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Cbrd cbrd = communityMapper.getCbrd(map);
		List<Cmre> commentList = communityMapper.selectCommentList(map);
		if(cbrd != null) {
			communityMapper.updateCbrdCnt(map);
		}
		resultMap.put("info", cbrd);
		resultMap.put("commentList", commentList);
		return resultMap;
	}
	
	//게시글 수정
	@Override
	public void editCbrd(HashMap<String, Object> map) {
		communityMapper.updateCbrd(map);
	}

	@Override
	public void addCbrdComment(HashMap<String, Object> map) {
		communityMapper.insertCbrdComment(map);
	}

	@Override
	public void removeComment(HashMap<String, Object> map) {
		communityMapper.deleteComment(map);
	}

	@Override
	public void editComment(HashMap<String, Object> map) {
		communityMapper.updateComment(map);
	}



}
