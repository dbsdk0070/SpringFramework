<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border : 1px solid black;
		margin : 0 auto;
	}
	th{
		width: 100px;
	}
	td{
		width: 250px;}
</style>
<script>
	var id_check = false;
	
	function signup_check(){
		
		if(document.signUpInfo.user_id.value.trim() == ""){
			alert("아이디를 입력하세요.");
			document.signUpInfo.user_id.value="";
			document.signUpInfo.user_id.focus();
				return false;
		}
		document,signUpInfo.submit();
	}
</script>
</head>
<body>
<p style="margin-left: 170px; margin-bottom: 5px;"><a href="list.do">List</a></p>
<div id="container">
	<form action="signup.do" method="post" name="signUpInfo">
	<table>
		<tr>
			<th>id</th>
			<td><input type="text" name="user_id">
			<input type="button" name="idcheck" value="중복확인"/>
			</td>
		</tr>
		<tr>
			<th>pw</th>
			<td><input type="text" name="user_pw"></td>
		</tr>
		<tr>
			<th>pw check</th>
			<td><input type="text" name="user_pw_check"></td>
		</tr>
		<tr>
			<th>name</th>
			<td><input type="text" name="user_name"></td>
		</tr>
		<tr>
			<th>phone</th>
			<td>
			<input type="text" name="user_phone1" style="width: 41px;"/>-
			<input type="text" name="user_phone2" style="width: 41px;"/>-
			<input type="text" name="user_phone3" style="width: 41px;">
			</td>
		</tr>
		<tr>
			<th>postNo</th>
			<td><input type="text" name="user_addr1"></td>
		</tr>
		<tr>
			<th>address</th>
			<td><input type="text" name="user_addr2"></td>
		</tr>
		<tr>
			<th>company</th>
			<td><input type="text" name="user_company"></td>
		</tr>
	</table>
	<p style="margin-left: 500px;"><input type="button"value="join" onclick="signup_check(this.form)"></p>
	</form>
</div>
</body>
</html>