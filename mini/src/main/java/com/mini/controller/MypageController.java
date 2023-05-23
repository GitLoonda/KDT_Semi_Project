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
import com.mini.model.Mypg;
import com.mini.service.MypageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
	public String hugi(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Mypg mypg = mypageService.getUserPro(map);
		resultMap.put("mypg", mypg);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
    @RequestMapping("/mypage/upload.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("id") String id, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
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
            System.out.println("Working Directory = " + path2 + "src\\webapp\\img\\mypage");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img\\mypage", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\img\\mypage\\" + saveFileName);
                map.put("id", id);
                
                // insert 쿼리 실행
                mypageService.addMyPageImg(map); 
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:main.do";
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
    

    

}