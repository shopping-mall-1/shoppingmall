<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>사용자 암호 수정</title>
<style>
body { font-family: "맑은고딕", "맑은고딕" }
h1 { font-family: "맑은고딕" }
a:link { color: black; }
a:visited { color: black; }
a:hover { color: red; }
a:active { color: red; }
#hypertext { text-decoration-line: none; cursor: hand; }

.modifyForm {
  width:900px;
  height:auto;
  padding: 10px, 10px;
  background-color:#FFFFFF;
  border:4px solid purple;
  border-radius: 20px;
}
.oldpassword, .password, .password1 {
  width: 80%;
  border:none;
  border-bottom: 2px solid #adadad;
  margin: 5px;
  padding: 10px 10px;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn_modify  {
 position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: #5F0080;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn_cancel  {
  position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: #CBB0EB;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

</style>

<script>

function modify(){
	
	var oldPass = document.getElementById('oldpassword').value;
	var newPass = document.getElementById('password').value;
	var newPass1 = document.getElementById('password1').value;
	if(oldPass == '') { alert("현재 암호를 입력해주세요."); document.modifyForm.oldpassword.focus(); return false; }
	if(newPass == '') { alert("새 암호를 입력해주세요."); document.modifyForm.password.focus(); return false; }
	if(newPass1 == '') { alert("새 암호를 입력해주세요."); document.modifyForm.password1.focus(); return false; }
	if(newPass != newPass1) 
		{ alert("입력된 새 암호를 확인해주세요"); document.modifyForm.password1.focus(); return false; }
	
	//암호 유효성 검사
	var num = newPass.search(/[0-9]/g);
 	var eng = newPass.search(/[a-z]/ig);
 	var spe = newPass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);	
	if(newPass.length < 8 || newPass.length > 20) { alert("암호는 8자리 ~ 20자리 이내로 입력해주세요."); return false; }
	else if(newPass.search(/\s/) != -1){ alert("암호는 공백 없이 입력해주세요."); return false; }
	else if(num < 0 || eng < 0 || spe < 0 ){ alert("암호는 영문,숫자,특수문자를 혼합하여 입력해주세요."); return false; }

	document.modifyForm.action = 'memberInfoPasswordModify.jsp';
	document.modifyForm.submit();
	
}

</script>

</head>

<%

	String id = (String)session.getAttribute("id");
	if(id == null) response.sendRedirect("login.jsp");
	
	String check = request.getParameter("check")==null?"":request.getParameter("check");

%>

<body>
<br><br>
<div class="panel-body" align="center">

	<form name="modifyForm" method="post" class="modifyForm" onsubmit="modify()">
	
		<h1>사용자 암호 수정</h1>
		<input type="password" id="oldpassword" name="oldpassword" class="oldpassword" placeholder="현재 암호를 입력해주세요.">
		<%if(check.equals("fail")) {%>		
			<p style="color:purple;">현재 사용중인 암호를 잘못 입력했습니다. 현재 암호를 다시 입력 하세요.</p>    
		<%} %>
		<input type="password" id="password" name="password" class="password" placeholder="새 암호를 입력해주세요.">
		<input type="password" id="password1" name="password1" class="password1" placeholder="새 암호를 확인해주세요.">
		<p style="color:purple;text-align:center;">※ 8~20이내의 영문자, 숫자, 특수문자 조합으로 암호를 만들어 주세요.</p>
		<input type="button" class="btn_modify" value="수정" onClick="modify()">
		<input type="button" class="btn_cancel" value="취소" onclick="history.back()">

	</form>
<br><br>

</div>

</body>

</html>