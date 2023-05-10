package com.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypage.do") //사용자프로필
    public String Umypage(Model model) throws Exception{

        return "/Umypage";
    }
	@RequestMapping("/Cpage.do") //크리에이터프로필
    public String Cmypage(Model model) throws Exception{

        return "/Cmypage";
    }
	@RequestMapping("/mypage/useredit.do") //사용자프로필 수정
    public String user_edit(Model model) throws Exception{

        return "/user_edit";
    }
	@RequestMapping("/Cpage/creedit.do") //크리에이터프로필 수정
    public String creator_edit(Model model) throws Exception{

        return "/creator_edit";
    }
	@RequestMapping("/Cpage/creadd.do") //크리에이터 등록
    public String creator_add(Model model) throws Exception{

        return "/creator_add";
    }
}
