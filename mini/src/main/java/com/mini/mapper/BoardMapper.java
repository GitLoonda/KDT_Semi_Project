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
    
    //거래글번호 호출
    int selectAddTbno(HashMap<String, Object> map);

    //이미지파일 등록
    void TradeImgAdd (HashMap<String, Object> map);

    //tradeview
    //게시글 상세
    List<TbrdList> selectTbrdInfo(HashMap<String, Object> map);

    // 게시글 상세 댓글 등록
    void TbrdcommAdd (HashMap<String, Object> map);

    List<Cmre> selectTbrdcomm (HashMap<String, Object> map);
    int selectsumcnt(HashMap<String, Object> map);

}


