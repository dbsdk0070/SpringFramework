<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>creditsub</title>
</head>
<script type="text/javascript">

	$(document).ready(function(){
		
		



</script>
<body>
<form class="creditsub">
	<table id="target2" border="1" width="1000">
	<tr>카드정보조회</tr>
		<tr>
 			<td width="10%" align="center">상품명</td>
 			<td width="20%">
 				
 			${card.item }
 			
 			</td>
 			<td width="6%" align="center" rowspan="2">상품관련추가사항</td>
 			<td width="40%" colspan="3">상품서비스 - 
			
 			신용카드
 			

			</td>
		</tr>
		
		<tr>
 			<td width="10%" align="center">브랜드구분</td>

 			<td width="=50%"> 
				${card.brand }
				
 			</td>  
 			<td width="10%" align="center" colspan='2'>카드디자인선택</td>
 			<td width="10%">
 				${card.cardDesign }
 				
 			</td>
 		
		</tr>
		<tr>
			<td width="10%" align="center" >추가기능
			</td>
			<td>
			${card.addfc }
			
			</td>
 			<td width="6%" align="center">해외이용 on/off</td>
 			<td width="10%" colspan='3'>
						${card.foregin }
				

			</td>
		</tr>
		<tr>
			<td width="10%" align="center">카드번호</td>
			<td colspan='2' align="center">
 				${card.cardnum }
			</td>
 			<td width="6%" align="center">고객번호</td>
 			<td width="10%" colspan='3'>
				${card.cusno }
			</td>
		</tr>
	</table>
					<a href="/credit/creditsub.do">수정</a>
					<a href="/credit/creditsub.do">카드목록</a>
					<a href="showMain">이전화면</a>
	
</form>	
</body>
</html>
