<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 화면 출력 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>글목록</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border : 1px solid black;
		margin : 0 auto;
	}
	span{
		margin-left: 130px;
	}
	p{
		margin-left: 400px;
	}
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>
<br>
<span>
<a href="login.do">login</a>
<a href="signup.do">join</a>
</span>

<div id="container">
	<!-- 데이터 표시영역 -->
	<table>
		<tr>
			<th width="80">Type</th>
			<th width="50">No</th>
			<th width="300">Title</th>
		</tr>
		<c:forEach var="list" items="${viewAll }">
		<tr>
		<%-- 	<td class="center">${boardList.board_type }</td> --%>
			<%-- <td>
				<a href="getBoard.do?board_title=${boardList.board_title }">${boardList.board_title }</a>
			</td> --%>
			<td>${list.code_name }</td>
			<td>${list.board_num }</td>
			<%-- <td><a href='boardDetail.do?board_num=${board_num }'>${list.board_title }</a></td> --%>
			<td><a href="boardlistDetail.do">제목</a></td>
		</tr>	
		</c:forEach>
	</table>
		<!-- 페이징 -->
	<div class="center">
	<div class="pagination">
		<c:if test="${paging.startPage != 1 }">
			<a href="/getBoardList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="now">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/getBoardList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/getBoardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	</div>
	<p><a href="boardInsert.do">글쓰기</a></p>
</div>



</body>
</html>