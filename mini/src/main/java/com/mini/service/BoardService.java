package com.mini.service;

import java.util.HashMap;

public interface BoardService {
    // trade.do
    // 게시글 조회
    HashMap<String, Object> searchTbrdListInfo(HashMap<String, Object> map);

    // tradeadd.do
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
    void TradeImgInsert(HashMap<String, Object> map);


    //tradeview.do
    //게시글 상세
    HashMap<String, Object> searchTbrdInfo(HashMap<String, Object> map);
    // 거래자 닉네임 
    HashMap<String, Object> searchNick(HashMap<String, Object> map);
    //게시글 찜 갯수
    int searchjimcnt(HashMap<String, Object> map);
    
    //거래상태 변경
    void Tbrdbstupdate(HashMap<String, Object> map);
    
    // 찜 등록
    void Jjiminsert(HashMap<String, Object> map);
    
    //찜 삭제
    void Jjimdelete(HashMap<String, Object> map);
    //게시글 삭제
    void BrdDelete(HashMap<String, Object> map);
    //게시글 상세 댓글 등록
    void TbrdcommInsert(HashMap<String, Object> map);

    //게시글 상세 댓글 리스트
    HashMap<String, Object> searchCommInfo(HashMap<String, Object> map);

    // 게시글 댓글 수정
    void updateComm(HashMap<String,Object> map);

    // 게시글 댓글 삭제
    void delcomm(HashMap<String,Object> map);
    
    //tradeedit.do
    //수정 리스트 
    HashMap<String, Object> searchviewlist(HashMap<String, Object> map);
    //등록된 파일 리스트
    HashMap<String, Object> searchviewfilelist(HashMap<String, Object> map);
    //이미지 삭제
    void viewfileDel(HashMap<String, Object> map);
    // 게시글 업데이트
    void tradeupdate(HashMap<String, Object> map);

    // 댓글 사용자 리스트 가져오기
    HashMap<String, Object> searchSCommInfo(HashMap<String, Object> map);
    // 거래 사용자 지정
    void tradeset(HashMap<String, Object> map);
}
