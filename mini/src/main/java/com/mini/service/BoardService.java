package com.mini.service;

import java.util.HashMap;

public interface BoardService {
    // 게시글 조회
    HashMap<String, Object> searchTbrdListInfo(HashMap<String, Object> map);
    //카테고리 리스트 조회
    HashMap<String, Object> searchTbrdCateList(HashMap<String, Object> map);
    // 말머리 리스트 조회
    HashMap<String, Object> searchTbrdkindList(HashMap<String, Object> map);
    //카테고리 리스트 2 조회
    HashMap<String, Object> searchTbrdCate2List(HashMap<String, Object> map);
    //연락처,이메일 조회
    HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
    //지역 2차 리스트
    HashMap<String, Object> searchTbrdlocal2List(HashMap<String, Object> map);
    //지역 3차 리스트
    HashMap<String, Object> searchTbrdlocal3List(HashMap<String, Object> map);

    //거래글 등록
    void TradeInsert(HashMap<String, Object> map);

    //거래글번호 호출
    int searchAddTbno(HashMap<String, Object> map);
    
    //거래글 이미지 파일 등록
    void TradeImgInsert(HashMap<String, Object> map);
    

}
