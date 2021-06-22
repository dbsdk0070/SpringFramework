package com.spring.biz.view.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

public class GetBoardListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		//1. 게시글 목록 조회(SELECT)
		BoardDAO borBoardDAO = new BoardDAO();
		List<BoardVO> boardList = borBoardDAO.getBoardList();
		
		//2. 검색결과를 세션에 저장하고(목록화면으로 이동)
		//request.getSession().setAttribute("boardList", boardList);
		
		//3. 화면이동
		//response.sendRedirect("getBoardList.jsp");
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", boardList);
		// /WEB-INF/board/ + getBoardList + .jsp
		mav.setViewName("getBoardList"); //포워딩되면서 뷰리졸버 처리됨
		
		return mav;
	}

}










