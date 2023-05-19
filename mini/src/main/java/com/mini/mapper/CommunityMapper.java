package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Cbrd;
import com.mini.model.Cmre;

@Mapper
public interface CommunityMapper {
	//커뮤니티 게시판 목록
	List<Cbrd> selectCbrdList(HashMap<String, Object> map);
	
	//게시판 전체 갯수
    int selectCbrdListCnt(HashMap<String, Object> map);
    
	// 게시판 등록
	void insertCbrd(HashMap<String, Object> map);
	
	// 게시판 삭제
	void deleteCbrd(HashMap<String, Object> map);
	
	// 게시글 상세보기
	Cbrd getCbrd(HashMap<String, Object> map);
	
	// 게시글 수정
	void updateCbrd(HashMap<String, Object> map);
		
	// 게시글 조회수 증가
	void updateCbrdCnt(HashMap<String, Object> map);
	
	//카테고리 전체 리스트
	List<Cbrd> selectCbrdListcate(HashMap<String, Object> map);
	
	//카테고리 1 리스트
    List<Cbrd> selectCbrdListcate1(HashMap<String, Object> map);
    
    //카테고리 2 리스트
    List<Cbrd> selectCbrdListcate2(HashMap<String, Object> map);
    
    //댓글 갯수
    int selectsumcnt(HashMap<String, Object> map);
	
	// 댓글 추가
	void insertCbrdComment(HashMap<String, Object> map);
		
	// 댓글 목록
	List<Cmre> selectCommentList(HashMap<String, Object> map);
		
	// 댓글 삭제
	void deleteComment(HashMap<String, Object> map);

	// 댓글 수정
	void updateComment(HashMap<String, Object> map);
	
}
