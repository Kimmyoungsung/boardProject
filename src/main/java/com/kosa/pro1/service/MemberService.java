package com.kosa.pro1.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.pro1.dao.MemberDAO;
import com.kosa.pro1.member.domain.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    
    // 회원가입
    public boolean register(MemberDTO member) throws Exception {
     return memberDAO.register(member);
    }

    // 아이디 중복 확인
    public boolean checkId(MemberDTO member) throws Exception {
    	int count = memberDAO.checkId(member);
        return count>0;	
    }
    
	//	로그인
	public MemberDTO login(MemberDTO member) throws Exception {
		return memberDAO.login(member);
	
	}
	
	// 아이디 찾기
	public MemberDTO findId(MemberDTO member) throws Exception  {
		return memberDAO.findId(member);
	}

	// 비밀번호 찾기
	public MemberDTO findPassword(MemberDTO member) throws Exception  {
		return  memberDAO.findPassword(member);
	}

	// 정보 수정
	public boolean update(MemberDTO member) throws Exception  {
		return memberDAO.update(member);
	}

	// 회원 탈퇴
	public boolean leave(MemberDTO member) throws Exception  {
		return  memberDAO.leave(member);
	}

}
	

//	public JSONObject login(MemberDTO member, HttpSession session) throws Exception{
//		JSONObject jsonObject = new JSONObject();
//		
//		MemberDTO loginMember = memberDAO.login(member); 
//		
//		if (loginMember != null) {
//			session.setAttribute("loginMember", loginMember);
//			jsonObject.put("member", loginMember);
//			jsonObject.put("status", true);
//			jsonObject.put("message", "로그인 성공");
//		} else {
//			jsonObject.put("status", false);
//			jsonObject.put("message", "아이디 또는 비밀번호를 확인해주세요 ");
//		}
//		
//		return jsonObject;
//	}
//	
//	public JSONObject logout(HttpSession session) {
//		session.invalidate();
//		JSONObject jsonResult = new JSONObject();
//		jsonResult.put("status", true);
//		jsonResult.put("message", "로그아웃 되었습니다");
//		
//		return jsonResult;
//	}
//	
//	public JSONObject findId(MemberDTO member) throws Exception {
//		JSONObject jsonResult = new JSONObject();
//		MemberDTO find = memberDAO.findId(member);
//		
//		if (find != null) {
//			jsonResult.put("status", true);
//			jsonResult.put("message", "ID는 " + find.getUid() + " 입니다");
//		}
//		else {
//			jsonResult.put("status", false);
//			jsonResult.put("message", "일치하는 유저가 없습니다");
//		}
//		
//		return jsonResult;
//	}
//	
//	public JSONObject findPassword(MemberDTO member) throws Exception {
//		JSONObject jsonResult = new JSONObject();
//		MemberDTO find = memberDAO.findPassword(member);
//		
//		if (find != null) {
//			jsonResult.put("status", true);
//			jsonResult.put("message", "패스워드는 " + find.getPwd() + " 입니다");
//		} else {
//			jsonResult.put("status", false);
//			jsonResult.put("message", "일치하는 유저가 없습니다");
//		}
//		
//		return jsonResult;
//	}
//	
//	public JSONObject update(MemberDTO member, HttpSession session) throws Exception {
//		JSONObject jsonResult = new JSONObject();
//		MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
//		
//		member.setMemberId(loginMember.getMemberId());
//		boolean isUpdated = memberDAO.update(member);
//		
//		if (isUpdated) {
//			jsonResult.put("status", true);
//			jsonResult.put("message", "정보 변경을 성공하였습니다");
//		} else {
//			jsonResult.put("status", false);
//			jsonResult.put("message", "정보 변경을 실패하였습니다");
//		}
//		
//		return jsonResult;
//	}
//	
//	public JSONObject leave(HttpSession session) throws Exception {
//		JSONObject jsonResult = new JSONObject();
//		MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
//		MemberDTO leave = new MemberDTO();
//		
//		leave.setMemberId(loginMember.getMemberId());
//		
//		boolean isDeleted = memberDAO.leave(leave);
//		
//		if (isDeleted) {
//			jsonResult.put("status", true);
//			jsonResult.put("message", "유저 탈퇴에 성공하였습니다");
//		} else {
//			jsonResult.put("status", false);
//			jsonResult.put("message", "유저 탈퇴에 실패하였습니다");
//		}
//		
//		return jsonResult;
//	}
//
//	public JSONObject existUid(MemberDTO member) throws Exception {
//		JSONObject jsonResult = new JSONObject();
//
//		if (memberDAO.existUid(member)) {
//			jsonResult.put("status", true);
//			jsonResult.put("message", "아이디가 사용 불가능 합니다");
//		} else {
//			jsonResult.put("status", false);
//			jsonResult.put("message", "아이디가 사용가능합니다");
//		}
//		
//		return jsonResult;
//	}
//	
//	public List<MemberDTO> getMemberAllList() throws Exception {
//	      return memberDAO.getMemberAllList();
//	   }
//	
//	public JSONObject delete(memberDeletelds memberDeleteIds) throws Exception {
//		String deleteIds = memberDeleteIds.getDeleteIds();
//		
////		String[] splited = deleteIds.split(",");
////		long[] ids = new long[splited.length];
////		
////		for(int i=0; i<splited.length; i++) {
////			ids[i] = Long.parseLong(splited[i]);
////		}
//		
//		JSONObject jsonResult = new JSONObject();
//		
//		if (memberDAO.delete(deleteIds)) {
//			jsonResult.put("status", true);
//			jsonResult.put("message", "삭제에 성공했습니다");
//		}
//		else {
//			jsonResult.put("status", false);
//			jsonResult.put("message", "삭제에 실패했습니다");
//		}
//		
//		return jsonResult;
//	
//	}




