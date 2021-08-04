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
	<tr>카드정보수정</tr>
		<tr>
 			<td width="10%" align="center">상품명</td>
 			<td width="20%">
 				<select name="">
 				<option>korea bank1 new card</option>
 			</select>
 			</td>
 			<td width="6%" align="center" rowspan="2">상품관련추가사항</td>
 			<td width="40%" colspan="3">상품서비스 - 
			<select name="">
 				<option>신용카드</option>
 			</select>

			</td>
		</tr>
		
		<tr>
 			<td width="10%" align="center">브랜드구분</td>

 			<td width="=50%"> 
				<input type="checkbox" value="">국내
				<input type="checkbox" value="">마스타
				<input type="checkbox" value="">비자
				<input type="checkbox" value="">Unionpay
				<input type="checkbox" value="">BC글로벌

 			</td>  
 			<td width="10%" align="center" colspan='2'>카드디자인선택</td>
 			<td width="10%">
 				<input name="" type="Radio" size="20" value="">1
 				<input name="" type="Radio" size="20" value="">2
 				<input name="" type="Radio" size="20" value="">3
 			</td>
 		
		</tr>
		<tr>
			<td width="10%" align="center" >추가기능
			</td>
			<td>
			<input type="checkbox" value="">교통카드
			<input type="checkbox" value="">현금카드
			</td>
 			<td width="6%" align="center">해외이용 on/off</td>
 			<td width="10%" colspan='3'>
				<input type="checkbox" value="">ON
				<input type="checkbox" value="">OFF 

			</td>
		</tr>
		<tr>
			<td width="10%" align="center">카드번호</td>
			<td colspan='2' align="center">
 				0001 - 0002 - 0003 - 0004 
			</td>
 			<td width="6%" align="center">고객번호</td>
 			<td width="10%" colspan='3'>
				00000000
			</td>
		</tr>
	</table>
					<a href="/credit/creditsub.do">수정완료</a>
					<a href="/credit/creditsub.do">이전화면</a>
	
</form>	
</body>
</html>
