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
import com.mini.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	LoginService loginservice;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/login.do") //로그인페이지
    public String main(Model model) throws Exception{
		String id = (String) session.getAttribute("sessionId");
		String name = (String) session.getAttribute("sessionName");
		String nick = (String) session.getAttribute("sessionNick");
		String ustatus = (String) session.getAttribute("sessionuStatus");
		
		session.removeAttribute(id);
		session.removeAttribute(name);
		session.removeAttribute(nick);
		session.removeAttribute(ustatus);
		
		session.invalidate();

        return "/login";
    }
	
	@RequestMapping("/logout.do") //로그아웃
    public String logout(Model model) throws Exception{
		String id = (String) session.getAttribute("sessionId");
		String name = (String) session.getAttribute("sessionName");
		String nick = (String) session.getAttribute("sessionNick");
		String ustatus = (String) session.getAttribute("sessionUstatus");
		
		session.removeAttribute(id);
		session.removeAttribute(name);
		session.removeAttribute(nick);
		session.removeAttribute(ustatus);
		
		session.invalidate();

        return "/main";
    }
		
	@RequestMapping(value = "/login/validate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String validateId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.validateUser(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			session.setAttribute("sessionId", user.getId());
			session.setAttribute("sessionName", user.getName());
			session.setAttribute("sessionNick", user.getNick());
			session.setAttribute("sessionUstatus", user.getUstatus());
		}
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
	
	@RequestMapping(value = "/login/addAccount.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addAccount(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		loginservice.addId(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/addr.do") //주소 찾기 페이지
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/jusoPopup";
    }
	
	@RequestMapping("/findId.do") //아이디 찾기
    public String findId(Model model) throws Exception{

        return "/find_id";
    }
	
	@RequestMapping("/findPw.do") //비밀번호 찾기
    public String findPw(Model model) throws Exception{

        return "/find_pw";
    }
	
	@RequestMapping(value = "/find/id.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUserId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.searchUserId(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/find/validate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.searchQuiz(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/find/quiz.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findQuiz(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.contrastQuiz(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/find/reset.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resetPwd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = loginservice.changePwd(map);
		return new Gson().toJson(resultMap);
	}
	

}
