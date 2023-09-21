package com.kosa.pro1.dao;

import java.lang.reflect.Member;
import java.util.List;

import com.kosa.pro1.member.domain.MemberDTO;

public interface MemberDAO {
	
	// 데이터베이스와 상호작용하는 데이터베이스 
	
	public boolean register(MemberDTO member) throws Exception;
	// : 회원 정보를 데이터베이스에 등록하는 메서드입니다.
	// MemberDTO 객체를 받아서 회원 정보를 데이터베이스에 저장하고, 등록에 성공하면 true를 반환합니다.
	
	public int checkId(MemberDTO member);
	// public int checkId(MemberDTO member);: 회원 아이디 중복을 체크하는 메서드로, 입력된 MemberDTO 객체의 아이디가 이미 데이터베이스에 존재하는지 확인합니다.
	//중복된 경우 1을 반환하고, 중복되지 않은 경우 0을 반환합니
	public MemberDTO login(MemberDTO  member) throws Exception;
	public MemberDTO logout(MemberDTO member) throws Exception;
	public MemberDTO findId(MemberDTO member) throws Exception;
	public MemberDTO findPassword(MemberDTO member) throws Exception;
	public boolean update(MemberDTO member) throws Exception;
	public boolean leave(MemberDTO member) throws Exception;

	
	//	public boolean existUid(MemberDTO member) throws Exception;
//	List<MemberDTO> getMemberAllList() throws Exception;
//	boolean delete(String deleteIds) throws Exception;
}

