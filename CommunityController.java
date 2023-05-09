package com.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	@RequestMapping("/comm.do") //커뮤니티 게시판 메인
    public String main(Model model) throws Exception{

        return "/comm_list";
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
