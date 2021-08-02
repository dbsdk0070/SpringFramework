package com.spring.biz.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.service.BoardListVO;
import com.spring.biz.board.service.BoardService;
import com.spring.biz.board.service.PagingVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
/*	
	@Override
	//게시글 리스트
	public List<BoardListVO> getBoardList(){
		return boardDAO.getBoardList();
	}*/
	
	@Override
	//게시글 상세 조회
	public BoardListVO boardDetail(BoardListVO vo, int board_num) {
		return boardDAO.boardDetail(vo, board_num);
	}
	
	@Override
	//게시글 카운트
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}
	
	@Override
	// 페이징 처리 후 공지사항
	public List<BoardListVO> getBoardList(PagingVO vo){
		return boardDAO.getBoardList(vo);
	}
}
