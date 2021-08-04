<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>credit</title>
</head>
<style>
	.cardShow{
		display:none;
		position:absolute;
		border:1px solid gray;
		border-radius:5px;
	}
	.cardShow>img{
		padding:10px;
	}
	
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		function random(){
			var number;
			number = Math.floor(Math.random()*10000000000000000)+ 1000000000000000;
			return number;
		}
		
		$("#cardnum").val(String(random()));
		
		
		var localNum = ['02','031','032','033','041','042','043','044','051',
			'052','053','054','055','061','062','063','064','070']	
		var numTag;
		localNum.map(function(value,index){
			numTag += "<option>"+value+"</option>";
		});
		$("#htel1").append(numTag);
		$("#ctel1").append(numTag);
		
		//다음 주소 api
		$(document).on("click","#doro",function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            $('#haddr').val(data.address);
		            $('#haddr2').val("("+data.bname+")");
		        }
		    }).open();
		});
		
		$(document).on("click","#caddrSeach",function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            $('#caddr').val(data.address);
		        }
		    }).open();
		});
		
	
		//자택전화 on, off --> off 일경우 #htelCheck 값이 넘어감 -> 
		$(document).on("click","#htelCheck",function(){
			console.log($(this).val(),"<--뭐나오니");
			if($(this).is(":checked")==true){
				$("#htel1").attr("disabled",true);
				$("#htel2").attr("disabled",true);
			}else{
				$("#htel1").attr("disabled",false);
				$("#htel2").attr("disabled",false);
			}
		});
		//sms on,off
		$(document).on("click","#smsCheck",function(){
			console.log($(this).val(),"<--뭐나오니2");
			if($(this).is(":checked")==true){
				$("#sms").attr("disabled",true);
			}else{
				$("#sms").attr("disabled",false);
			}
		});
		
		//checkbox 값 1개만 선택되게 하기
		$(document).on("click",".oneCheck",function(){
			//클릭한 체크박스의 네임값 가져오기
			var name = $(this).attr("name");
			
			$("input[name="+name+"]").prop("checked",false);
			$(this).prop("checked",true);
		});
		
		//기타, 별도청구지 등 별개의 값을 선택시 disabled 풀리게 하기
		 $(document).on("click",".oneCheck",function(){
			if($("#payMaxETC").is(":checked")==true){
				$("#payMaxinput").attr("disabled",false);
				$(document).on("keyup","#payMaxinput",function(){
					$("#payMaxETC").val($("#payMaxinput").val()+"0000");
				})	
			}else{
				$("#payMaxinput").attr("disabled",true);
				$("#payMaxinput").val("");
			}
			
			if($("#payMethodCheck").is(":checked")==true){
				$("#payaddr").attr("disabled",false);
				$("#paytel").attr("disabled",false);
			}else{
				$("#payaddr").attr("disabled",true).val("");
				$("#paytel").attr("disabled",true).val("");
			}
			
			if($("#payaccType").is(":checked")==true){
 				$("#payaccMethod").attr("disabled",false);
 				$("#payaccType").val($("#payaccMethod").val());
 				$(document).on("click","#payaccMethod",function(){
 					 $("#payaccType").val($("#payaccMethod").val());
 				})
			}else{
				$("#paycaaMethod").attr("disabled",true);
				$("#payaccType").val("");
			}
		});
		//한글 이름
		var regK = /^[ㄱ-ㅎ가-힣]{2,15}$/; 
		$("#kname").focusout(function(){
			if(!regK.test($("#kname").val())){
				alert("한글성명은 한글만 사용가능합니다.");
				$("#kname").val("");
			}
		});	
		$("#fkname").focusout(function(){
			if(!regK.test($("#fkname").val())){
				alert("가족한글성명은 한글만 사용가능합니다.");
				$("#fkname").val("");
			}
		});
		//영어 이름	
		var regE =  /^[a-zA-Z\s]{1,20}$/; 
		$("#ename").keyup(function(){
			if(!regE.test($("#ename").val())){
				alert("영어성명은 영어만 사용 가능합니다.");
				$("#ename").val("");
			}
			var ups = $("#ename").val();
			$("#ename").val(ups.toUpperCase());
		});
		$("#fename").keyup(function(){
			if(!regE.test($("#ename").val())){
				alert("가족영어성명은 영어만 사용 가능합니다.");
				$("#fename").val("");
			}
			var ups = $("#fename").val();
			$("#fename").val(ups.toUpperCase());
		});
		
		
		
		
		//생년월일
		var regB = /^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		$("#birth").focusout(function(){
			if(!regB.test($("#birth").val())){
				alert("생년월일은 EX) 20010507 형식으로 8자리를 작성해 주세요");
				$("#birth").val("");
			}	
		});
		$("#fbirth").focusout(function(){
			if(!regB.test($("#fbirth").val())){
				alert("가족 생년월일은 EX) 20010507 형식으로 8자리를 작성해 주세요");
				$("#fbirth").val("");
			}	
		});
		
	
	
		//자택전화번호 뒷자리
		var regT = /^[0-9]{7}$/;
		$("#htel2").focusout(function(){
			if(!regT.test($("#htel2").val())){
				alert("7자리 숫자를 정확하게 입력해주세요");
				$("#htel2").val("");
			}	
		})
		//직장전화 뒷번호
		$("#ctel2").focusout(function(){
			if(!regT.test($("#ctel2").val())){
				alert("7자리 숫자를 정확하게 입력해주세요");
				$("#ctel2").val("");
			}	
		})
		
		//핸드폰 뒷자리
		var regP = /^[0-9]{8}$/;
		$("#phone2").focusout(function(){
			if(!regP.test($("#phone2").val())){
				alert("8자리 숫자를 정확하게 입력해 주세요");
				$("#phone2").val("");
			}	
		})
		$("#fphone2").focusout(function(){
			if(!regP.test($("#fphone2").val())){
				alert("8자리 숫자를 정확하게 입력해 주세요");
				$("#fphone2").val("");
			}	
		})
		
		//별도 SMS
		var regS = /^01([0,1,6,7,9])([0-9]{8})$/
			$("#sms").focusout(function(){
				if(!regS.test($("#sms").val())){
					alert("휴대폰 번호 11자리를 정확하게 입력해주세요");
					$("#sms").val("");
				}	
			})
		
		var regSinhan = /^[0-9]{12}$/
		var regIbk = /^[0-9]{14}$/
		var regKooK = /^[0-9]{14}$/
		var regHANA = /^[0-9]{14}$/
		var regWoori = /^[0-9]{13}$/
		var regNong = /^[0-9]{13}$/
		var regSC = /^[0-9]{11}$/
		$("#paybank").on({
			keyup : function(){
				this.value=this.value.replace(/[^0-9]/g,'');
			},
			
			focusout : function(){
				if($("#payaccType").val()=="신한은행"){
					if(!regSinhan.test($("#paybank").val())){
						alert("신한은행 계좌번호를 정확하게 입력해주세요(12자리)");
						$("#paybank").val("");
					}
				}else if($("#payaccType").val()=="국민은행"){
					if(!regKooK.test($("#paybank").val())){
						alert("국민은행 계좌번호를 정확하게 입력해주세요(14자리)");
						$("#paybank").val("");
					}
				}else if($("#payaccType").val()=="우리은행"){
					if(!regWoori.test($("#paybank").val())){
						alert("우리은행 계좌번호를 정확하게 입력해주세요(13자리)");
						$("#paybank").val("");
					}
				}else if($("#payaccType").val()=="농협"){
					if(!regNong.test($("#paybank").val())){
						alert("농협은행 계좌번호를 정확하게 입력해주세요(13자리)");
						$("#paybank").val("");
					}
				}else if($("#payaccType").val()=="SC제일은행"){
					if(!regSC.test($("#paybank").val())){
						alert("SC제일은행 계좌번호를 정확하게 입력해주세요(11자리)");
						$("#paybank").val("");
					}
				}else if($("#payaccType").val()=="하나은행"){
					if(!regSC.test($("#paybank").val())){
						alert("하나은행 계좌번호를 정확하게 입력해주세요(14자리)");
						$("#paybank").val("");
					}
				}else if($("#payaccType").val()=="" && $("#payacc").is(":checked")==false){
						alert("결제은행 부터 선택해 주세요");
						$("#paybank").val("");
				}else{
					if(!regIbk.test($("#paybank").val())){
						alert("계좌번호를 정확하게 입력해주세요(14자리)");	
						$("#paybank").val("");
					}
				}
				
			}
		})
		
		var regPM = /^[0-9]{1,10}$/
		$("#payMaxinput").focusout(function(){
			if(!regPM.test($("#payMaxinput").val())){
				alert("요청최고한도는 숫자만 입력 가능합니다");
				$("#payMaxinput").val("");
			}
		});
		$("#fmax").focusout(function(){
			if(!regPM.test($("#fmax").val())){
				alert("가족한도는 숫자만 입력 가능합니다");
				$("#fmax").val("");
			}
		});
		
		$("#cdeptno").focusout(function(){
			if(!regK.test($("#cdeptno").val())){
				alert("부서명은 한글만 가능합니다.");
			}
			
		})
		
		$("#cposition").focusout(function(){
			if(!regK.test($("#cposition").val())){
				alert("직책명은 한글만 가능합니다.");
			}
		})
		
		
		$("#item").change(function(){
			if($("#item").val()=="어린이상품"){
				var tag = "<option>5세이하</option><option>6-10세</option><option>11-19세</option>";
				$("#itemService").html(tag);
			}else if($("#item").val()=="청소년상품"){
				var tag2 = "<option>20대</option><option>30대</option><option>40대</option>";
				$("#itemService").html(tag2);
			}else if($("#item").val()=="성인상품"){
				var tag3 = "<option>50대</option><option>60대</option><option>70세이상</option>";
				$("#itemService").html(tag3);
			}
		});
		
		
		var clientX;
		var clientY;
		$(".cardDesign").hover(function(){
			clientX = event.clientX;
			clientY = event.clientY;
			if($(this).val()==1){
				$("#card1").css("display","block").css("top",clientY+100).css("left",clientX-150);
			}else if($(this).val()==2){
				$("#card2").css("display","block").css("top",clientY+100).css("left",clientX-150);
			}else if($(this).val()==3){
				$("#card3").css("display","block").css("top",clientY+100).css("left",clientX-150);
			}
		},function(){
			if($(this).val()==1){
				$("#card1").css("display","none").css("top",clientY).css("left",clientX);
			}else if($(this).val()==2){
				$("#card2").css("display","none").css("top",clientY).css("left",clientX);
			}else if($(this).val()==3){
				$("#card3").css("display","none").css("top",clientY).css("left",clientX);
			}
		});
		
		
		//required 사용하려면 type='submit'로 해야한다.
		$(document).on("submit","#creditFrm",function(){
			var url = "creditjoinOk";
			var params = $("#creditFrm").serialize();

			if($("input[name=checks]:checked").length<=0){
				alert("승인내열알림서비스를 선택해 주세요");
				return false;
			}
			if($("input[name=payacc]:checked").length<=0){
 				alert("결제 은행을 선택해 주세요");
				return false;
			}
			if($("input[name=paymax]:checked").length<=0){
				alert("요청최고한도를 선택해 주세요");
				return false;
			}
			if($("input[name=payMethod]:checked").length<=0){
				alert("청구서 수령지를 선택해 주세요");
				return false;
			}
			if($("input[name=brand]:checked").length<=0){
				alert("브랜드 구분을 선택해 주세요");
				return false;
			}
			if($("input[name=addfc]:checked").length<=0){
				alert("추가기능을 선택해 주세요");
				return false;
			}
			if($("input[name=foregin]:checked").length<=0){
				alert("해외이용 여부를 선택해 주세요");
				return false;
			}
			if($("input[name=cardDesign]:checked").length<=0){
				alert("카드 디자인을 선택해 주세요");
				return false;
			}
			console.log("<--- 왜 안될까앙1");
			$.ajax({
				url : url,
				data : params,
				success : function(result){
					if(result.substr(0,1)){
						alert("성공");
						alert("카드번호"+$("#cardnum").val()+"회원번호"+result.substr(1));
						location.href="<%=request.getContextPath()%>/";
					}else{
						alert("카드등록 실패");
					}
				},error : function(e){
					alert("실패");
					console.log("<--- 왜 안될까앙3");
				}
			});
			console.log("<--- 왜 안될까앙4")
		});
		
	});
	/* 승인알림서비스/결제은행/요청최고한도/청구서수령지/브렌드구분/카드디자인선택/추가기능/해외이용 */
</script>
<body>
<form id="creditFrm" class="credit" onsubmit="return false">
	<table border="1" width="1200">  
	<tr>신용카드 입회신청서</tr>
	<tr>
 		<td width="5%" align="center">한글성명</td>
 		<td width="10%">
 			<input name="kname" class="koreaName" id="kname" type="text" size="30" value="" >
 		</td>
 		<td width="5%" align="center">영문명</td>
 		<td width="10%">
 			<input name="ename" id="ename" type="text" size="30" value="" >
 		</td>
 		<td width="5%" align="center">생년월일</td>
 		<td width="10%">
			<input name="birth" id="birth" type="text" size="40" maxlength="10" placeholder="ex)20000305" value="">
		</td>
	</tr>
	
	<tr>
		<td width="5%" align="center">자택주소</td>
 		<td width="20%" colspan='1'>
 			<input name="haddr" id="haddr" type="text" size="10"  style="width:200px;" readonly value="">
 			<input type="button" id="doro" value="주소찾기 " width="30%" size="30" >  
 		</td>  
 		<td width="5%" align="center">상세주소</td>
			<td width="10%" colspan='1' >
 			<input name="haddr2" id="haddr2" type="text" size="30" readonly value="">
 		</td> 
 		
 		
 		<td width="5%" align="center">자택전화</td>
 		<td width="10%">
 			<select name="htel1" id="htel1"></select>
 			<input name="htel2" id="htel2" type="text" size="10" maxlength="7" value="">
 			<input type="checkbox" id="htelCheck">없음
 		</td>
	</tr>
	
	
	
	<tr>
 		<td width="5%" align="center">휴대전화</td>
 		<td width="10%">
 			<select name="phone1" value="">
 				<option>010</option>
 				<option>011</option>
 				<option>016</option>
 				<option>017</option>
 				<option>019</option>
 			</select>
 			<input name="phone2" id="phone2" type="text" size="20" maxlength="8" value="">
 		</td>
 		
 		<td width="5%" align="center">별도SMS</td>
 		<td width="10%">
 			<input name="sms" id="sms" type="text" size="20" maxlength="11" value="">
 			<input type="checkbox" id="smsCheck">없음
 		</td>
 		
 		
 		<td width="5%" align="center">이메일</td>
 		<td width="10%">
			<input name="email1" type="text" size="10" value="">
			@
			<select name="email2" value="">
 				<option>naver.com</option>
 				<option>daum.net</option>
 				<option>nate.com</option>
 				<option>gmail.com</option>
 			</select>
		</td>
	</tr>

	<tr>
		<td width="5%" colspan='2'  align="center">승인내역알림서비스</td>
 		<td width="10%" colspan='7'> 
			<input type="checkbox" class="oneCheck" name="checks" value="유료SMS">유료SMS
			<input type="checkbox" class="oneCheck" name="checks" value="유료카카오알림톡">유료카카오알림톡
			<input type="checkbox" class="oneCheck" name="checks" value="무료SMS">무료SMS
			<input type="checkbox" class="oneCheck" name="checks" value="무료카카오알림톡">무료카카오알림톡
 		</td>  
	</tr>
	
	<tr>
 		<td width="5%" align="center">결제은행</td>
 		<td width="10%">
 			<input type="checkbox" class="oneCheck" name="payacc" id="payacc" value="IBK기업은행">IBK기업은행
			<input type="checkbox" class="oneCheck" name="payacc" id="payaccType" value="">기타
			<select id="payaccMethod" disabled>
 				<option>신한은행</option>
 				<option>농협</option>
 				<option>우리은행</option>
 				<option>국민은행</option>
 				<option>하나은행</option>
 				<option>SC제일은행</option>
 			</select>
 		</td>
 		<td width="5%" align="center">계좌번호</td>
 		<td width="10%">
 			<input name="paybank" id="paybank" type="text" size="30" value="">
 		</td>
 		<td width="5%" align="center">결제일</td>
 		<td width="10%">
			<select name="paydate" id="paydate" value="">
				<option>1일</option>
				<option>10일</option>
				<option>15일</option>
				<option>20일</option>
			</select>
		</td>
	</tr>
		
	<tr>
		<td width="5%" colspan='2'  align="center">요청최고한도</td>
 		<td width="10%" colspan='7'> 
			<input type="checkbox" class="oneCheck" name="paymax" value="50000000">5천만원
			<input type="checkbox" class="oneCheck" name="paymax" value="30000000">3천만원
			<input type="checkbox" class="oneCheck" name="paymax" value="10000000">1천만원
			<input type="checkbox" class="oneCheck" id="payMaxETC" name="paymax" value="">기타 
			<input id="payMaxinput" type="text" size="20" disabled>만원
 		</td>  
	</tr>

	<tr>
		<td width="10%" colspan='1'  align="center">청구서수령지</td>
 		<td width="10%" colspan='8'> 
			<input type="checkbox" class="oneCheck" name="payMethod" value="이메일">이메일
			<input type="checkbox" class="oneCheck" name="payMethod" value="직장">직장
			<input type="checkbox" class="oneCheck" name="payMethod" value="자택">자택
			<input type="checkbox" class="oneCheck" name="payMethod" value="발송제외">발송제외
			<input type="checkbox" class="oneCheck" name="payMethod" id="payMethodCheck" value="별도청구지">별도청구지
			(주소<input name="payaddr" id="payaddr" type="text" size="20" disabled>
			전화번호 <input name="paytel" id="paytel" type="text" size="15" disabled>)
			 
 		</td>  
	</tr>
	
	<table><tr></tr></table>
	
	</table>
		
		<table border="1" width="1200">
	
	<tr>
		<td width="5%" align="center">직장주소</td>
 		<td width="10%" colspan='3'>
 			<input name="caddr" id="caddr" type="text" size="60" readonly value="">
 			<input type="button" id="caddrSeach" value="주소찾기 " width="30%" size="30">  
 		</td>  
 		<td width="5%" align="center">직장전화</td>
 		<td width="10%">
 			<select name="ctel1" id="ctel1" value=""></select>
 			<input name="ctel2" type="text" size="10" value="">
 		</td>
	</tr>
	 
	<tr>
 		<td width="5%" align="center">직장명</td>
 		<td width="10%">
 			<input name="cpy" id="cpy" type="text" size="20" value="">
 		</td>
 		<td width="5%" align="center">부서명</td>
 		<td width="10%">
 			<input name="cdeptno" id="cdeptno" type="text" size="30" value="">
 		</td>
 		
 		<td width="5%" align="center">직책명</td>
 		<td width="10%">
 			<input name="cposition" id="cposition" type="text" size="30" value="">
 		</td>
	</tr>

	
	</table>
	
	<table><tr></tr></table>
	
	<table id="target1" border="1" width="1200">
		<tr>
 			<td width="5%" align="center">가족한글성명</td>
 			<td width="10%">
 				<input name="fkname" id="fkname" type="text" size="20" value="">
 			</td>
 			<td width="5%" align="center">영문명</td>
 			<td width="10%">
 				<input name="fename" id="fename" type="text" size="30" value="">
 			</td>
 			<td width="5%" align="center">생년월일</td>
 			<td width="10%">
				<input name="fbirth" id="fbirth" type="text" size="20" maxlength="8" value="">
			</td>
		</tr>
		
		<tr>
 			<td width="5%" align="center">가족관계</td>
 			<td width="10%">
 				<input name="frel" type="text" size="20" value="">
 			</td>
 			<td width="5%" align="center">가족한도</td>
 			<td width="10%">
 				<input name="fmax" id="fmax" type="text" size="20" value="">만원
 			</td>
 			<td width="5%" align="center">휴대전화</td>
 			<td width="10%">
 			<select name="fphone1" value="">
 				<option>010</option>
 				<option>011</option>
 				<option>016</option>
 				<option>017</option>
 				<option>019</option>
 			</select>
 			<input name="fphone2" id="fphone2" type="text" size="10" maxlength="8" value="">
 			</td>
		</tr>
	</table>
	
	<table><tr></tr></table>
	
	
	<table id="target2" border="1" width="1200">
		<tr>
 			<td width="5%" align="center">상품명</td>
 			<td width="10%">
 				<select name="item" id="item" value="">
 					<option>어린이상품</option>
 					<option>청소년상품</option>
 					<option>성인상품</option>
 				</select>
 			</td>
 			
 			<td width="5%" align="center" rowspan="2">관련추가사항</td>
 			<td width="10%" colspan="3">상품서비스 선택
				<select name="itemService" id="itemService" value="">
					<option>5살이하</option>
					<option>5~10살</option>
					<option>10~19살</option>
 				</select>
			</td>
		</tr>
		
		<tr>
 			<td width="5%" align="center">브랜드구분</td>

 			<td width="10%"> 
				<input type="checkbox" class="oneCheck" name="brand" value="국내">국내
				<input type="checkbox" class="oneCheck" name="brand" value="마스타">마스타
				<input type="checkbox" class="oneCheck" name="brand" value="비자">비자
				<input type="checkbox" class="oneCheck" name="brand" value="Unionpay">Unionpay
				<input type="checkbox" class="oneCheck" name="brand" value="BC글로벌">BC글로벌
 			</td>  
 			<td width="5%" align="center" colspan='2'>카드디자인선택</td>
 			<td width="10%">
 				<input name="cardDesign" class="cardDesign" type="Radio" size="20" value="1">1
 				<input name="cardDesign" class="cardDesign" type="Radio" size="20" value="2">2
 				<input name="cardDesign" class="cardDesign" type="Radio" size="20" value="3">3
 				
 			</td>
 		
		</tr>
	
		<tr>
			<td width="5%" align="center" >추가기능</td>
			<td colspan='1' align="center">
 				<input type="checkbox" class="oneCheck" name="addfc" value="교통카드">교통카드
				<input type="checkbox" class="oneCheck" name="addfc" value="현금카드">현금카드
			</td>
 			<td width="5%" align="center">해외이용 on/off</td>
 			<td width="10%" colspan='3'>
				<input type="checkbox" class="oneCheck" name="foregin" value="ON">ON
				<input type="checkbox" class="oneCheck" name="foregin" value="OFF">OFF 
			</td>
		</tr>
		
	</table>
	
		
	
	
	<table>
		<tr>
			<td>
				<a href="/">이전화면</a>
				<input type="submit" id="submit" value="제출"/>
		</tr>
	</table>
	
	<input type="hidden" name="cardnum" id="cardnum">
	
</form>	
	<div id="card1" class="cardShow">
		<div style="border-bottom:1px solid gray; text-align:center;">디자인 1</div>
		<img style="width:400px; height:250px;" src="<%=request.getContextPath()%>/resources/images/credit-card1.png" />
	</div>
	
	<div id="card2" class="cardShow">
		<div style="border-bottom:1px solid gray; text-align:center;">디자인 2</div>
		<img style="width:400px; height:250px;" src="<%=request.getContextPath()%>/resources/images/credit-card2.png" />
	</div>
	
	<div id="card3" class="cardShow">
		<div style="border-bottom:1px solid gray; text-align:center;">디자인 3</div>
		<img style="width:400px; height:250px;" src="<%=request.getContextPath()%>/resources/images/credit-card3.png" />
	</div>
</body>
</html>
