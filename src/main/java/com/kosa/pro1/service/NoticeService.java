package com.kosa.pro1.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.pro1.dao.NoticeDAO;
import com.kosa.pro1.notice.domain.NoticeDTO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	//공지사항 목록
	public Map<String, Object> noticePageList(NoticeDTO notice) throws Exception {
		System.out.println("NoticeService.noticepageList()함수호출");
		//1. 전체 건수를 얻기
		notice.setTotalCount(noticeDAO.getTotalCount(notice));
		Map<String, Object> result = new HashMap<>();
		
		try {
			result.put("list", noticeDAO.getNoticeList(notice));
			result.put("notice", notice);
		} catch (Exception e) {
			result.put("message", "서버 오류 발생");
			e.printStackTrace();
		}
		return result; 
	}
	
	// 공지사항 등록
	public boolean insertNotice(NoticeDTO notice)throws Exception {
	   System.out.println("공지사항 등록 호출");
	   return noticeDAO.insertNotice(notice);
	}


	// 공지사항  상세보기
	public NoticeDTO getNotice(int noticeid) throws Exception {
		System.out.println("notice.service.getNotice() 함수 호출됨");
		
		return noticeDAO.detailNotice(noticeid);
	}

	// 공지사항 수정하기
	
	public boolean noticeUpdate(NoticeDTO notice) throws Exception {
		return noticeDAO.noticeUpdate(notice);
	}
	
	// 공지사항 삭제하기
	public boolean noticeDelete(int noticeid) throws Exception {
		System.out.println("notice.service.getNotice() 함수 호출됨");
		
		return noticeDAO.noticeDelete(noticeid);
	}
	
	// 메인 top5
	public List<NoticeDTO> noticeTop5() throws Exception {
	return noticeDAO.noticeTop5();
	}
	

	//7. 조회수 증가
	public int viewCount(int noticeid) throws Exception {
		System.out.println("notice.service.viewCount() 함수 호출됨");
	
		return noticeDAO.ViewCount(noticeid); 
	}
	
//	public boolean deletenotices(String[] boardids) throws Exception {
//		System.out.println("boardIds.toString() : " + Arrays.toString(boardids));
//		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("list", boardids);
//		return 0 != noticeDAO.deleteNotice(params);
//	} 
//	
//	
//	//8.다중 선택 삭제
//	public List<NoticeDTO> deleteNotices(NoticeDTO noticeids) throws Exception {
//		System.out.println("notice.service.deleteNotices() 함수 호출됨");
//	
//		return noticeDAO.deleteNotices(noticeids); 
//	}
	
	//9.노티스 선택된 거 삭제
	public List<NoticeDTO> getNoticestBoforeN(NoticeDTO notice) throws Exception {
	return noticeDAO.getNoticeList(notice);
	}
	
	
}
	

