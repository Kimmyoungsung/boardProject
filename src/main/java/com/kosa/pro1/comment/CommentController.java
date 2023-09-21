
package com.kosa.pro1.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")

public class CommentController {
	
	@Autowired
	private CommentService commentService;

	 @RequestMapping(value = "/insertComment", method = RequestMethod.POST) 
	 @ResponseBody
	   public Map<String, Object> insertComment(@RequestBody Comment comment) throws Exception {
	      System.out.println("댓글쓰기");
	      
	      Map<String, Object> result = new HashMap<>();
	      
	      if(commentService.insertCommentBoard(comment)) {
	          result.put("status", true);
	          result.put("message", "댓글이 등록되었습니다");
	       } else {
	          result.put("status", false);
	          result.put("message", "댓글 작성 중 오류가 발생하였습니다");
	       }
	      
	      return result;
	      
	   }
	 
	 
//	 @RequestMapping(value = "/listComment", method = RequestMethod.POST)
//	 @ResponseBody
//	 public Map<String, Object> list(CommentDTO comment) throws Exception {
//		 
//		Map<String, Object> list = new HashMap<>();
//		
//		List<CommentDTO> commentList =  commentService.commentList(comment.getBoardid());
//		System.out.println("야나와라~~ㅋ"+ commentList);
//		
//		list.put("commentList", commentList);
//		
//		return list;
//	 
//	 }
	}
	 
