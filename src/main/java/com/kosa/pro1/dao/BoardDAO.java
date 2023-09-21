package com.kosa.pro1.dao;

import java.util.List;
import java.util.Map;

import com.kosa.pro1.board.domain.BoardDTO;
import com.kosa.pro1.board.domain.BoardDTO;
import com.kosa.pro1.board.domain.BoardDTO;


public interface BoardDAO {
	//1. 게시판 목록
	public List<BoardDTO> getBoardList(BoardDTO board) throws Exception;

	//.공지사항 글쓰기
	public boolean insertBoard(BoardDTO board) throws Exception;

	// 공지사항 상세보기
	public BoardDTO detailBoard(int Boardid) throws Exception;
	
	// 공지사항 수정하기
	public BoardDTO boardUpdate(BoardDTO board) throws Exception;
	
	// 공지사항 삭제하기
	public boolean boardDelete(int boardid) throws Exception;
		
	//2. 메인에 TOP5 출력하기
	public List<BoardDTO> boardTop5() throws Exception;

	//7. 조회수증가
	public int ViewCount(int boardid) throws Exception;
		
	//8. 체크박스된 게시글 삭제
	public Map<String,Object> deleteBoards(BoardDTO boardids) throws Exception;
		
	//3. [페이징]검색된 전체 건수 얻는다
	public int getTotalCount(BoardDTO board) throws Exception;
	
	//답글 폼
	public int reply(BoardDTO board) throws Exception;
	}