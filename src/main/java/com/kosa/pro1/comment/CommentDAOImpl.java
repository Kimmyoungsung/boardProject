package com.kosa.pro1.comment;

import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Comment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.pro1.board.domain.BoardDTO;

@Repository("commentDAO")
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	private SqlSession sqlSession; 

	// 게시판  댓글 추가
	   @Override
	   public boolean insertCommentBoard(Comment comment) throws Exception {
	      return 0 != sqlSession.insert("mapper.comment.insertCommentBoard", comment);
	   }
	   
	   // 게시글 리스트 뽑기
	   @Override
	   public List<CommentDTO> CommentBoard(int boardid) throws Exception {
		  return sqlSession.selectList("mapper.comment.listcomment", boardid);
	   }

}
	

