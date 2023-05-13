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

    //말머리 불러오기
    @RequestMapping(value = "/trade/setkind.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTbrdkindList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchTbrdkindList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

    //카테고리2 불러오기
    @RequestMapping(value = "/trade/optioncate2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTbrdCate2List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchTbrdCate2List(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

    //지역 리스트2 불러오기
    @RequestMapping(value = "/trade/optionlocal2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchTbrdlocal2List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();

    resultMap = boardService.searchTbrdlocal2List(map);
        resultMap.put("result", "success");
    return new Gson().toJson(resultMap);
    }

    //지역 리스트3 불러오기
    @RequestMapping(value = "/trade/optionlocal3.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchTbrdlocal3List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap = boardService.searchTbrdlocal3List(map);
        resultMap.put("result", "success");
    return new Gson().toJson(resultMap);
    }
    
    //사용자 정보 연락처,이메일 불러오기
    @RequestMapping(value = "/trade/userinfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUserInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchUserInfo(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    //게시글 등록
    @RequestMapping(value = "/trade/insert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String TradeInsert(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.TradeInsert(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}

    //게시글등록 후 게시글번호 호출
    @RequestMapping(value = "/trade/insertTbno.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchAddTbno(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int tbno = boardService.searchAddTbno(map); 
        System.out.println(tbno);
        resultMap.put("tbno", tbno);
        resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    //게시글 이미지 등록
    
    @RequestMapping(value = "/trade/insertImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String AddTradeImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String repck = String.valueOf(map.get("repck"));
        if(repck.equals("true")){
            map.put("rep","Y");
        }else{
            map.put("rep","N");
        }
        boardService.TradeImgInsert(map);
		resultMap.put("message", "성공");
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
