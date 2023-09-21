package com.kosa.pro1.dao;

import java.lang.reflect.Member;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.pro1.member.domain.MemberDTO;

@Repository("memberDAO") // 스프링 컨테이너에 이 클래스를 빈으로 등록하며, 빈의 이름을 "memberDAO"로 지정합니다.
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired // @Autowired 어노테이션은 스프링에서 SqlSession 빈을 찾아서 주입
	private SqlSession sqlSession;

	@Override
	public boolean register(MemberDTO member) throws Exception {
		return 0 != sqlSession.insert("mapper.member.register", member);
	}

	// register(MemberDTO member): 회원 정보를 데이터베이스에 등록하는 메서드입니다. SqlSession을 사용하여 MyBatis 매퍼 파일에서 mapper.member.register라는 SQL 쿼리를 호출하여 회원 정보를 데이터베이스에 삽입합니다.
	
	@Override
	public int checkId(MemberDTO member) {
	    return sqlSession.selectOne("mapper.member.checkId", member);
	}

	@Override
	public MemberDTO login(MemberDTO member) throws Exception {
		return sqlSession.selectOne("mapper.member.login", member); //임플이랑 xml이랑 동일해야함.
	}
	
	@Override
	public MemberDTO logout(MemberDTO member) throws Exception {
		return sqlSession.selectOne("mapper.member.logout", member);
	}

	@Override
	public MemberDTO findId(MemberDTO member) throws Exception {
		return sqlSession.selectOne("mapper.member.findId", member);
	}

	@Override
	public MemberDTO findPassword(MemberDTO member) throws Exception {
		return sqlSession.selectOne("mapper.member.findPassword", member);
	}
	
	@Override
	public boolean update(MemberDTO member) throws Exception {
		return 0 <= sqlSession.update("mapper.member.update", member);
	}
	
	@Override
	public boolean leave(MemberDTO member) throws Exception {
		return 0 != sqlSession.delete("mapper.member.leave", member);
		
	}
	// 이 클래스는 데이터베이스와의 상호 작용을 담당하며, MyBatis를 사용하여 SQL 쿼리를 실행하고 결과를 반환합니다.
}

//
//	login
//	@Override
//	public MemberDTO findId(MemberDTO member) throws Exception {
//	
//	}
//	
//	
//	@Override
//	public MemberDTO findPassword(MemberDTO member) throws Exception {
//	
//	}
//
//	
//	@Override
//	public boolean update(MemberDTO member) throws Exception {
//		
//	}
//	
//	@Override
//	public boolean leave(MemberDTO member) throws Exception {
//		
//	}
//	
//	@Override
//	public boolean existUid(MemberDTO member) throws Exception {
//		
//	}
//
//	@Override
//	public boolean delete(String deleteIds) throws Exception {
//		
//	}