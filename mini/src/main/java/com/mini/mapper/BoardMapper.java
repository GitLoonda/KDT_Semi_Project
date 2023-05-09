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
}


