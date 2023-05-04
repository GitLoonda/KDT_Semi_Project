package com.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/main.do") //메인페이지
    public String main(Model model) throws Exception{

        return "/main";
    }
	
	@RequestMapping("/sell.do") //거래게시판 페이지
    public String sell(Model model) throws Exception{

        return "/sell_list";
    }
	
	@RequestMapping("/request.do") //의뢰게시판 페이지
    public String request(Model model) throws Exception{

        return "/req_list";
    }
	
	@RequestMapping("/promote.do") //홍보게시판 페이지
    public String promote(Model model) throws Exception{

        return "/prom_list";
    }
	
	@RequestMapping("/community.do") //커뮤니티 페이지
    public String community(Model model) throws Exception{

        return "/comm_list";
    }
	


}
