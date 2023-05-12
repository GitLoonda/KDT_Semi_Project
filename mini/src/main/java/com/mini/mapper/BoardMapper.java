package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.TbrdList;

@Mapper
public interface BoardMapper {
	
    List<TbrdList> selectTbrdListInfo(HashMap<String, Object> map);
    //게시판 전체 갯수
    int selectTbrdListCnt(HashMap<String, Object> map);
    
    // 카테고리 리스트
    List<TbrdList> selectTbrdListbrdf(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListkindf(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListcate1(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListcate2(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListcate3(HashMap<String, Object> map);
    
    // List<TbrdList> selectTbrdListlocal1(HashMap<String, Object> map);
    // List<TbrdList> selectTbrdListlocal2(HashMap<String, Object> map);
    // List<TbrdList> selectTbrdListlocal3(HashMap<String, Object> map);

}


