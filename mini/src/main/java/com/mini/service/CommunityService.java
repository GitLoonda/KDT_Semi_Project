package com.mini.service;

import java.util.HashMap;

public interface CommunityService {
	
	//커뮤니티 게시글 조회
	HashMap<String, Object> searchCbrdList(HashMap<String, Object> map);
	
	 //카테고리 전체 리스트 조회
    HashMap<String, Object> searchCbrdCateList(HashMap<String, Object> map);
	
    //카테고리 1 리스트 조회
    HashMap<String, Object> searchCbrdCate1List(HashMap<String, Object> map);
    
    //카테고리 2 리스트 조회
    HashMap<String, Object> searchCbrdCate2List(HashMap<String, Object> map);
	
	// 게시글 등록
	void addCbrd(HashMap<String, Object> map);
	void CommImgInsert(HashMap<String, Object> map);

	
	// 게시글 삭제
	void removeCbrd(HashMap<String, Object> map);
	
	// 게시글 상세보기
	HashMap<String, Object> searchCbrd(HashMap<String, Object> map);
	
	// 게시글 수정
	void editCbrd(HashMap<String, Object> map);
	
	//게시글 상세 댓글 리스트
    HashMap<String, Object> selectCommentList(HashMap<String, Object> map);

	
	// 댓글 등록
	void addCbrdComment(HashMap<String, Object> map);
		
	// 댓글 삭제
	void removeComment(HashMap<String, Object> map);
	
	// 댓글 수정
	void editComment(HashMap<String, Object> map);
	
	
}
