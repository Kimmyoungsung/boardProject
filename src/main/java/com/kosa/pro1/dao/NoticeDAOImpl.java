package com.kosa.pro1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.pro1.notice.domain.NoticeDTO;

@Repository("noticeDAO") 
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired // @Autowired 어노테이션은 스프링에서 SqlSession 빈을 찾아서 주입
	private SqlSession sqlSession;
	
	// 공지사항 목록
	@Override
	public List<NoticeDTO> getNoticeList(NoticeDTO notice) throws Exception {
		System.out.println("notice.noticeDAOImpl.getNoticeList() 게시판 목록 함수 호출됨");		
		return sqlSession.selectList("mapper.notice.getNoticeList", notice);
	}

	// 공지사항 글쓰기
	@Override
	public boolean insertNotice(NoticeDTO notice) throws Exception {
	   return 0 != sqlSession.insert("mapper.notice.insertNotice", notice); //insertNotice 이거 맞춰야함 .xml꺼랑 동일
	}

	// 상세보기
	@Override	
	public NoticeDTO detailNotice(int noticeid) throws Exception {
	    return sqlSession.selectOne("mapper.notice.detailNotice", noticeid);
	}

	//공지사항 수정하기
	@Override	
	public boolean noticeUpdate(NoticeDTO notice) throws Exception {
	    return 0 != sqlSession.update("mapper.notice.noticeUpdate", notice);
	}
	
	
	// 공지사항 삭제하기
	@Override
	public boolean noticeDelete(int noticeid) throws Exception {
		return 0 != sqlSession.delete("mapper.notice.noticeDelete", noticeid);
	}

	//6. 메인에 TOP5 출력하기
	@Override
	public List<NoticeDTO> noticeTop5() throws Exception {
		return sqlSession.selectList("mapper.notice.noticeTop5");
	}

	@Override
	public int ViewCount(int noticeid) throws Exception {
		return sqlSession.update("mapper.notice.ViewCount", noticeid);
	}
	
	@Override
	public int getTotalCount(NoticeDTO notice) throws Exception {
		return sqlSession.selectOne("mapper.notice.totalCount",notice);
	}

//	  @Override
//	    public boolean deleteNotices(List<Integer> noticeIds) throws Exception {
//	        try {
//	            int deletedCount = sqlSession.delete("mapper.notice.deleteNotices", noticeIds);
//	            return deletedCount > 0;
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	            return false;
//	        
	

	// 10개 메서드
	
	@Override
	public List<NoticeDTO> getNoticestBoforeN(Map<String, Object> params) throws Exception {
	return sqlSession.selectList("mapper.notice.getNoticestBoforeN", params);
	}

} 