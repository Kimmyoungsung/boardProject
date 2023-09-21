package com.kosa.pro1.notice.domain;

import java.util.Date;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class NoticeDTO {
	private int noticeid;
	private String title;
	private String contents;
	private String writer_uid;
	private Date reg_date;
	private Date mod_date;
	private int view_count;
	private char delete_yn;
	private char fixed_yn;
	
	private String selectedNoticeIds; //추가로 만들어줌
	
	private String [] ids; // 삭제시 사용될 아이디들
	   
	   //검색필드
	   @Builder.Default
	   private String searchTitle = "";
	   
	   //페이징
	   @Builder.Default
	   private int pageNo = 1;         // 현재 페이지 번호
	   private int totalCount;      //전체 건수
	   private int totalPageSize;      //전체 페이지수
	   @Builder.Default
	   private int pageLength = 10; //한페이지의 길이
	   @Builder.Default
	   private int navSize = 10;    //페이지 하단에 출력되는 페이지의 항목수
	   @Builder.Default
	   private int navStart = 0;    //페이지 하단에 출력되는 페이지 시작 번호 : NavStart = (PageNo / NavSize) * NavSize + 1
	   @Builder.Default
	   private int navEnd = 0;     //페이지 하단에 출력되는 페이지 끝 번호 : NavEnd = (PageNo / NavSize + 1) * NavSize
	   
	   public String getContentsHTML() {
	      return contents.replace("\n", "<br/>");
	   }
	   
	   public void setTotalCount(int totalCount) {
	      this.totalCount = totalCount;
	      
	      //전체 페이지 건수를 계산
	      totalPageSize = (int) Math.ceil((double) totalCount / pageLength);
	      
	      // 페이지 네비게이터 시작 페이지를 계산
	      navStart = ((pageNo -1) / navSize) * navSize + 1;
	      
	      //페이지 네비게이터 끝 페이지를 계산
	      navEnd = ((pageNo -1) / navSize + 1) * navSize;
	      
	      //전체 페이지 보다 크면 전체 페이지 값을 변경
	      if(navEnd >= totalPageSize) {
	         navEnd = totalPageSize;
	      }
	   }
	   
	   public int getStartNo() {
	      return (pageNo -1) * pageLength + 1;
	   }
	   
	   public int getEndNo() {
	      return pageNo * pageLength;
	   }
}

