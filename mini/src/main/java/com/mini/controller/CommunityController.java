package com.mini.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.mini.service.CommunityService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/comm.do") //커뮤니티 게시판 메인
    public String main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("mainlist", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
        request.setAttribute("sessionNick", session.getAttribute("sessionNick"));
		request.setAttribute("sessionAdminflg", session.getAttribute("sessionAdminflg"));

        return "/comm_list";
    }
	
	//리스트
	@RequestMapping(value = "/comm/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = communityService.searchCbrdList(map);
		resultMap.put("result","success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/commadd.do") //커뮤니티 글쓰기
    public String insert(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
        request.setAttribute("sessionNick", session.getAttribute("sessionNick"));
		request.setAttribute("sessionAdminflg", session.getAttribute("sessionAdminflg"));

        return "/comm_add";
    }
	
	//글쓰기
	@RequestMapping(value = "/comm/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.addCbrd(map);
        resultMap.put("cbno",map.get("cbno"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	 @RequestMapping("/comm/upload.dox")
     // 여러개 MultipartFile files[] 형식으로 받음
	    public String result(@RequestParam("files") MultipartFile files[], @RequestParam("cbno") int cbno, HttpServletRequest request,HttpServletResponse response, Model model)
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
                 String path3 = "\\src\\main\\webapp\\img\\comm\\";

                 System.out.println("Working Directory = " + path2 + path3 +String.valueOf(cbno)+"\\");
                 
                 System.out.println(path2+path3);

                 // 디비 파일 경로
                 String setpath="img/comm/"+String.valueOf(cbno)+"/"+saveFileName;
                 System.out.println(setpath);

                 if(!multi.isEmpty())
                 {
                     // 파일저장경로설정
                     File forder= new File(path2+path3+String.valueOf(cbno));
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

                     File file = new File(path2+path3+String.valueOf(cbno)+"\\", saveFileName);

                     multi.transferTo(file);
                     
                     HashMap<String, Object> map = new HashMap<String, Object>();
                     if(i==0){
                         map.put("rep", "Y");
                         map.put("path", setpath);
                         map.put("cbno", cbno);
                     }else{
                         map.put("rep", "N");
                         map.put("path", setpath);
                         map.put("cbno", cbno);
                     }
                     
                     
                     // insert 쿼리 실행
                     communityService.CommImgInsert(map);

                     model.addAttribute("filename", multi.getOriginalFilename());
                     model.addAttribute("uploadPath", file.getAbsolutePath());
                     
                     
                 }
             }catch(Exception e) {
                 System.out.println(e);
             }
         }
         
	        return "redirect:comm.do";
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


	
	
	//카테고리 전체 분류
    @RequestMapping(value = "/comm/cate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdCateList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrdCateList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//카테고리 1 분류
    @RequestMapping(value = "/comm/cate1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdCate1List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrdCate1List(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
  //카테고리 2 분류
    @RequestMapping(value = "/comm/cate2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCbrdCate2List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrdCate2List(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/commread.do") //커뮤니티 글 상세
    public String read(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
        request.setAttribute("sessionNick", session.getAttribute("sessionNick"));
		request.setAttribute("sessionAdminflg", session.getAttribute("sessionAdminflg"));
        return "/comm_read";
	}
	
	// 글 상세
	@RequestMapping(value = "/comm/read.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = communityService.searchCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/commedit.do") //커뮤니티 글 수정
    public String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
        request.setAttribute("sessionNick", session.getAttribute("sessionNick"));
		request.setAttribute("sessionAdminflg", session.getAttribute("sessionAdminflg"));
        return "/comm_edit";
    }
	
	// 글 수정
	@RequestMapping(value = "/comm/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.editCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 글 삭제
	@RequestMapping(value = "/comm/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.removeCbrd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	//게시글 신고 팝업
	@RequestMapping("/reportboard.do")
    public String pop() {
		return "/report_board";
	}
	
	//댓글 신고 팝업
		@RequestMapping("/reportcomment.do")
		public String pop2() {
			return "/report_comment";
		}
	
	//댓글 작성
	@RequestMapping(value = "/comm/comment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String comment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		 String commf = String.valueOf(map.get("comms"));
	        if(commf.equals("true")){
	            map.put("comms","Y");
	        }else{
	            map.put("comms","N");
	        }
	        
		communityService.addCbrdComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//게시글 댓글 리스트
    @RequestMapping(value = "/comment/commlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchCommInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        resultMap = communityService.selectCommentList(map);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }
	
	//댓글 삭제
	@RequestMapping(value = "/comment/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.removeComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//댓글 수정
	@RequestMapping(value = "/comment/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		communityService.editComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//대댓글 
		@RequestMapping(value = "/comment/reply.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String cReply(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();

			return new Gson().toJson(resultMap);
		}
	
	
	
	

}
