
package com.kosa.pro1.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro1.board.domain.BoardDTO;
import com.kosa.pro1.comment.CommentDTO;
import com.kosa.pro1.comment.CommentService;
import com.kosa.pro1.service.BoardService;
import com.kosa.pro1.service.MailService;

@Controller
@RequestMapping("/board")

public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private CommentService commentService;
	
//	@Autowired
//	private ExecutorService executorService = Executors.newCachedThreadPool();
	

	
	// 1. 게시판 전체 목록 페이지
	@RequestMapping(value = "/list")
	public String list(BoardDTO board, Model model)throws Exception {
	
		try {
			model.addAttribute("result", boardService.boardPageList(board));
        } catch (Exception e) {
            
            e.printStackTrace();
        }
		
		return "board/list";	
	} 
	
	// 게시판 등록
    @ResponseBody
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public Map<String, Object> insertBoard(@RequestBody BoardDTO board) throws Exception {
    	System.out.println("게시글 등록: " + board);
    	
        Map<String, Object> resultMap = new HashMap<>();

        if (boardService.insertBoard(board)) {
            resultMap.put("message", "등록에 성공했습니다!");
        } else {
            resultMap.put("message", "등록에 실패했습니다.");
        }
        return resultMap;
    }
	
    // 게시판 상세보기
    @ResponseBody
    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    public Map<String, Object> detail(@RequestBody BoardDTO board) throws Exception {
        System.out.println("공지사항 상세보기 컨트롤러");
        
        Map<String, Object>  Listcomment= new HashMap<>();
        
       BoardDTO detail=boardService.getBoard(board.getBoardid()); //변수선언
       
       List<CommentDTO> commenList = commentService.commentList(board.getBoardid());
       System.out.println("하이로 "+ commenList);
      boardService.viewCount(board.getBoardid());
       
       Listcomment.put("board", detail);
       Listcomment.put("commentList",  commenList);
        return Listcomment;
    }
	
 // 공지사항 수정하기
    
    @ResponseBody
    @RequestMapping(value = "/revice", method = RequestMethod.POST)
    public Map<String, Object> revice(@RequestBody BoardDTO board) throws Exception {
    	BoardDTO revice=boardService.getBoard(board.getBoardid());
    	
    	Map<String, Object> result =new HashMap<>();
    	
    	  if (boardService.insertBoard(board)) {
    		  result.put("message", "등록에 수정에 성공했습니다!");
	        } else {
	        	result.put("message", "등록에 실패했습니다.");
	        }

    	  return result;
    }
    
    // 공지사항 삭제하기
    
    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Map<String, Object> delete(@RequestBody BoardDTO board) throws Exception {
    	Map<String, Object> result =new HashMap<>();
    	
    	  if (boardService.boardDelete(board.getBoardid())) {
    		  result.put("message", "삭제가 완료했습니다!");
	        } else {
	        	result.put("message", "삭제에 실패했습니다.");
	        }

    	  return result;
    }
	
	// 게시판 답글
    @ResponseBody
    @RequestMapping(value = "/reply", method = RequestMethod.POST)
    public Map<String, Object> reply(@RequestBody BoardDTO board) throws Exception {
        // 게시글 정보를 로그에 출력
        System.out.println("게시글 등록: " + board);

        // 결과를 담을 Map 생성
        Map<String, Object> resultMap = new HashMap<>();

        // 게시글 답변 등록
        int result = boardService.reply(board);

        // 게시글 답변 결과를 로그에 출력
        System.out.println("답변 확인형" + result);

        // 게시글 답변 등록 성공 여부 확인
        if (result > 0) {
            // 성공 시 메시지 설정
            resultMap.put("message", "답변 등록에 성공했습니다.");
            
            String autoEmail = "audtjd1201@naver.com";
            // 메일 발송 작업을 별도의 스레드에서 처리
//            executorService.submit(() -> {
//                try {
                    mailService.sendMail(autoEmail);
//                } catch (Exception e) {
//                    // 예외 처리 필요
//                    e.printStackTrace();
//                }
//            });


        } else {
            // 실패 시 메시지 설정
            resultMap.put("message", "답변 등록에 실패했습니다.");


        }

        // 결과 Map 반환
        return resultMap;
    }
   }
