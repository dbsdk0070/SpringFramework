package com.spring.biz.board.serviceImpl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.service.BoardListVO;
import com.spring.biz.board.service.PagingVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	/*
	 * // 게시글 목록 public List<BoardListVO> getBoardList(){ return
	 * mybatis.selectList("boardlist.boardselect"); }
	 */
	
		//게시글 상세보기
		BoardListVO boardDetail(BoardListVO vo, int board_num) {
			return mybatis.selectOne("boardlist.boardDetail", vo);
		}
	
		// 공지사항의 게시물 총 갯수
		public int getBoardCount() {
			return mybatis.selectOne("boardlist.countBoard");
		}
		// 페이징 처리 후 공지사항
		public List<BoardListVO> getBoardList(PagingVO vo){
			return mybatis.selectList("boardlist.selectBoard", vo);
		}
}










