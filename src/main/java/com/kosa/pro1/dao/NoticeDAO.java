package com.kosa.pro1.dao;

import java.util.List;
import java.util.Map;

import com.kosa.pro1.board.domain.BoardDTO;
import com.kosa.pro1.notice.domain.NoticeDTO;

public interface NoticeDAO {
	
	//1. 공지사항 목록
	public List<NoticeDTO> getNoticeList(NoticeDTO notice) throws Exception;
	
	//	공지사항 글쓰기
	public boolean insertNotice(NoticeDTO notice) throws Exception;

	// 공지사항 상세보기
	public NoticeDTO detailNotice(int noticeid) throws Exception;
	
	// 공지사항 수정하기
	public boolean noticeUpdate(NoticeDTO notice) throws Exception;
	
	// 공지사항 삭제하기
	public boolean noticeDelete(int noticeid) throws Exception;

	//6. 메인에 TOP5 출력하기
	public List<NoticeDTO> noticeTop5() throws Exception;
	
	//7. 조회수증가
	public int ViewCount(int noticeid) throws Exception;

	//9. [페이징]검색된 전체 건수 얻는다
	public int getTotalCount(NoticeDTO notice) throws Exception;
	
//	//8. 체크박스된 게시글 삭제
//	public List<NoticeDTO> deleteNotices(NoticeDTO noticeids) throws Exception;

	//10. 게시글 삭제 후 다시 10건으로 만들어주는 메서드
	public List<NoticeDTO> getNoticestBoforeN(Map<String, Object> params) throws Exception;



} 
