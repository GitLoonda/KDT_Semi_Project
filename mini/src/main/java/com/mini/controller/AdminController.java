package com.mini.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.mini.model.Board;
import com.mini.model.Comm;
import com.mini.model.Comment;
import com.mini.model.Notice;
import com.mini.model.User;
import com.mini.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/admin/login.do") //어드민 메인
    public String admin(Model model) throws Exception{ 
		
		String id = (String) session.getAttribute("sessionId");
		String name = (String) session.getAttribute("sessionName");
		String status = (String) session.getAttribute("sessionUstatus");
		
		session.removeAttribute(id);
		session.removeAttribute(name);
		session.removeAttribute(status);
		
		session.invalidate();

        return "/admin_login";
    }
	
	@RequestMapping(value = "/admin/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = adminService.searchAdminInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			session.setAttribute("sessionId", user.getId());
			session.setAttribute("sessionName", user.getName());
			session.setAttribute("sessionUstatus", user.getUstatus());
		}
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/admin/join.do") //어드민 메인
	public String admin_join(Model model) throws Exception{
		
		return "/admin_join";
	}
	
	@RequestMapping(value = "/admin/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.addAdmin(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/quiz.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_quiz(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> quizList = adminService.searchQuiz(map);
		resultMap.put("quizList", quizList);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = adminService.searchAdminCnt(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/admin/find.do") //어드민 메인
	public String admin_find(Model model) throws Exception{
		
		return "/admin_find";
	}
	
	@RequestMapping(value = "/admin/find.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String find(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		resultMap = adminService.searchUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			session.setAttribute("sessionId", user.getId());
			session.setAttribute("sessionEmail", user.getEmail());
			session.setAttribute("sessionPasswd", user.getPasswd());
		}
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/admin/findpasswd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String match(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = adminService.findPasswd(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
		}
		return new Gson().toJson(resultMap);
	}

	@RequestMapping("/admin/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/admin_addrPopup";
    }
	
	@RequestMapping("/admin/main.do") //어드민 메인
	public String admin_main(HttpServletRequest request, Model model) throws Exception{
		
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionUstatus", session.getAttribute("sessionUstatus"));
		
		return "/admin_main";
	}
	
	@RequestMapping(value = "/admin/main.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_main(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Notice> list = adminService.recogCreator(map);
		int cnt = adminService.blackCnt(map);
		int recogCnt = adminService.recogCnt(map);
		int adminCnt = adminService.adminCnt(map);
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		resultMap.put("recogCnt", recogCnt);
		resultMap.put("adminCnt", adminCnt);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/recogCreator.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String recogCreator(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	    adminService.updateStatusCreator(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/admin/blacklist.do") //어드민 메인
	public String admin_blacklist(Model model) throws Exception{
		
		return "/admin_blacklist";
	}
	
	@RequestMapping(value = "/admin/blacklist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_blacklist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Notice> list = adminService.blackList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/blacklist/ban.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String blacklist_ban(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	    adminService.updateBlackBan(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/admin/manage.do") //어드민 메인
	public String admin_manage(Model model) throws Exception{
		
		return "/admin_manage";
	}
	
	@RequestMapping(value = "/admin/manage.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_manage(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		
		List<Notice> list = adminService.userForAdmin(map);
		int cnt = adminService.adminUserCnt(map);
		
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/recogAdmin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_recogAdmin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.recogAdmin(map);
		resultMap.put("message", "성공이다");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/admin/board.do") //어드민 메인
	public String admin_board(Model model) throws Exception{
		
		return "/admin_board";
	}
	
	@RequestMapping(value = "/admin/boardlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_boardlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		
		int cnt = adminService.boardCnt(resultMap);
		int commCnt = adminService.commCnt(resultMap);
		
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		
		List<Board> list = adminService.adminBoardList(map);
		List<Comm> commList = adminService.adminCommList(map);
		
		resultMap.put("list", list);
		resultMap.put("commList", commList);
		resultMap.put("cnt", cnt);
		resultMap.put("commCnt", commCnt);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/boardlist/blind.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_blind(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminBoardBlind(map);
		resultMap.put("message", "블라인드완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/boardlist/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminBoardRemove(map);
		resultMap.put("message", "게시글삭제완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/admin/boardlist/commBlind.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_commBlind(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminCommBlind(map);
		resultMap.put("message", "커뮤니티블라인드완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/admin/comment.do") //어드민 메인
	public String admin_comment(Model model) throws Exception{
		
		return "/admin_comment";
	}
	
	@RequestMapping(value = "/admin/comment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_comment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		
		int cnt = adminService.boardCommentCnt(resultMap);
		int commCnt = adminService.commCommentCnt(resultMap);
		
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		
		List<Comment> commentList = adminService.adminCommentList(map);
		List<Comment> commentList2 = adminService.adminCommentList2(map);
		
		resultMap.put("commentList", commentList);
		resultMap.put("commentList2", commentList2);
		
		resultMap.put("cnt", cnt);
		resultMap.put("commCnt", commCnt);
		
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 삭제(블라인드)
	@RequestMapping(value = "/admin/comment/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admin_commentRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminCommentRemove(map);
		resultMap.put("message", "성성공공");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping("/notice.do") //공지사항 페이지
    public String notice(Model model) throws Exception{
		
        return "/notice";
    }
	
	
	
	@RequestMapping(value = "/notice.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String noticeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
	    int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
	    
        map.put("startNum", startNum);
        map.put("lastNum", lastNum);
        
		List<Notice> list = adminService.searchNoticeList(map);
		int noticeCnt = adminService.noticeCnt(map);
		
		resultMap.put("list", list);
		resultMap.put("noticeCnt", noticeCnt);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/notice/info.do") 
    public String read(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionUstatus", session.getAttribute("sessionUstatus"));
        return "/notice_info";
    }
	
	@RequestMapping(value = "/notice/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String notice_info(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = adminService.searchNotice(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/notice/insert.do") 
    public String insert(Model model) throws Exception{

        return "/notice_insert";
    }
	
	@RequestMapping(value = "/notice/insert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String notice_insert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("id", session.getAttribute("sessionId"));
		adminService.addNotice(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	// 수정
	@RequestMapping("/modify.do") 
    public String modify(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/notice_edit";
    }
	
	// 게시글 삭제
	@RequestMapping(value = "/notice/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String notice_remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.deleteNotice(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/notice/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String notice_edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.editNotice(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/upload.do")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardIdx") int boardIdx, HttpServletRequest request,HttpServletResponse response, Model model)
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
            System.out.println("Working Directory = " + path2 + "src\\webapp\\img");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\img\\" + saveFileName);
                map.put("boardIdx", boardIdx);
                
                // insert 쿼리 실행
                //	        		insertBoardImg(map); 
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:board.do";
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
