<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

	$(function(){
		$(document).on("click","#mybtn6",function(){
			location.href="<%=request.getContextPath()%>/logOut";
		})
		
		$(document).on("click","#mybtn5",function(){
			location.href="<%=request.getContextPath()%>/";
		})
		
		$(document).on("click","#mybtn2",function(){
			location.href="<%=request.getContextPath()%>/familyList";
		})
		
		$(document).on("click","#mybtn3",function(){
			location.href="<%=request.getContextPath()%>/joininfo";
		})
		
		$(document).on("click","#mybtn4",function(){
			location.href="<%=request.getContextPath()%>/creditinfo";
		})
		
	});
	
</script>
<body align="center">
	<img src="/resources/images/public.jpg" width="450" height="380">
<form class="credit">
	<table align="center">
	<tr>
		<td>
			<input id="mybtn2" type="button" value="가족정보" >
			<input id="mybtn3" type="button" value="개인정보관리" >
			<input id="mybtn4" type="button" value="카드정보관리">
			<input id="mybtn5" type="button" value="이전화면" >
			<input id="mybtn6" type="button" value="로그아웃" >
		</td>
	</tr>
	<tr>
	<td>환영합니다 고객번호 ${logId } 고객님.</td>
	</tr>
	</table>
</form>	
</body>
</html>
