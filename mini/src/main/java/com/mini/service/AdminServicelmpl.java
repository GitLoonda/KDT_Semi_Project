package com.mini.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.AdminMapper;
import com.mini.model.Board;
import com.mini.model.Comm;
import com.mini.model.Comment;
import com.mini.model.Notice;
import com.mini.model.User;

@Service
public class AdminServicelmpl implements AdminService{

	@Autowired
	AdminMapper adminmapper;

	@Override
	public void addAdmin(HashMap<String, Object> map) {
		// TODO Auto-generated method x
		
		adminmapper.insertAdmin(map);
		
	}

	@Override
	public HashMap<String, Object> searchAdminInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = adminmapper.selectAdminCnt(map);
		
		if(cnt > 0){
			User user = adminmapper.selectAdminInfo(map);
			
			if(user != null) {
				if ("N".equals(user.getAdminflg()) || Integer.parseInt(user.getUstatus()) > 1) {
					resultMap.put("result", "fail");
					resultMap.put("message", "접근 권한이 없습니다. 관리자에게 문의하세요!");
				} else {
					resultMap.put("user", user);
					resultMap.put("result", "success");
					resultMap.put("message", user.getName() + "님 환영합니다 😀");
				} 
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "패스워드를 다시 확인해주세요.");
			}
			
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		}
		
		return resultMap;
	}

	@Override
	public int searchAdminCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.selectAdminCnt(map);
	}

	@Override
	public User searchMyAdmin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.selectMyAdmin(map);
	}

	// 비밀번호 찾기 (리스트)
	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		User user = adminmapper.selectUserInfo(map);
			if(user != null) {
				resultMap.put("user", user);
				resultMap.put("result", "success");
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "아이디와 이메일을 확인해주세요!");
			}
		
		return resultMap;

	}
	
	@Override
	public List<User> searchQuiz(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.searchQuiz(map);
	}

	@Override
	public HashMap<String, Object> findPasswd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		User user = adminmapper.findPasswd(map);
		
			if(user != null) {
				resultMap.put("user", user);
				resultMap.put("result", "success");
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "틀린 답변입니다!");
			}
		
		return resultMap;
	}


	@Override
	public List<Notice> searchNoticeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		/*
		 * HashMap<String, Object> resultMap = new HashMap<String, Object>();
		 * resultMap.put("cnt", adminmapper.selectAdminCnt(map)); resultMap.put("list",
		 * adminmapper.selectNoticeList(map));
		 */
		return adminmapper.selectNoticeList(map);
	}

	@Override
	public void deleteNotice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		adminmapper.deleteNotice(map);
		
	}

	@Override
	public HashMap<String, Object> searchNotice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Notice notice = adminmapper.getNotice(map);
		List<Notice> commentList = adminmapper.selectNoticeCommentList(map);
		if(notice != null) {
			adminmapper.updateNoticeCnt(map);
		}
		resultMap.put("info", notice);
		resultMap.put("commentList", commentList);
		return resultMap;
	}

	@Override
	public void editNotice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.updateNotice(map);
	}

	@Override
	public void addNoticeComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.insertNoticeComment(map);
		
	}

	@Override
	public void removeNoticeComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.deleteNoticeComment(map);
	}

	@Override
	public void editNoticeComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.updateNoticeComment(map);
		
	}

	@Override
	public void addNotice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.insertNotice(map);
	}

	@Override
	public int noticeCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.noticeCnt(map);
	}

	@Override
	public List<Notice> blackList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.blackList(map);
	}

	@Override
	public void updateBlackBan(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.updateBlackBan(map);
	}

	@Override
	public int blackCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.blackCnt(map);
	}

	@Override
	public List<Notice> recogCreator(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.recogCreator(map);
	}

	@Override
	public int recogCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.recogCnt(map);
	}

	@Override
	public void updateStatusCreator(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.updateStatusCreator(map);
		if("N".equals(map.get("creatorStatus"))) {
			adminmapper.delYnCreator(map);
		}
	}

	@Override
	public List<Notice> userForAdmin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.userForAdmin(map);
	}

	@Override
	public void recogAdmin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		adminmapper.recogAdmin(map);
	}

	@Override
	public int adminUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.adminUserCnt(map);
	}
	
	@Override
	public int adminCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.adminCnt(map);
	}

	@Override
	public List<Board> adminBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.adminBoardList(map);
	}

	@Override
	public void adminBoardBlind(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.adminBoardBlind(map);
		if("N".equals(map.get("creatorStatus"))) {
			adminmapper.delYnCreator(map);
		}
	}

	@Override
	public void adminBoardRemove(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.adminBoardRemove(map);
	}

	@Override
	public List<Comm> adminCommList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.adminCommList(map);
	}

	@Override
	public void adminCommBlind(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		adminmapper.adminCommBlind(map);
	}

	@Override
	public int boardCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.boardCnt(map);
	}

	@Override
	public int commCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.commCnt(map);
	}

	@Override
	public List<Comment> adminCommentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.adminCommentList(map);
	}

	@Override
	public void adminCommentRemove(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.adminCommentRemove(map);
	}

	@Override
	public List<Comment> adminCommentList2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.adminCommentList2(map);
	}

	@Override
	public int boardCommentCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.boardCommentCnt(map);
	}

	@Override
	public int commCommentCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.commCommentCnt(map);
	}

	@Override
	public void adminCommRemove(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.adminCommRemove(map);
	}

	@Override
	public int creatorCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminmapper.creatorCnt(map);
	}

	// 게시글 신고 처리
	@Override
	public void boardReport(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminmapper.boardReport(map);
	}


}
