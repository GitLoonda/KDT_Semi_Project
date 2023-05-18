package com.mini.service;

import java.util.HashMap;
import java.util.List;

import com.mini.model.Board;
import com.mini.model.Comm;
import com.mini.model.Comment;
import com.mini.model.Notice;
import com.mini.model.User;

public interface AdminService { 
	
	//로그인
	HashMap<String, Object> searchAdminInfo(HashMap<String, Object> map);
	
	// 중복체크
	int searchAdminCnt(HashMap<String, Object> map);
	
	//회원가입
	void addAdmin(HashMap<String, Object> map);
	
	//관리자 중복체크
	User searchMyAdmin(HashMap<String, Object> map);

	// 가입시 질문들
	List<User> searchQuiz(HashMap<String, Object> map);

	/* -----------------------------------------------*/
	
	// 비밀번호 찾기 ( 유저 리스트 ) 
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
	
	// 비밀번호 찾기 ( 퀴즈 ) 
	HashMap<String, Object> findPasswd(HashMap<String, Object> map);	
	
	/* -----------------------------------------------*/
	// 공지사항 리스트
	List<Notice> searchNoticeList(HashMap<String, Object> map);
	
	// 게시글 등록
	void addNotice(HashMap<String, Object> map);
	
	// 공지사항 삭제
	void deleteNotice(HashMap<String, Object> map);
	
	// 게시글 상세보기
	HashMap<String, Object> searchNotice(HashMap<String, Object> map);
	
	// 게시글 수정
	void editNotice(HashMap<String, Object> map);
	
	// 공지사항 갯수
	int noticeCnt(HashMap<String, Object> map);
	
	// 댓글 등록
	void addNoticeComment(HashMap<String, Object> map);
	
	// 댓글 삭제
	void removeNoticeComment(HashMap<String, Object> map);
	
	// 댓글 수정
	void editNoticeComment(HashMap<String, Object> map);

	/* -----------------------------------------------*/
	
	// 블랙리스트
	List<Notice> blackList(HashMap<String, Object> map);

	// 블랙리스트 승인 , 해제
	void updateBlackBan(HashMap<String, Object> map);

	/* -----------------------------------------------*/
	
	// 관리자 페이지 승인 목록 리스트
	List<Notice> recogCreator(HashMap<String, Object> map);

	// 관리자 페이지 신고 처리 대기수
	int blackCnt(HashMap<String, Object> map);
	
	// 관리자 페이지 크리에이터 승인 대기수
	int recogCnt(HashMap<String, Object> map);

	// 관리자 페이지 크리에이터 승인 여부
	void updateStatusCreator(HashMap<String, Object> map);
	
	// 크리에이터 리스트 갯수
	int creatorCnt(HashMap<String, Object> map);
	
	
	/* -----------------------------------------------*/

	// 관리자 페이지 관리자 부여 리스트
	List<Notice> userForAdmin(HashMap<String, Object> map);
	
	// 관리자 페이지 관리자 부여 승인 여부
	void recogAdmin(HashMap<String, Object> map);
	
	// 관리자 및 회원 수
	int adminUserCnt(HashMap<String, Object> map);
	
	// 관리자 수
	int adminCnt(HashMap<String, Object> map);
	
	/* -----------------------------------------------*/
	
	// 관리자 게시글 관리 리스트
	List<Board> adminBoardList(HashMap<String, Object> map);
	
	// 게시글 관리 블라인드
	void adminBoardBlind(HashMap<String, Object> map);
	
	// 게시글 관리 삭제
	void adminBoardRemove(HashMap<String, Object> map);
	
	// 커뮤니티 게시글 관리 삭제
	void adminCommRemove(HashMap<String, Object> map);
	
	
	/* -----------------------------------------------*/
	
	// 관리자 게시글 커뮤니티 리스트
	List<Comm> adminCommList(HashMap<String, Object> map);
	
	// 커뮤니티 블라인드
	void adminCommBlind(HashMap<String, Object> map);
	
	// 게시글 갯수
	int boardCnt(HashMap<String, Object> map);
	
	// 커뮤니티 갯수
	int commCnt(HashMap<String, Object> map);
	
	/* -----------------------------------------------*/
	
	// 댓글 관리 리스트
	List<Comment> adminCommentList(HashMap<String, Object> map);
	
	// 댓글 관리 리스트2
	List<Comment> adminCommentList2(HashMap<String, Object> map);
	
	// 댓글 삭제(블라인드)
	void adminCommentRemove(HashMap<String, Object> map);
	
	// 댓글 갯수 (거래쪽게시글)
	
	int boardCommentCnt(HashMap<String, Object> map);
	// 댓글 갯수 (커뮤니티)
	int commCommentCnt(HashMap<String, Object> map);

}
