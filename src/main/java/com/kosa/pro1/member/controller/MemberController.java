 package com.kosa.pro1.member.controller;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro1.HomeController;
import com.kosa.pro1.member.domain.MemberDTO;
import com.kosa.pro1.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    
    // 회원가입
    
    @ResponseBody
    @RequestMapping(value="/register",method=RequestMethod.POST )
    public Map<String, Object> register(@RequestBody MemberDTO member) throws Exception{
       // 회원 가입 정보 출력
    	System.out.println("회원가입: " + member);
    	
        Map<String, Object> resultMap = new HashMap<>();
        
        
        // 회원 가입 요청을 처리하고 결과를 resultMap에 저장
        
        if (memberService.register(member)) {
        	resultMap.put("status", true);
        	resultMap.put("message", "회원 가입에 성공했습니다");
        } else {
        	resultMap.put("status", false);
        	resultMap.put("message", "회원 가입에 실패했습니다");
        }
        return resultMap;
    }

    
    //아이디 중복 확인
    @ResponseBody
    @RequestMapping(value = "/checkId", method = RequestMethod.POST)
    public Map<String, Object> checkId(@RequestBody MemberDTO member ) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
           
        // 아이디 중복 확인 요청을 처리하고 결과를 resultMap에 저장
        
        if (memberService.checkId(member)) {
            // 아이디가 중복되는 경우
            resultMap.put("status", false);
            resultMap.put("message", "이미 사용 중인 아이디입니다. 다른 아이디를 입력하세요.");
        } else {
            // 아이디가 중복되지 않는 경우
            resultMap.put("status", true);
            resultMap.put("message", "사용 가능한 아이디입니다.");
        }
        
        return resultMap;
    }

    // 로그인 
    @ResponseBody
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public Map<String, Object> login(@RequestBody MemberDTO member,HttpServletRequest req) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
    	System.out.println("로그인: " + member);
        
    	HttpSession session = req.getSession();
    	MemberDTO loginMember = memberService.login(member);
    	
        // 로그인 요청을 처리하고 결과를 resultMap에 저장
    	
        if (loginMember != null) {
            // 로그인 성공
        	session.setAttribute("loginMember", loginMember);
            resultMap.put("status", true);
            resultMap.put("message", "로그인 성공!");
            resultMap.put("loginMember", member); // 로그인한 회원 정보를 전달

        } else {
            // 로그인 실패
            resultMap.put("status", false);
            resultMap.put("message", "로그인 실패. 아이디 또는 비밀번호가 잘못되었습니다.");
        }
        
        return resultMap; //"redirect:/login.do";
    }
    
  
    // 로그아웃
    
    @ResponseBody
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public Map<String, Object> logout(HttpServletRequest req) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        
        // 현재 세션을 무효화하여 로그아웃 처리
        HttpSession session = req.getSession(false); // 로그아웃 요청을 처리하고 결과를 resultMap에 저장 
        if (session != null) {
            session.invalidate(); // 로그아웃 처리.
        }
        
        resultMap.put("status", true);
        resultMap.put("message", "로그아웃되었습니다.");
        
        return resultMap;
    }

    
    // 아이디 찾기
    
    @ResponseBody
    @RequestMapping(value = "/findUserId", method = RequestMethod.POST)
    public Map<String, Object> findUserId(@RequestBody MemberDTO member) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();


        String email = member.getEmail(); 

    	System.out.println("이름 : " + member.getName());
    	System.out.println("이메일 : " + email);
        // 이메일을 기반으로 아이디를 찾는 비즈니스 로직 수행
        MemberDTO foundUserId = memberService.findId(member);
        System.out.println(foundUserId);
        if (foundUserId != null) {
            // 아이디를 찾은 경우
            resultMap.put("status", true);
            resultMap.put("message", "회원님의 아이디는 " + foundUserId.getUid() + "입니다.");
        } else {
            // 아이디를 찾지 못한 경우
            resultMap.put("status", false);
            resultMap.put("message", "해당 이메일로 등록된 아이디를 찾을 수 없습니다.");
        }

        return resultMap;
    }
    
    // 비밀번호 찾기

    @ResponseBody
    @RequestMapping(value = "/findPassword", method = RequestMethod.POST)
    public Map<String, Object> findUserPassword(@RequestBody  MemberDTO member) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        String uid = member.getUid(); // 요청에서 아이디를 가져옴
        String email = member.getEmail(); // 요청에서 이메일을 가져옴

        System.out.println(uid);
        System.out.println(email);
        
        MemberDTO foundUserPwd = memberService.findPassword(member);
        if (foundUserPwd != null) {
            resultMap.put("status", true);
            resultMap.put("message", "회원님의 비밀번호는 " + foundUserPwd.getPwd() + "입니다.");
        } else {
            // 사용자를 찾지 못한 경우
            resultMap.put("status", false);
            resultMap.put("message", "해당 아이디 또는 이메일로 비밀번호를 재설정할 수 없습니다.");
        }

        return resultMap;
    }

 
   
    // 수정하기 
    
    @ResponseBody
    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public Map<String, Object> updateProfile(@RequestBody MemberDTO member , HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
       
        session.setAttribute("loginMember", member);

        if (memberService.update(member)) {
            resultMap.put("status", true);
            resultMap.put("message", "정보 변경을 성공하였습니다");
        } else {
            resultMap.put("status", false);
            resultMap.put("message", "정보 변경을 실패하였습니다");
        }

        return resultMap;
    }

    // 탈퇴하기 
    
    @ResponseBody
    @RequestMapping(value = "/leaveMember", method = RequestMethod.POST)
    public Map<String, Object> leaveMember(@RequestBody MemberDTO member, HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

 
//        MemberDTO isDeleted = memberService.leave(loginMember);

        if (memberService.leave(member)) {
            resultMap.put("status", true);
            resultMap.put("message", "유저 탈퇴에 성공하였습니다");
        } else {
            resultMap.put("status", false);
            resultMap.put("message", "유저 탈퇴에 실패하였습니다");
        }

        return resultMap;
    }

	
//	public String loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("loginForm()");
//		return "member/loginForm.jsp";
//	}
//	
//	public String findIdForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("findIdForm()");
//		return "member/findIdForm.jsp";
//	}
//	
//	public String findPasswordForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("findPasswordForm()");
//		return "member/findPasswordForm.jsp";
//	}
//	
//	public String myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("myPage()");
//		return "member/myPage.jsp";
//	}
//	
//	public String register(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("register(): " + member);
//		JSONObject jsonResult = memberService.register(member);
//		return jsonResult.toString();
//	}
//	
//	
//	public String login(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		System.out.println("login(): " + member);
//		JSONObject jsonResult = memberService.login(member, session);
//		return jsonResult.toString();
//	}
//	
//	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("logout()");
//		HttpSession session = request.getSession();
//		JSONObject jsonResult = memberService.logout(session);
//		return jsonResult.toString();
//	}
//	
//	public String findId(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("findId(): " + member);
//		JSONObject jsonResult = memberService.findId(member);
//		return jsonResult.toString();
//	}
//	
//	public String findPassword(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("findPassword( ): " + member);
//		JSONObject jsonResult = memberService.findPassword(member);
//		return jsonResult.toString();
//	}
//	
//	public String update(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("update()");
//		HttpSession session = request.getSession();
//		JSONObject jsonResult = memberService.update(member, session);
//		return jsonResult.toString();
//	}
//	
//	public String leave(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("leave()");
//		HttpSession session = request.getSession();
//		JSONObject jsonResult = memberService.leave(session);
//		return jsonResult.toString();
//	}
//	
////	public String delete(memberDeletelds deleteIds, HttpServletRequest request, HttpServletResponse response) throws Exception {
////		System.out.println("delete(): " + deleteIds);
////		JSONObject jsonResult = memberService.delete(deleteIds);
////		return jsonResult.toString();
////	}
////	
//	
//	public String existUid(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("existUid()");
//		JSONObject jsonResult = memberService.existUid(member);
//		return jsonResult.toString();
//	}
//	
//	public String memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
//	      System.out.println("memberList()");
//	      System.out.println(memberService.getMemberAllList());
//
//	      try {
//	         request.setAttribute("memberList", memberService.getMemberAllList());
//	      } catch (Exception e) {
//	         e.printStackTrace();
//	      }
//
//	      return "member/memberList.jsp";
//
//	   }
	}

