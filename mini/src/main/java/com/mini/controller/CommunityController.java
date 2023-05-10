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

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@RequestMapping("/comm.do") //커뮤니티 게시판 메인
    public String main(Model model) throws Exception{

        return "/comm_list";
    }
	
	@RequestMapping(value = "/comm/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrdList(map);
		resultMap.put("result","success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/comm/add.do") //커뮤니티 글쓰기
    public String insert(Model model) throws Exception{

        return "/comm_add";
    }
	
	@RequestMapping("/comm/read.do") //커뮤니티 글 상세
    public String read(Model model) throws Exception{

        return "/comm_read";
    }
	
	@RequestMapping("/comm/edit.do") //커뮤니티 글 수정
    public String edit(Model model) throws Exception{
		
        return "/comm_edit";
    }
}
