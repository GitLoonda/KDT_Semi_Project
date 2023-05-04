package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login.do") //로그인페이지
    public String main(Model model) throws Exception{

        return "/login";
    }
	
	@RequestMapping("/join.do") //회원가입페이지
    public String join(Model model) throws Exception{

        return "/join";
    }

}
