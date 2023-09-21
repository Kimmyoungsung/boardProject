package com.kosa.pro1.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.pro1.board.domain.BoardDTO;
import com.kosa.pro1.dao.BoardDAO;
import com.kosa.pro1.board.domain.BoardDTO;

@Service
public class CommentService {
	@Autowired
	private CommentDAO commentDAO;

	public boolean insertCommentBoard(Comment comment) throws Exception {
		return commentDAO.insertCommentBoard(comment);
		   }
	
	
	public List<CommentDTO> commentList(int boardid)  throws Exception {
	return commentDAO.CommentBoard(boardid);
	}


	
}
