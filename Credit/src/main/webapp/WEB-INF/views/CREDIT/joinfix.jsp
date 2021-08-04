<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>credit</title>
</head>
<script type="text/javascript">

	$(document).ready(function(){
		

		$("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			
			
			$.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do"
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		}),
		
	});

	



</script>
<body>
<form class="credit">
	<table border="1" width="1200">  
	<tr>가입정보수정</tr>
	<tr>
 		<td width="5%" align="center">한글성명</td>
 		<td width="10%">
 			<input name="" type="text" size="30" value="">
 		</td>
 		<td width="5%" align="center">영문명</td>
 		<td width="10%">
 			<input name="" type="text" size="30" value="">
 		</td>
 		<td width="5%" align="center">생년월일</td>
 		<td width="10%">
			<input name="" type="text" size="40" value="">
		</td>
	</tr>
	
	<tr>
		<td width="5%" align="center">자택주소</td>
 		<td width="10%" colspan='1'>
 			<input name="" type="text" size="10" value="">
 			<input type="button" id="doro" value="주소찾기 " width="30%" size="30">  
 		</td>  
 		<td width="5%" align="center">상세주소</td>
			<td width="10%" colspan='1' >
 			<input name="" type="text" size="30" value="">
 		</td> 
 		<td width="5%" align="center">자택전화</td>
 		<td width="10%">
 			<select name="">
 				<option>070</option>
 			</select>
 			<input name="" type="text" size="10" value="">
 			<input type="checkbox" value="">없음
 		</td>
 		
	</tr>
	
	<tr>
 		<td width="5%" align="center">휴대전화</td>
 		<td width="10%">
 			<select name="boardType">
 				<option>010</option>
 			</select>
 			<input name="" type="text" size="20" value="">
 		</td>
 		<td width="5%" align="center">별도SMS</td>
 		<td width="10%">
 			<input name="" type="text" size="20" value="">
 			<input type="checkbox" value="">없음
 		</td>
 		<td width="5%" align="center">이메일</td>
 		<td width="10%">
			<input name="" type="text" size="10" value="">
			@
			<select name="">
 				<option>naver.com</option>
 			</select>
		</td>
	</tr>

	<tr>
		<td width="5%" colspan='2'  align="center">승인내역알림서비스</td>
 		<td width="10%" colspan='7'> 
			<input type="checkbox" value="">유료SMS
			<input type="checkbox" value="">유료카카오알림톡
			<input type="checkbox" value="">무료SMS
			<input type="checkbox" value="">무료카카오알림톡
 		</td>  
	</tr>
	
	<tr>
 		<td width="5%" align="center">결제은행</td>
 		<td width="10%">
 			<input type="checkbox"  value="">IBK기업은행
			<input type="checkbox"  value="">기타
			<select name="bank">
 				<option>신한은행</option> 
 			</select>
 		</td>
 		<td width="5%" align="center">계좌번호</td>
 		<td width="10%">
 			<input name="account" type="text" size="30" value="">
 		</td>
 		<td width="5%" align="center">결제일</td>
 		<td width="10%">
			<select name="payday">
 				<option>01일</option> 
 			</select>
		</td>
	</tr>
		
	<tr>
		<td width="5%" colspan='2'  align="center">요청최고한도</td>
 		<td width="10%" colspan='7'> 
			<input type="checkbox" id="" value="">5천만원
			<input type="checkbox" id="" value="">3천만원
			<input type="checkbox"  id="" value="">1천만원
			<input type="checkbox"  id="" value="">기타 <input name="" type="text" size="20">만원
			
 		</td>  
	</tr>

	<tr>
		<td width="10%" colspan='1'  align="center">청구서수령지</td>
 		<td width="10%" colspan='8'> 
			<input type="checkbox" value="">이메일
			<input type="checkbox" value="">직장
			<input type="checkbox" value="">자택
			<input type="checkbox" value="">발송제외
			<input type="checkbox" value="">별도청구지 (주소<input name="boardTitle" type="text" size="20">전화번호 <input name="boardTitle" type="text" size="15">)
			 
 		</td>  
	</tr>
	
	<table><tr></tr></table>
	
	</table>
		
		<table border="1" width="1200">
	
	<tr>
		<td width="5%" align="center">직장주소</td>
 		<td width="10%" colspan='3'>
 			<input name="" type="text" size="60" value="">
 			<input type="button" id="doro" value="주소찾기 " width="30%" size="30">  
 		</td>  
 		<td width="5%" align="center">직장전화</td>
 		<td width="10%">
 			<select name="">
 				<option>070</option>
 			</select>
 			<input name="" type="text" size="10" value="">
 		</td>
	</tr>
	 
	<tr>
 		<td width="5%" align="center">직장명</td>
 		<td width="10%">
 			<input name="" type="text" size="20" value="">
 		</td>
 		<td width="5%" align="center">부서명</td>
 		<td width="10%">
 			<input name="" type="text" size="30" value="">
 		</td>
 		<td width="5%" align="center">부서명</td>
 		<td width="10%">
			<input name="" type="text" size="20" value=""> 
		</td>
	</tr>

	
	</table>
	
	<table><tr></tr></table>
	
	
		
	
	
	<table>
		<tr>
			<td>
				<a href="<%=request.getContextPath()%>/joininfo">이전화면</a>
				<a href="/credit/creditsub.do">수정완료</a>	
		</tr>
	</table>
</form>	
</body>
</html>
