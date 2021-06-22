<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세(getBoard.jsp)</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border : 1px solid black;
		margin : 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	/* .border-none td : .border-none 밑에 있는 td 태그 */
	.border-none, .border-none td{border: none;}	
</style>
</head>
<body>

<div id="container">
	<h1>게시글 상세</h1>
	<p><a href="logout.do">Log-out</a></p>
	<hr>
	
	<form action="updateBoard.do" method="post">	<!-- 컨트롤러로 가기 -->
		<input type="hidden" name="seq" value="${board.seq }"> <!-- seq값 hidden으로 처리 -->
	<table>
		<tr>
			<th width="70">제목</th>
			<td>
				<input type="text" name="title" size="30"
					value="${board.title }">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" name="writer" value="${board.writer }">
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${board.regdate }</td>	<!-- String 타입으로 해도 되고, 날짜타입으로 해도 됨 -->
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.cnt }</td>	<!-- String 타입으로 해도 되고, 날짜타입으로 해도 됨 -->
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" rows="10" cols="40">${board.content }</textarea>>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
	</table>
	</form>
	
	<p><a href="getBoardList.do">글 목록</a></p>
	<p>
		<a href="insertBoard.jsp">글등록</a>
		<a href="deleteBoard.do?seq=${board.seq }">글삭제</a>	<!-- 삭제를 해야하니까 컨트롤러로 삭제 요청 처리보냄 -->
		<a href="getBoardList.do">글목록</a>
	</p>
</div>

</body>
</html>