package com.kosa.pro1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.pro1.board.domain.BoardDTO;
import com.kosa.pro1.dao.BoardDAO;
import com.kosa.pro1.board.domain.BoardDTO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;

	// 1. 게시판 목록
	public Map<String, Object> boardPageList(BoardDTO board) throws Exception {
	System.out.println("BoardService.boardpageList() 함수 호출됨");
	// 1. 전체 건수를 얻기
	board.setTotalCount(boardDAO.getTotalCount(board));
	Map<String, Object> result = new HashMap<>();

	try {
		result.put("list", boardDAO.getBoardList(board));
		result.put("board", board);
	}catch (Exception e) {
		result.put("message", "서버 오류 발생");
		e.printStackTrace();
	}
	
	return result;
	}
	
// 공지사항 등록
	public boolean insertBoard(BoardDTO board)throws Exception {
	System.out.println("공지사항 등록 호출");
	 return boardDAO.insertBoard(board);
		}

	// 게시판  상세보기
	public BoardDTO getBoard(int boardid) throws Exception {
		System.out.println("board.service.getBoard() 함수 호출됨");
		
		return boardDAO.detailBoard(boardid);
	}
	
	// 공지사항 수정하기
	
	public BoardDTO boardUpdate(BoardDTO board) throws Exception {
	return boardDAO.boardUpdate(board);
		}
		
	// 공지사항 삭제하기
	public boolean boardDelete(int boardid) throws Exception {
	System.out.println("board.service.getBoard() 함수 호출됨");
			
	return boardDAO.boardDelete(boardid);
	}
		
	// 메인 top5
	public List<BoardDTO> boardTop5() throws Exception {
	return boardDAO.boardTop5();
		}
		
	//7. 조회수 증가
	public int viewCount(int boardid) throws Exception {
		System.out.println("board.service.viewCount() 함수 호출됨");
		
	return boardDAO.ViewCount(boardid); 
		
	}
	
	// 댓글 등록
	public int reply(BoardDTO board)throws Exception {
	System.out.println("공지사항 댓글 호출됨");
	
	int level = board.getLevel();
	board.setPid(board.getBoardid());
	board.setLevel(level + 1);
	
	int result = boardDAO.reply(board);
	
	
	
	return result;
	}
	
	
}
