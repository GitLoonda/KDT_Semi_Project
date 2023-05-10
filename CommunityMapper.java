package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Cbrd;

@Mapper
public interface CommunityMapper {
	//커뮤니티 게시판 목록
	List<Cbrd> selectCbrdList(HashMap<String, Object> map);
	
	//게시판 전체 갯수
    int selectCbrdListCnt(HashMap<String, Object> map);
    
    //게시판 등록
    void insertCbrd(HashMap<String, Object> map);

}
