package com.kosa.pro1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.pro1.board.domain.BoardDTO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession; 


	//1. 게시판 목록
	@Override
	public List<BoardDTO> getBoardList(BoardDTO board) throws Exception {
		System.out.println("board.boardDAOImpl.getBoardList() 게시판 목록 함수 호출됨");		
		return sqlSession.selectList("mapper.board.getBoardList", board);
	}
	
	// 게시판 글쓰기
	@Override
	public boolean insertBoard(BoardDTO board) throws Exception {
	return 0 != sqlSession.insert("mapper.board.insertBoard", board); //insertBoard 이거 맞춰야함 .xml꺼랑 동일
	}
	
	//상세보기
	@Override	
	public BoardDTO detailBoard(int boardid) throws Exception {
	return sqlSession.selectOne("mapper.board.detailBoard", boardid);
	}
	
	//공지사항 수정하기
	@Override	
	public BoardDTO boardUpdate(BoardDTO board) throws Exception {
	return sqlSession.selectOne("mapper.board.boardUpdate", board);
		}
		
	// 공지사항 삭제하기
	@Override
	public boolean boardDelete(int boardid) throws Exception {
	return 0 != sqlSession.delete("mapper.board.boardDelete", boardid);
		}	
	
	//6. 메인에 TOP5 출력하기
	@Override
	public List<BoardDTO> boardTop5() throws Exception {
		return sqlSession.selectList("mapper.board.boardTop5");
	} // boardTop5
	
	@Override
	public int ViewCount(int boardid) throws Exception {
		return sqlSession.update("mapper.board.ViewCount", boardid);
	}
	
	@Override
	public int getTotalCount(BoardDTO board) throws Exception {
		return sqlSession.selectOne("mapper.board.totalCount",board);
	}

	//다중 선택 삭제
	@Override
	public Map<String,Object> deleteBoards(BoardDTO boardids) throws Exception {
	return sqlSession.selectOne("mapper.board.deleteBoards", boardids);
	}

		
	@Override
	public int reply(BoardDTO board) throws Exception {
	return sqlSession.insert("mapper.board.insertBoardReply", board);
		}
}

	
	
	//선택된 거 삭제 
//		@Override
//		public List<BoardDTO> getBoardstBoforeN(BoardDTO board, int length) throws Exception {
//		return sqlSession.selectOne("mapper.board.getBoardstBoforeN", board);
//		} 	

	

