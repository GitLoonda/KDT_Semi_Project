package com.mini.service;

import java.util.HashMap;

public interface BoardService {
    // 게시글 조회
    HashMap<String, Object> searchTbrdListInfo(HashMap<String, Object> map);
    //카테고리 리스트 조회
    HashMap<String, Object> searchTbrdCateList(HashMap<String, Object> map);

    HashMap<String, Object> searchTbrdCate2List(HashMap<String, Object> map);
    
}
