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
import com.mini.service.MypageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/mypage.do") //사용자프로필
    public String Umypage(Model model) throws Exception{

        return "/Umypage";
    }
	@RequestMapping("/Cpage.do") //크리에이터프로필
    public String Cmypage(Model model) throws Exception{

        return "/Cmypage";
    }
	
	@RequestMapping(value = "/useredit.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		mypageService.editMyPageUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/useredit.do") //사용자프로필 수정
    public String User_edi2t(Model model) throws Exception{

        return "/User_edit";
	}
	@RequestMapping("/creedit.do") //크리에이터 프로필 수정
    public String Creator_edit(Model model) throws Exception{

        return "/Creator_edit";
    }
	@RequestMapping(value = "/creedit.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cre(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		mypageService.editMyPageUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping("/creadd.do") //크리에이터 등록
    public String creator_add(Model model) throws Exception{

        return "/creator_add";
    }
}
