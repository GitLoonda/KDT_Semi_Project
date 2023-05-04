package com.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/admin.do") //어드민 메인
    public String main(Model model) throws Exception{

        return "/admin";
    }
	
	@RequestMapping("/notice.do") //공지사항 페이지
    public String notice(Model model) throws Exception{

        return "/notice";
    }
}
