package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Board;
import com.mini.model.Comm;
import com.mini.model.Comment;
import com.mini.model.Notice;
import com.mini.model.User;

@Mapper
public interface AdminMapper {
	
	// 관리자 로그인
	User selectAdminInfo(HashMap<String, Object> map);
	
	// 중복 체크
	int selectAdminCnt(HashMap<String, Object> map);
	
	// 관리자 회원가입
	void insertAdmin(HashMap<String, Object> map);
	
	// 관리자리스트 호출
	User selectMyAdmin(HashMap<String, Object> map);
	
	// 가입시 질문들
	List<User> searchQuiz(HashMap<String, Object> map);
	
	/* -----------------------------------------------*/
	
	// 비밀번호 찾기 ( 유저 리스트 ) 
	User selectUserInfo(HashMap<String, Object> map);
	
	// 비밀번호 찾기 ( 퀴즈 ) 
	User findPasswd(HashMap<String, Object> map);	
	
	/* -----------------------------------------------*/
	
	// 공지사항 리스트
	List<Notice> selectNoticeList(HashMap<String, Object> map);
	
	// 게시판 등록
	void insertNotice(HashMap<String, Object> map);
	
	// 공지사항 삭제
	void deleteNotice(HashMap<String, Object> map);
	
	// 게시글 상세보기
	Notice getNotice(HashMap<String, Object> map);
	
	// 게시글 수정
	void updateNotice(HashMap<String, Object> map);
	
	// 게시글 조회수 증가
	void updateNoticeCnt(HashMap<String, Object> map);
	
	// 공지사항 갯수
	int noticeCnt(HashMap<String, Object> map);
	
	// 댓글 추가
	void insertNoticeComment(HashMap<String, Object> map);
	
	// 댓글 목록
	List<Notice> selectNoticeCommentList(HashMap<String, Object> map);
	
	// 댓글 삭제
	void deleteNoticeComment(HashMap<String, Object> map);

	// 댓글 수정
	void updateNoticeComment(HashMap<String, Object> map);
	
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
	
	// 관리자 페이지 크리에이터 거부
	void delYnCreator(HashMap<String, Object> map);
	
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

	/* -----------------------------------------------*/
	
	// 게시글 신고 처리
	void boardReport(HashMap<String, Object> map);
	
	// 게시글 신고 처리
	List<Comm> boardSearchReport(HashMap<String, Object> map);
}


