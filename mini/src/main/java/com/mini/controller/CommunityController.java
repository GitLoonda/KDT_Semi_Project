	package com.mini.controller;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mini.service.CommunityService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/comm.do") //커뮤니티 게시판 메인
    public String main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("mainlist", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
        request.setAttribute("sessionNick", session.getAttribute("sessionNick"));
		request.setAttribute("sessionAdminflg", session.getAttribute("sessionAdminflg"));

        return "/comm_list";
    }
	
	//리스트
	@RequestMapping(value = "/comm/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = communityService.searchCbrdList(map);
		resultMap.put("result","success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/commadd.do") //커뮤니티 글쓰기
    public String insert(Model model) throws Exception{

        return "/comm_add";
    }
	
	//글쓰기
	@RequestMapping(value = "/comm/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("userId", session.getAttribute("sessionId"));
		communityService.addCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//카테고리 전체 분류
    @RequestMapping(value = "/comm/cate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdCateList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrdCateList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//카테고리 1 분류
    @RequestMapping(value = "/comm/cate1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdCate1List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrdCate1List(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
  //카테고리 2 분류
    @RequestMapping(value = "/comm/cate2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdCate2List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrdCate2List(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/commread.do") //커뮤니티 글 상세
    public String read(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionAdminflg", session.getAttribute("sessionAdminflg"));
        return "/comm_read";
	}
	
	// 글 상세
	@RequestMapping(value = "/comm/read.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/commedit.do") //커뮤니티 글 수정
    public String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/comm_edit";
    }
	
	// 글 수정
	@RequestMapping(value = "/comm/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.editCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 글 삭제
	@RequestMapping(value = "/comm/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.removeCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	//게시글 신고 팝업
	@RequestMapping("/reportboard.do")
    public String pop() {
		return "/report_board";
	}
	
	//댓글 신고 팝업
		@RequestMapping("/reportcomment.do")
		public String pop2() {
			return "/report_comment";
		}
	
	//댓글
	@RequestMapping(value = "/comm/comment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String comment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.addCbrdComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//댓글 삭제
	@RequestMapping(value = "/comment/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.removeComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//댓글 수정
	@RequestMapping(value = "/comment/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.editComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	
	

}
