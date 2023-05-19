package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.*;

@Mapper
public interface BoardMapper {
	// trade.do
    // 게시글 리스트
    List<TbrdList> selectTbrdListInfo(HashMap<String, Object> map);
    List<TbrdList> selectjimtbnoList(HashMap<String, Object> map);
    
    //게시판 전체 갯수
    int selectTbrdListCnt(HashMap<String, Object> map);
    

    // tradeadd.do
    // 카테고리 리스트
    List<TbrdList> selectTbrdListbrdf(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListkindf(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListcate1(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListcate2(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListcate3(HashMap<String, Object> map);
    List<TbrdList> selectUserInfo(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListlocal1(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListlocal2(HashMap<String, Object> map);
    List<TbrdList> selectTbrdListlocal3(HashMap<String, Object> map);
    
    //거래글 등록
    void TradeAdd (HashMap<String, Object> map);
    
    void TradeImgAdd(HashMap<String, Object> map);

    //tradeview
    //게시글 상세
    List<TbrdList> selectTbrdInfo(HashMap<String, Object> map);
    void updateViewCnt(HashMap<String, Object> map);
    // 찜 했는지 검증
    int jimCnt(HashMap<String, Object> map);

    //개시글 찜 갯수 
    int selectjimcnt(HashMap<String, Object> map);

    //게시글 상태 변경
    void TbrdbstModify (HashMap<String, Object> map);
    
    // 찜 등록
    void jimAdd (HashMap<String, Object> map);
    void likeAdd (HashMap<String, Object> map);
    
    // 찜 삭제
    void jimDel (HashMap<String, Object> map);
    void likeDel (HashMap<String, Object> map);

    //게시글 삭제
    void BrdDel (HashMap<String, Object> map);
    
    // 게시글 상세 댓글 등록
    void TbrdcommAdd (HashMap<String, Object> map);

    List<Cmre> selectTbrdcomm (HashMap<String, Object> map);
    int selectsumcnt(HashMap<String, Object> map);

    //tradeedit.do
    // 글정보 가져오기
    List<TbrdList> selectviewlist(HashMap<String, Object> map);
    // 글에 등록된 이미지 가져오기
    List<TbrdList> selectviewfilelist(HashMap<String, Object> map);
    // 이미지 삭제
    void viewfiledelete(HashMap<String, Object> map);
    // 게시글 업데이트
    void Tradeupdate(HashMap<String, Object> map);
}


