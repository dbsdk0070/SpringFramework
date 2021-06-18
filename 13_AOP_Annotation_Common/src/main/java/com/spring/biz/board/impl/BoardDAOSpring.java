package com.spring.biz.board.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.BoardVO;
import com.spring.biz.common.JDBCUtil;

@Repository
public class BoardDAOSpring {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//SQL문
		private final String BOARD_INSERT
			= "INSERT INTO BOARD (SEQ, TITLE, WRITER, CONTENT) "
			+ "VALUES ((SELECT NVL(MAX(SEQ),0)+1 FROM BOARD), ?, ?, ?)";
		private final String BOARD_UPDATE
			= "UPDATE BOARD SET TITLE = ?, CONTENT = ?, WHERE SEQ = ?";
		private final String BOARD_DELETE
			= "DELETE FROM BOARD WHERE SEQ = ?";
		private final String BOARD_GET
			= "SELECT * FROM BOARD WHERE SEQ = ?";
		private final String BOARD_LIST
			= "SELECT * FROM BOARD ORDER BY SEQ DESC";
		
		public BoardDAOSpring() {
			System.out.println(">> BoardDAOSpring() 객체 생성");
		}
		
		//Object 배열로 저장 -> vo에서 꺼내서 넣어주면 됨
		//전달받은 vo값에서 필요한 값만 사용하면서 오브젝트 배열 Object[] args에 저장해줌
		//꼭 배열에다가 넣어야되는건 아니지만 배열에 값을 넣는 방식도 가능하다.
		
		//글입력
		public void insertBoard(BoardVO vo) {
			System.out.println("===> Spring JDBC로 insertBoard() 실행");
			Object[] args = {vo.getTitle(), vo.getWriter(), vo.getContent()};	//SQL문과 순서 맞춰줘야함
			jdbcTemplate.update(BOARD_INSERT, args);
		}

		//글수정
		public void updateBoard(BoardVO vo) {
			System.out.println("===> Spring JDBC로 updateBoard() 실행");
			Object[] args = {vo.getTitle(), vo.getContent(), vo.getSeq()};	
			jdbcTemplate.update(BOARD_UPDATE, args);
		}

		//글삭제
		public void deleteBoard(BoardVO vo) {
			System.out.println("===> Spring JDBC로 deleteBoard() 실행");
			Object[] args = {vo.getSeq()};	
			jdbcTemplate.update(BOARD_DELETE, args);
		}

		//글상세조회(데이터 하나 조회)
		public BoardVO getBoard(BoardVO vo) {
			System.out.println("===> Spring JDBC로 getBoard() 실행");
			
			//sql값 : BOARD_GET , 파라미터값 : args, result타입 저장
			//rowMapper : 정해진 interface 방식으로 만들어야 함 --> BoardRowMapper.java
			//리턴타입(인터페이스로) "new BoardRowMapper()" 생성해서 저장
			Object[] args = {vo.getSeq()};
			//jdbcTemplate.queryForObject(BOARD_GET, args, new BoardRowMapper());
			
			//return board;
			
			return jdbcTemplate.queryForObject(BOARD_GET, args, new BoardRowMapper());
		}

		//글 전체 조회
		public List<BoardVO> getBoardList() {
			System.out.println("===> Spring JDBC로 getBoardList() 실행");
			
			//글 전체조회는 파라미터 값이 없으니까 "ery(sql, rowMapper);" 방식으로 저장
			//SELECT LIST와 같음
			return jdbcTemplate.query(BOARD_LIST, new BoardRowMapper());
		}	
		
		//------------- 코드구현은 끝났고 객체 생성해야되기 때문에 어노테이션 설정해줘야됨 @Repository ------------- 
		//그리고 가져다 사용해야되기 때문에 ServiceImple(VO) 에서 사용
}
