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
import com.mini.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginservice;
	
	@RequestMapping("/login.do") //로그인페이지
    public String main(Model model) throws Exception{

        return "/login";
    }
	
	@RequestMapping(value = "/login/validate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String validateId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.validateUser(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/join.do") //회원가입페이지
    public String join(Model model) throws Exception{

        return "/join";
    }
	
	@RequestMapping(value = "/login/load.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findQuizList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.searchQuizList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/login/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.searchId(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/addr.do") //주소 찾기 페이지
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/jusoPopup";
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
