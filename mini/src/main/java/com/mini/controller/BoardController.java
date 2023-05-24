package com.mini.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestScope;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.mini.service.BoardService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        
        // 중고거래,제작의뢰 클릭시 게시글리스트 이동
        // 다른페이지에서 접근시 null로 날라와서 아래와같이 적용
        System.out.println(map);
        String brdF = String.valueOf(map.get("brdflg"));
        if(brdF.equals("2") || brdF.equals("BF2") ){
            map.put("brdflg","BF2");
        }else{
            map.put("brdflg","BF1");
        }
        String kinF = String.valueOf(map.get("kind"));
        if(kinF.equals("1")){
            map.put("kind","KI1");
        }else if(kinF.equals("2")){
            map.put("kind","KI2");
        }else if(kinF.equals("3")){
            map.put("kind","KI3");
        }
        request.setAttribute("mainlist", map);
        return "/trade_list";
    }
    //게시글 상세
	@RequestMapping("/tradeview.do") 
    public String tradeview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("trlist", map);
        List<String> recentList =  (List<String>) session.getAttribute("recentList");
        String temp = map.values().toString().replaceAll("[^0-9]", "");
        if(recentList == null) {
        	List<String> list = new ArrayList<String>();
        	list.add((String) map.get("tbno"));
        	recentList = list;
        } else {
        	for(int i=0; i < recentList.size(); i++) {
        		if(!recentList.get(i).equals(temp)) {
        			recentList.add((String) map.get("tbno"));
        		}
        	}
        }
        session.setAttribute("recentList", recentList);
        
        return "/trade_view";
    }
    
    //거래 등록 게시판
    @RequestMapping("/tradeadd.do") //거래게시판 페이지
    public String tradeadd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        request.setAttribute("brdfig", map.get("abrdfig"));
        return "/trade_add";
    }
    //거래글 수정
    @RequestMapping("/tradeeidt.do") 
    public String tradeedit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
       
        request.setAttribute("tbno",map.get("tbno"));
        return "/trade_edit";
    }
    // 거래자 설정
    @RequestMapping("/tradeset.do") 
    public String tradeset(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        
        return "/trade_set";
    }
    // 거래평점
    @RequestMapping("/usergrade.do") 
    public String usergrade(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        
        return "/user_grade";
    }
    // 댓글신고
    // 신고
    @RequestMapping("/contban.do") 
    public String commban(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        
        return "/report_cont";
    }

    // trade.do
    //게시판 리스트 불러오기
    @RequestMapping(value = "/trade/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTbrdListInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        System.out.println(map);

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

        resultMap.put("tbno",map.get("tbno"));
		resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}
    @RequestMapping("/fileUpload.dox")
        // 여러개 MultipartFile files[] 형식으로 받음
	    public String result(@RequestParam("files") MultipartFile files[], @RequestParam("tbno") int tbno, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
            // 파일갯수만큼 반복
            for(int i=0;i<files.length;i++){

                MultipartFile multi=files[i];
                String url = null;
                String path="c:\\img";
                System.out.println(path);
                
                try {
        
                    //String uploadpath = request.getServletContext().getRealPath(path);

                    String uploadpath = path;
                    String originFilename = multi.getOriginalFilename();
                    String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
                    long size = multi.getSize();
                    String saveFileName = genSaveFileName(extName);

                    System.out.println("uploadpath : " + uploadpath);
                    System.out.println("originFilename : " + originFilename);
                    System.out.println("extensionName : " + extName);
                    System.out.println("size : " + size);
                    System.out.println("saveFileName : " + saveFileName);
                    
                    String path2 = System.getProperty("user.dir");
                    String path3 = "\\src\\main\\webapp\\img\\board\\";

                    System.out.println("Working Directory = " + path2 + path3 +String.valueOf(tbno)+"\\");
                    
                    System.out.println(path2+path3);

                    // 디비 파일 경로
                    String setpath="img/board/"+String.valueOf(tbno)+"/"+saveFileName;
                    System.out.println(setpath);

                    if(!multi.isEmpty())
                    {
                        // 파일저장경로설정
                        File forder= new File(path2+path3+String.valueOf(tbno));
                        forder.mkdir();
                        System.out.println(forder);
                        // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
                        if (!forder.exists()) {
                            try{
                                forder.mkdir(); //폴더 생성합니다.
                                System.out.println("폴더가 생성되었습니다.");
                                } 
                                catch(Exception e){
                                e.getStackTrace();
                            }        
                            }else {
                            System.out.println("이미 폴더가 생성되어 있습니다.");
                        }

                        File file = new File(path2+path3+String.valueOf(tbno)+"\\", saveFileName);

                        multi.transferTo(file);
                        
                        HashMap<String, Object> map = new HashMap<String, Object>();
                        if(i==0){
                            map.put("rep", "Y");
                            map.put("path", setpath);
                            map.put("tbno", tbno);
                        }else{
                            map.put("rep", "N");
                            map.put("path", setpath);
                            map.put("tbno", tbno);
                        }
                        
                        
                        // insert 쿼리 실행
                        boardService.TradeImgInsert(map);

                        model.addAttribute("filename", multi.getOriginalFilename());
                        model.addAttribute("uploadPath", file.getAbsolutePath());
                        
                        
                    }
                }catch(Exception e) {
                    System.out.println(e);
                }
            }
            
	        return "redirect:trade.do";
	    }


        // 현재 시간을 기준으로 파일 이름 생성
	    private String genSaveFileName(String extName) {
	        String fileName = "";
	        
	        Calendar calendar = Calendar.getInstance();
	        fileName += calendar.get(Calendar.YEAR);
	        fileName += calendar.get(Calendar.MONTH);
	        fileName += calendar.get(Calendar.DATE);
	        fileName += calendar.get(Calendar.HOUR);
	        fileName += calendar.get(Calendar.MINUTE);
	        fileName += calendar.get(Calendar.SECOND);
	        fileName += calendar.get(Calendar.MILLISECOND);
	        fileName += extName;
	        
	        return fileName;
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

    // 평점 불러오기
    @RequestMapping(value = "/tradeView/grdinfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchgrdinfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap=boardService.searchgrdinfo(map);

    resultMap.put("result", "success");
    return new Gson().toJson(resultMap);
    }


    @RequestMapping(value = "/tradeView/ncik.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchNick(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap = boardService.searchNick(map);
    
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

        String commf = String.valueOf(map.get("comms"));
        if(commf.equals("true")){
            map.put("comms","Y");
        }else{
            map.put("comms","N");
        }

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

    //게시글 댓글 수정
    @RequestMapping(value = "/tradeView/commedit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateComm(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        boardService.updateComm(map);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }
    //게시글 댓글 삭제
    
    @RequestMapping(value = "/tradeView/commDel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delcomm(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        boardService.delcomm(map);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }

    // tradeeidt.do
	// 게시판 수정 리스트 불러오기
    @RequestMapping(value = "/tradeedit/viewlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchviewlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap = boardService.searchviewlist(map);
    resultMap.put("result", "success");
    return new Gson().toJson(resultMap);
    }
    // 게시판에 등록된 이미지 리스트 가져오기
    @RequestMapping(value = "/tradeedit/viewfilelist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchviewfilelist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap = boardService.searchviewfilelist(map);
    resultMap.put("result", "success");
    return new Gson().toJson(resultMap);
    }
    
    //이미지 삭제
    @RequestMapping(value = "/tradeedit/viewfileDel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewfileDel(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.viewfileDel(map);
		resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}

    //게시글 업데이트
    @RequestMapping(value = "/trade/update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tradeupdate(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.tradeupdate(map);

        resultMap.put("tbno",map.get("tbno"));
		resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}
    // 리뷰 등록
    @RequestMapping(value = "/tradeView/reviewin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String reviewInsert(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        boardService.reviewInsert(map);
        resultMap.put("message", "성공");
        return new Gson().toJson(resultMap);
    }

    // 리뷰리스트 불러오기
    
    @RequestMapping(value = "/tradeView/reviewlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchreviewlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        resultMap = boardService.searchreviewlist(map);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }

    // tradeset.do
    // 댓글사용자 리스트 불러오기
    @RequestMapping(value = "/tradeSet/commlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchSCommInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        resultMap = boardService.searchSCommInfo(map);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }
    // 거래자 선택 적용
    
    @RequestMapping(value = "/tradeSet/fntradeset.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tradeset(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.tradeset(map);
		
        resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}
    
    // usergrade.do
    //  평점등록
     @RequestMapping(value = "/tradeGrd/fngrdset.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String fngrdset(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.fngrdset(map);
        resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}

    // reportboard.do
    @RequestMapping(value = "/report/banlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchbanlist(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchbanlist(map);
        
        resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}
    
    @RequestMapping(value = "/report/baninsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String banInsert(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.banInsert(map);
        resultMap.put("result", "성공");
		return new Gson().toJson(resultMap);
	}
}
