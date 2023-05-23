package com.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mini.service.MainService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	HttpSession session;

	@RequestMapping("/main.do") //메인페이지
    public String main(Model model) throws Exception{
		
        return "/main";
    }
	
	@RequestMapping(value = "/main/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchInitList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("category" , mainService.searchInitialList(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/main/rcmd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchRcmmList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("rec", mainService.searchRcmdList(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/recent.do") //메인페이지
    public String recent(Model model) throws Exception{
		
        return "/recent_list";
    }
	
	@RequestMapping(value = "/main/recentList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findRecentList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("recentList", (List<String>) session.getAttribute("recentList"));
		resultMap.put("list", mainService.searchRecentList(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/main/recentDel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteRecentItem(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<String> list  = (List<String>) session.getAttribute("recentList");
		String temp = map.values().toString().replaceAll("[^0-9]", "");
		if(!list.isEmpty()) {
			for(int i=0; i < list.size(); i++) {
				System.out.println("2 " + list.get(i));
				System.out.println("2 " + temp);
				if(list.get(i).equals(temp)) {
					list.remove(i);
				}
			}
			session.setAttribute("recentList", list);
		}
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/jjim.do") //메인페이지
    public String jjim(Model model) throws Exception{
		
        return "/jjim_list";
    }
	
	@RequestMapping("/denied.do") //메인페이지
    public String deny(Model model) throws Exception{
		
        return "/access_denied";
    }
	
	@RequestMapping(value = "/main/jjimList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findJjimList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", mainService.searchJjimList(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/main/jjimDel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String jjimDel(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		mainService.removeJjim(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
}