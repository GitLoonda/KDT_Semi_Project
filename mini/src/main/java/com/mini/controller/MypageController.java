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
import com.mini.model.Mypg;
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
	@RequestMapping("/useredit.do") //사용자프로필 수정
    public String User_edi2t(Model model) throws Exception{

        return "/User_edit";
	}
	@RequestMapping("/creedit.do") //크리에이터 프로필 수정
    public String Creator_edit(Model model) throws Exception{

        return "/Creator_edit";
    }
	@RequestMapping("/creadd.do") //크리에이터 등록
    public String creator_add(Model model) throws Exception{

        return "/creator_add";
    }
	
	// 프로필 아이디/주소 불러오기
    @RequestMapping(value = "/user/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String info1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Mypg mypg = mypageService.getUserInfo(map);
		resultMap.put("mypg", mypg);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	} 
    
  //프로필 하단 정보 수정/업데이트
    @RequestMapping(value = "/mypage/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String up1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Mypg mypg = mypageService.getProDown(map);
		resultMap.put("mypg", mypg);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
  // 크리에이터 요청
    @RequestMapping(value = "/user/creadd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String creadd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Mypg mypg = mypageService.upcreadd(map);
		resultMap.put("mypg", mypg);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	} 
    
    // 프로필에서 후기 , 커뮤니티작성글 , 찜목록 , 등록제품 불러오기
    
    @RequestMapping(value = "/user/hugi.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String hugi1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.getUserPro(map);
		resultMap.put("result","success");
		return new Gson().toJson(resultMap);
	}
    

    

}