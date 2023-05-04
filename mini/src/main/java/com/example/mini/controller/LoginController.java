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
	
	@RequestMapping("/login/findId.do") //아이디 찾기
    public String findId(Model model) throws Exception{

        return "/find_id";
    }
	
	@RequestMapping("/login/findPw.do") //비밀번호 찾기
    public String findPw(Model model) throws Exception{

        return "/find_pw";
    }


}
