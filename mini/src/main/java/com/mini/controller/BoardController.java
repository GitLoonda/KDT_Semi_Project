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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    @Autowired
	HttpSession session;
    
    //거래게시판 페이지
	@RequestMapping("/trade.do") 
    public String trade(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        System.out.println(session.getAttribute("cate1"));
        System.out.println(session.getAttribute("cate2"));
        System.out.println(session.getAttribute("cate3"));
        map.put("cate1",session.getAttribute("cate1"));
        map.put("cate1",session.getAttribute("cate2"));
        map.put("cate1",session.getAttribute("cate3"));

        System.out.println(session.getAttribute("option"));
        System.out.println(session.getAttribute("keyword"));
        
        request.setAttribute("def", map);
        
        return "/trade_list";
    }
    //게시글 상세
	@RequestMapping("/tradeview.do") 
    public String tradeview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        request.setAttribute("trlist", map);
        return "/trade_view";
    }
    // trade.do
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
    
    // tradeadd.do
    //거래 등록 게시판
    @RequestMapping("/tradeadd.do") //거래게시판 페이지
    public String tradeadd(Model model) throws Exception{

        return "/trade_add";
    }

    //게시판 선택값 가져오기
    @RequestMapping(value = "/trade/option.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTbrdCateList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchTbrdCateList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

    //게시판에 맞는 말머리 불러오기
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
		resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}

    //게시글등록 후 게시글번호 호출
    @RequestMapping(value = "/trade/insertTbno.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchAddTbno(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int tbno = boardService.searchAddTbno(map); 
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

    //tradeview.do
    

    //게시글 리스트 불러오기
    @RequestMapping(value = "/tradeView/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchTbrdInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap = boardService.searchTbrdInfo(map);
    resultMap.put("result", "success");
    return new Gson().toJson(resultMap);
    }
    // 거래상태변경
    @RequestMapping(value = "/tradeView/bstupdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String Tbrdbstupdate(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        boardService.Tbrdbstupdate(map);
        resultMap.put("message", "성공");
        return new Gson().toJson(resultMap);
    }
    // 게시글 찜 갯수
    @RequestMapping(value = "/tradeView/jjimcnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchjimcnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int jimsum = boardService.searchjimcnt(map); 
        resultMap.put("jimsum",jimsum);
        resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    //찜 등록
    @RequestMapping(value = "/tradeView/jjimin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String Jjiminsert(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        boardService.Jjiminsert(map);
        resultMap.put("message", "성공");
        return new Gson().toJson(resultMap);
    }
    //찜 해제
    @RequestMapping(value = "/tradeView/jjimout.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String Jjimdelete(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        boardService.Jjimdelete(map);
        resultMap.put("message", "성공");
        return new Gson().toJson(resultMap);
    }
    

    //게시글 삭제
    
    @RequestMapping(value = "/tradeView/BrdDel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String BrdDelete(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        boardService.BrdDelete(map);
        resultMap.put("message", "성공");
        return new Gson().toJson(resultMap);
    }
    //게시글 댓글입력
    @RequestMapping(value = "/tradeView/commin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String TbrdcommInsert(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        boardService.TbrdcommInsert(map);
        resultMap.put("message", "성공");
        return new Gson().toJson(resultMap);
    }
    //게시글 댓글 리스트
    @RequestMapping(value = "/tradeView/commlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchCommInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap = boardService.searchCommInfo(map);
    resultMap.put("result", "success");
    return new Gson().toJson(resultMap);
    }
    
	


}
