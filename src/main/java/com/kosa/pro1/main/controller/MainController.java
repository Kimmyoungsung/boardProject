package com.kosa.pro1.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro1.board.domain.BoardDTO;
import com.kosa.pro1.notice.domain.NoticeDTO;
import com.kosa.pro1.service.BoardService;
import com.kosa.pro1.service.NoticeService;

//@Slf4j
@Controller
public class MainController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value= {"/main.do"})
	public String main(Model model,HttpServletRequest req, HttpServletResponse res) throws Exception {
    System.out.println("main() invoked. ");
    
	try { 
		List<NoticeDTO> noticeTop5 = noticeService.noticeTop5();
    	req.setAttribute("notice", noticeTop5);
    	
    	List<BoardDTO> boardTop5 = boardService.boardTop5();
    	System.out.println("메인컨트롤러 보드 탑5  :   "+boardTop5);
    	req.setAttribute("board", boardTop5);
    	
    	
    } catch (Exception e) { 
    	e.printStackTrace();
    }

    	
		return "main";
		
	} 
	// list

} // end class
