package com.kosa.pro1.notice.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro1.member.domain.MemberDTO;
import com.kosa.pro1.notice.domain.NoticeDTO;
import com.kosa.pro1.service.NoticeService;
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

		// 공지사항 목록 출력
	    @RequestMapping(value = "/list")
	    public String list(NoticeDTO notice, Model model)throws Exception {
	    
	    	try {
	    		model.addAttribute("result", noticeService.noticePageList(notice));
	    		} catch (Exception e) {
	            // 예외를 적절하게 처리하세요
	            e.printStackTrace();
	        }
	        // 공지 목록을 표시할 JSP 페이지의 이름을 반환합니다.
	        return "notice/list"; // JSP 파일이 "/WEB-INF/views/notice/list.jsp"에 위치한다고 가정합니다.
	    }
	
	    
	    
	    // 공지사항 등록
	    @ResponseBody
	    @RequestMapping(value = "/insert", method = RequestMethod.POST)
	    public Map<String, Object> insertNotice(@RequestBody NoticeDTO notice) throws Exception {
	    	System.out.println("게시글 등록: " + notice);
	    	
//			MemberDTO loginMember = (MemberDTO)Session.getAttribute("loginMember");
			
	        Map<String, Object> resultMap = new HashMap<>();

	        if (noticeService.insertNotice(notice)) {
	            resultMap.put("message", "등록에 성공했습니다!");
	        } else {
	            resultMap.put("message", "등록에 실패했습니다.");
	        }
	        return resultMap;
	    }
	    
	    // 공지사항 상세보기
	    @ResponseBody
	    @RequestMapping(value = "/detail", method = RequestMethod.POST)
	    public NoticeDTO detail(@RequestBody NoticeDTO notice) throws Exception {
	        System.out.println("공지사항 상세보기 컨트롤러");
	        	
	       NoticeDTO detail=noticeService.getNotice(notice.getNoticeid()); //변수선언
	       
	       noticeService.viewCount(notice.getNoticeid());
	        return detail;
	    }
 
	    // 공지사항 수정하기
	    @ResponseBody
	    @RequestMapping(value = "/revice", method = RequestMethod.POST)
	    public Map<String, Object> revice(@RequestBody NoticeDTO notice) throws Exception {
	    	NoticeDTO revice=noticeService.getNotice(notice.getNoticeid());
	    	
	    	Map<String, Object> result =new HashMap<>();
	    	
	    	  if (noticeService.noticeUpdate(notice)) {
	    		  result.put("message", "등록에 수정에 성공했습니다!");
		        } else {
		        	result.put("message", "등록에 실패했습니다.");
		        }
	    	  
	    	  System.out.println("고정을 해야하는데");
	    	  
	    	  
	    	  return result;
	    }
	    
	    // 공지사항 삭제하기
	    @ResponseBody
	    @RequestMapping(value = "/delete", method = RequestMethod.POST)
	    public Map<String, Object> delete(@RequestBody NoticeDTO notice) throws Exception {
	    	Map<String, Object> result =new HashMap<>();
	    	
	    	  if (noticeService.noticeDelete(notice.getNoticeid())) {
	    		  result.put("message", "삭제가 완료했습니다!");
		        } else {
		        	result.put("message", "삭제에 실패했습니다.");
		        }
	
	    	  return result;
	    }   
}
	    
//	    @ResponseBody
//	    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
//	    public String deleteNotices(@RequestParam("noticeids") List<Integer> noticeIds,
//	                                HttpServletRequest req, HttpServletResponse res) throws Exception {
//	        JSONObject jsonResult = new JSONObject();
//
//	        boolean status = noticeService.deleteNotices(noticeIds);
//
//	        jsonResult.put("status", status);
//	        jsonResult.put("message", status ? "글이 삭제되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
//
//	        return jsonResult.toString();
//	    } 
//	    
	    
	    
	 // 다중 선택 삭제
//	    @ResponseBody
//	    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
//	    public String deleteNotices(@RequestParam("noticeids") String[] noticeids, HttpServletRequest req, HttpServletResponse res) throws Exception {
//	        System.out.println("board.controller.deleteNotices() invoked.");
//	        JSONObject jsonResult = new JSONObject();
//	        
//	        // HashMap을 사용하여 데이터를 저장
//	        HashMap<String, Object> params = new HashMap<>();
//	        params.put("noticeids", Arrays.asList(noticeids));
//	        
//	        boolean status = noticeService.deletenotices(params); // 서비스 메서드 호출
//	        
//	        jsonResult.put("status", status);
//	        jsonResult.put("message", status ? "글이 삭제되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
//	        
//	        return jsonResult.toString();
//	    }

	    
	
	    