package com.kosa.pro1.comment;

import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Comment;

import com.kosa.pro1.board.domain.BoardDTO;



public interface CommentDAO {
	

//게시판 댓글 쓰기
public boolean insertCommentBoard(Comment comment) throws Exception;

//리스트 뽑기
public List<CommentDTO> CommentBoard(int boardid) throws Exception;


 
}
