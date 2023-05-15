package com.mini.service;

import java.util.HashMap;

public interface CommunityService {
	
	//커뮤니티 게시글 조회
	HashMap<String, Object> searchCbrdList(HashMap<String, Object> map);
	
	// 게시글 등록
	void addCbrd(HashMap<String, Object> map);
	
	// 게시글 삭제
	void removeCbrd(HashMap<String, Object> map);
	
	// 게시글 상세보기
	HashMap<String, Object> searchCbrd(HashMap<String, Object> map);
	
	// 게시글 수정
	void editCbrd(HashMap<String, Object> map);
	
	
}
