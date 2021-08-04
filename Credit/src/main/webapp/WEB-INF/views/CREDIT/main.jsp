<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<style>
	#backgrounds{
		display:none;
		z-index:1;
		width:100%;
		height:100%;
		background-color:gray;
		opacity:10%;
		position:absolute;
		top:0px;
		left:0px;
	}
	#test_modal, #test_modal2{
		display:none;
		width:300px;
		height:200px;
		background-color:#FFF;
		border:1px solid gray;
		border-radius:10px;
		z-index:2;
		position:absolute;
		
	}
	#top{
		height:50px;
		line-height:50px;
		border-bottom:1px solid gray;
	}
	#bottom{
		height:100px;
		line-height:50px;
	}
	#bottom>input{
		height:30px;
	}
	.credit{
		overflow:auto;
	}
</style>

<script type="text/javascript">
	
	

	$(function(){
		var x = window.innerWidth/2-150;
		var y = window.innerHeight/2-75;
			console.log(x,"<-x");
			console.log(y,"<-y");
			
			
		$(document).on("click","#mybtn1",function(){		
			$("#test_modal").attr("style","display:block").css("top",y).css("left",x);
			$("#backgrounds").css("display","block");
		});
		
		$(document).on("click","#mybtn2",function(){		
			$("#test_modal2").attr("style","display:block").css("top",y).css("left",x);
			$("#backgrounds").css("display","block");
		});
		
		$(document).on("click","#backgrounds",function(){
			$("#backgrounds").css("display","none");
			$("#test_modal").css("display","none");
			$("#test_modal2").css("display","none");
		});
		
		$(document).on("submit","#cusnoFrm",function(){
			var url = "loginOk";
			var param = $("#cusnoFrm").serialize();
			
			$.ajax({
				url : url,
				data : param,
				success : function(result){
					console.log(result);
					if(result=='N'){
						$("#backgrounds").css("display","none");
						$("#test_modal").css("display","none");
						$("#cusno").val("");
						$("#birth").val("");
						alert("로그인실패! 회원번호를 확인해 주세요");
					}else{
						location.href="<%=request.getContextPath()%>/showMain";
					}
				}, error:function(){
					console.log("실패");
				}
			})
		});
		
		
		
		$(document).on("click","#mybtn3",function(){
			location.href="<%=request.getContextPath()%>/credit";
		});
		
	});

	
</script>
<body align="center">
	<img src="<%=request.getContextPath() %>/resources/images/bank.png" width="750" height="480" style="margin-top:100px;">

	<table align="center">
	<tr>
		<td>
			<input id="mybtn1" type="button" value="고객번호로그인" >
			<input id="mybtn2" type="button" value="생년월일로그인" >
			<input id="mybtn3" type="button" value="카드신청" >
		</td>
	</tr>
	</table>
	<form id="cusnoFrm" class="credit" onsubmit="return false">
		<div id="test_modal">
			<div id="top">고객번호 로그인</div>
			<div id="bottom"> 
				<input type="text" id="cusno" name="cusno" placeholder="회원번호를 입력해 주세요" style="width:200px;"/>
				<input type="text" id="birth" name="birth" placeholder="생년월일을 입력해 주세요" style="width:200px;"/>
				<input type="submit" value="로그인" style="height:36px;  width:100px; float:right; margin-right:46px"/>
			</div>	
		</div>
	</form>	
	
	<div id="backgrounds"></div>
</body>
</html>
