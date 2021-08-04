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
			var $frm = $('.boardWrite :input');
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
	<tr>가입정보</tr>
	<tr>
 		<td width="5%" align="center">한글성명</td>
 		<td width="10%">
 			${joininfo.kname }
 		</td>
 		<td width="5%" align="center">영문명</td>
 		<td width="10%">
 			${joininfo.ename }
 		</td>
 		<td width="5%" align="center">생년월일</td>
 		<td width="10%">
			${joininfo.birth }
		</td>
	</tr>
	
	<tr>
		<td width="5%" align="center">자택주소</td> 
 		<td width="10%" colspan='1'>
 			${joininfo.haddr }
 			
 		</td>  
 		<td width="5%" align="center">상세주소</td>
			<td width="10%" colspan='1' >
 			${joininfo.haddr2 }
 		</td> 
 		<td width="5%" align="center">자택전화</td>
 		<td width="10%">
 			<c:if test="${joininfo.htel=='nullnull' }">
 				없음
 			</c:if>
 			<c:if test="${joininfo.htel!='nullnull' }">
 				${joininfo.htel }
 			</c:if>
 			
 		</td>
 		
	</tr>
	
	<tr>
 		<td width="5%" align="center">휴대전화</td>
 		<td width="10%">
 			${joininfo.phone }
 		</td>
 		<td width="5%" align="center">별도SMS</td>
 		<td width="10%">
 			<c:if test="${joininfo.sms!=null }">
 				${joininfo.sms }
 			</c:if>
 			
 			<c:if test="${joininfo.sms==null }">
 				없음
 			</c:if>
 			
 			
 		</td>
 		<td width="5%" align="center">이메일</td>
 		<td width="10%">
			${joininfo.email }
		</td>
	</tr>

	<tr>
		<td width="5%" colspan='2'  align="center">승인내역알림서비스</td>
 		<td width="10%" colspan='7'> 
			${joininfo.checks}
 		</td>  
	</tr>
	
	<tr>
 		<td width="5%" align="center">결제은행</td>
 		<td width="10%">
 			${joininfo.payacc }
 		</td>
 		<td width="5%" align="center">계좌번호</td>
 		<td width="10%">
 			${joininfo.paybank }
 		</td>
 		<td width="5%" align="center">결제일</td>
 		<td width="10%">
 			${joininfo.paydate }
		</td>
	</tr>
		
	<tr>
		<td width="5%" colspan='2'  align="center">요청최고한도</td>
 		<td width="10%" colspan='7'> 
			${joininfo.paymax }원
			
			
 		</td>  
	</tr>

	<tr>
		<td width="10%" colspan='1'  align="center">청구서수령지</td>
 		<td width="10%" colspan='8'>
 			<c:if test="${joininfo.payMethod!=null }">
 				${joininfo.payMethod }
 			</c:if> 
			<c:if test="${joininfo.payMethod==null  }">
 				주소 : ${joininfo.payaddr}, 전화번호 : ${joininfo.paytel }
 			</c:if> 
 		</td>  
	</tr>
	
	<table><tr></tr></table>
	
	</table>
		
		<table border="1" width="1200">
	
	<tr>
		<td width="5%" align="center">직장주소</td>
 		<td width="10%" colspan='3'>
 			${joininfo.caddr }
 		</td>  
 		<td width="5%" align="center">직장전화</td>
 		<td width="10%">
 			${joininfo.ctel }
 		</td>
	</tr>
	 
	<tr>
 		<td width="5%" align="center">직장명</td>
 		<td width="10%">
 		${joininfo.cpy }
 		</td>
 		<td width="5%" align="center">부서명</td>
 		<td width="10%">
 			${joininfo.cdeptno }
 		</td>
 		<td width="5%" align="center">직책명</td>
 		<td width="10%">
			${joininfo.cposition }
		</td>
	</tr>

	
	</table>
	
	<table><tr></tr></table>
	
	
	
		
	
	
	<table>
		<tr>
			<td>
				<a href="<%=request.getContextPath()%>/showMain">이전화면</a>
				<a href="creditUpdate">수정</a>	
		</tr>
	</table>
</form>	
</body>
</html>
