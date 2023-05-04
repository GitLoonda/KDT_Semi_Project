package com.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypage.do") //마이페이지
    public String main(Model model) throws Exception{

        return "/mypage";
    }
}
