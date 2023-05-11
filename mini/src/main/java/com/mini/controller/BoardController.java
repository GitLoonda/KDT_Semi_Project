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
import com.mini.service.BoardService;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

	@RequestMapping("/trade.do") //거래게시판 페이지
    public String trade(Model model) throws Exception{

        return "/trade_list";
    }
    //게시판 리스트 불러오기
    @RequestMapping(value = "/trade/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTbrdListInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
        int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
        map.put("startNum", startNum);
        map.put("lastNum", lastNum);
        
		resultMap = boardService.searchTbrdListInfo(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

    //거래 등록 게시판
    @RequestMapping("/tradeadd.do") //거래게시판 페이지
    public String tradeadd(Model model) throws Exception{

        return "/trade_add";
    }
    //게시판 리스트 불러오기
    @RequestMapping(value = "/trade/option.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTbrdCateList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchTbrdCateList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}




	@RequestMapping("/request.do") //의뢰게시판 페이지
    public String request(Model model) throws Exception{

        return "/req_list";
    }
	
	@RequestMapping("/promote.do") //홍보게시판 페이지
    public String promote(Model model) throws Exception{

        return "/prom_list";
    }
	
	@RequestMapping("/community.do") //커뮤니티 페이지
    public String community(Model model) throws Exception{

        return "/comm_list";
    }
	


}
