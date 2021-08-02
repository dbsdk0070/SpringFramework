package com.spring.biz.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.biz.board.service.BoardListVO;
import com.spring.biz.board.service.BoardService;
import com.spring.biz.board.service.PagingVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	  @RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	  public String insertView() {
	  
	  return "/boardInsert.jsp";
	  
	  }
		/*
		 * @RequestMapping(value = "/selectBoard.do", method = RequestMethod.GET) public
		 * String getBoardList(Model model, BoardListVO vo) {
		 * 
		 * List<BoardListVO> boardList = boardService.getBoardList();
		 * model.addAttribute("boardList", boardList);
		 * System.out.println(">>>>>>boardlist : " + boardList);
		 * 
		 * return "/boardList.jsp"; }
		 */
	  
	  	//게시 글 상세보기
	  	@RequestMapping(value = "/boardlistDetail.do", method = RequestMethod.GET)
	  	public String boardDetail(BoardListVO vo, Model model, @RequestParam("board_num")int board_num) {
	  		System.out.println(">>>>>>>>>>>>>>>>>>>컨트롤러 진입");
			/*
			 * int num = board_num; BoardListVO boardlistvo = boardService.boardDetail(vo,
			 * num); System.out.println(">>> vo : " + boardlistvo);
			 * 
			 * model.addAttribute("boardlistvo", boardlistvo);
			 */

	  		return "/login.jsp";
	  	}
	  
	    //게시판 전체 리스트 (페이징 처리 후)
		@RequestMapping("/getBoardList.do")
		public String getBoardListNotice(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			
			int total = boardService.getBoardCount();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "6";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "6";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println(">>게시판 컨트롤러 vo :" + vo);
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", boardService.getBoardList(vo));
			
			return "/boardList.jsp";
		}	
}
