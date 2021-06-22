package com.spring.biz.view.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

//@WebServlet("*.do") //web.xml 설정 사용
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//요청처리 작업 진행
		System.out.println(">> DispatcherServlet.process() : *.do 요청에 대한 처리");
		
		//1. 클라이언트에서 어떤 작업을 요청했는지 확인하기
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);	//uri/biz/login.do 라는 문자열이 들어오는데 /biz/login.do문자열을 잘라냄
		String path = uri.substring(uri.lastIndexOf("/"));	//맨 뒤에서 첫번째로 잘라진 / 부터 끝까지
		System.out.println("path : " + path);
		
		//2. 클라이언트의 요청형태에 따른 작업 처리
		if ("/login.do".equals(path)) {
			System.out.println(">> 로그인 처리");
			//1. 사용자 입력한 데이터(정보) 확인 (추출)
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			//2. DB연동작업(id, password 유무 확인)
			UserVO vo = new UserVO();	//DB 연동하려면 VO 생성해서 Parameter로 가져온 값 넣어줘야함
			vo.setId(id);
			vo.setPassword(password);
			
			UserDAO userDAO = new UserDAO();
			UserVO user = userDAO.getUser(vo);
			
			//3. 화면 네비게이션(화면이동)
			//로그인 성공 : 게시글 목록 보여주기
			//로그인 실패 : 로그인 화면으로 이동
			if(user != null) {	//사용자 정보가 있는 경우
				System.out.println(">> 로그인 성공!!!");
				response.sendRedirect("getBoardList.do");
			}else{
				System.out.println(">> 로그인 실패~~~");
				response.sendRedirect("login.jsp");
			}
			
		}else if("/logout.do".equals(path)) {
			System.out.println(">>> 로그아웃 처리");
			//1. 세션 초기화(세션 객체 무효화)
			request.getSession().invalidate();	//invalidate 사용하면 세션 무효화 처리됨
			//2. 화면 네비게이션(로그인페이지)
			response.sendRedirect("login.jsp");
			
		}else if("/getBoardList.do".equals(path)) {
			System.out.println(">> 게시글 전체 목록 보여주기");
			//1. 게시글 목록 조회(SELECT)
			UserDAO userDAO = new UserDAO();
			BoardDAO borBoardDAO = new BoardDAO();
			List<BoardVO> boardList = borBoardDAO.getBoardList();
			
			//2. 검색결과를 세션에 저장하고(목록화면으로 이동)
			request.getSession().setAttribute("boardList", boardList);
			
			//3. 화면이동
			response.sendRedirect("getBoardList.jsp");	//데이터는 sessionScope에 저장되어있음
		}else if("/getBoard.do".equals(path)) {
			System.out.println(">> 게시글 상세보기");
			//1. 전달받은 데이터 추출(파라미터 값) 확인
			String seq = request.getParameter("seq");	//seq가 무엇?
			
			//2. DB 연동 작업 처리(데이터 입력)
			BoardVO vo = new BoardVO();
			vo.setSeq(Integer.parseInt(seq));
			
			BoardDAO boardDAO = new BoardDAO();
			BoardVO board = boardDAO.getBoard(vo);	//전달받는 파라미터가 있으므로 BoardVO 타입으로 맞춰줌
			
			//3. 검색 결과를 세션에 저장(뷰에서 사용되도록)
			HttpSession session = request.getSession();
			session.setAttribute("board", board);
			
			//4. 화면 전환 네비게이션(목록페이지로 이동)
			response.sendRedirect("getBoard.jsp");
			
		}else if("/insertBoard.do".equals(path)) {
			System.out.println(">> 게시글 입력");
			//1. 전달받은 데이터 추출(파라미터 값) 확인
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			//2. DB 연동 작업 처리(데이터 입력)
			BoardVO vo = new BoardVO();	//VO만들어서 값 넣어줌
			vo.setTitle(title);
			vo.setWriter(writer);
			vo.setContent(content);
			
			BoardDAO boardDAO = new BoardDAO();
			boardDAO.insertBoard(vo);
			
			//3. 화면 전환 네비게이션(목록페이지로 이동) insert된 목록을 가져와되니까 .jsp로 가면 안됨. "/insertBoard.do" 로 가야함
			response.sendRedirect("getBoardList.do");
		}else if("/updateBoard.do".equals(path)) {
			System.out.println(">> 게시글 수정");
			//1. 전달받은 데이터 추출(파라미터 값) 확인
			String seq = request.getParameter("seq");
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			//2. DB 연동 작업 처리(데이터 입력)
			BoardVO vo = new BoardVO();	//VO만들어서 값 넣어줌
			vo.setSeq(Integer.parseInt(seq));
			vo.setTitle(title);
			vo.setWriter(writer);
			vo.setContent(content);
			
			BoardDAO boardDAO = new BoardDAO();
			boardDAO.updateBoard(vo);
			
			//3. 화면 전환 네비게이션(목록페이지로 이동) insert된 목록을 가져와되니까 .jsp로 가면 안됨. "/insertBoard.do" 로 가야함
			response.sendRedirect("getBoardList.do");
		}else if("/deleteBoard.do".equals(path)) {
			System.out.println(">> 게시글 삭제");
			//1. 전달받은 데이터 추출(파라미터 값) 확인
			String seq = request.getParameter("seq");

			//2. DB 연동 작업 처리(데이터 입력)
			BoardVO vo = new BoardVO();	//VO만들어서 값 넣어줌
			vo.setSeq(Integer.parseInt(seq));

			BoardDAO boardDAO = new BoardDAO();
			boardDAO.deleteBoard(vo);
			
			//3. 화면 전환 네비게이션(목록페이지로 이동) insert된 목록을 가져와되니까 .jsp로 가면 안됨. "/insertBoard.do" 로 가야함
			response.sendRedirect("getBoardList.do");
		}
	}
}














