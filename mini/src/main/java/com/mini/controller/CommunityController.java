package com.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String main(Model model) throws Exception{

        return "/comm_list";
    }
	
	//리스트
	@RequestMapping(value = "/comm/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
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
	
	
	@RequestMapping("/commread.do") //커뮤니티 글 상세
    public String read(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
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
	
	@RequestMapping(value = "/comm/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.editCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
}
