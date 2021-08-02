package com.spring.biz.board.service;

import java.util.List;

public interface BoardService {
	
	/*
	 * //게시글 목록 public List<BoardListVO> getBoardList();
	 */
	//게시글 상세보기
	BoardListVO boardDetail(BoardListVO vo, int board_num);
	
	//공지사항의 게시물 총 갯수
	public int getBoardCount();
	
	//페이징 처리 후 공지사항
	public List<BoardListVO> getBoardList(PagingVO vo);
}