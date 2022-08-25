<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>패스워드 찾기</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
function pwSearchCheck(){

	if($("#id").val() == "") { alert("아이디를 입력하세요."); $("#id").focus();  return false; }
	if($("#name").val() == '') { alert("이름을 입력하세요."); $("#name").focus(); return false; }
	$("#pwSearchForm").attr("action", "tempPWView.jsp").submit();
}

function press() {
	if(event.keyCode == 13){ pwSearchCheck(); }
}

</script>
<style>
body { font-family: "나눔고딕", "맑은고딕" }
h1 { font-family: "HY견고딕" }
a:link { color: black; }
a:visited { color: black; }
a:hover { color: blue; }
a:active { color: red; }
#hypertext { text-decoration-line: none; cursor: hand; }
#topBanner {
       margin-top:10px;
       margin-bottom:10px;
       max-width: 500px;
       height: auto;
       display: block; margin: 0 auto;
}
   
.pwSearchForm {
 width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  border:5px solid gray;
  border-radius: 30px;
}   
   
.idForm{
   border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.nameForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id, .name {
width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn_pwSearch  {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 20px;
  width:80%;
  height:40px;
  background:#5F0080 ;
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
</head>

<body>

<%

	String check = request.getParameter("check")==null?"true":request.getParameter("check");

%>

<div class="home_body_div" align=center>

	<form name="pwSearchForm" class="pwSearchForm" id="pwSearchForm" method="post">
     	<h1>임시 패스워드 발급</h1>
     	<div class="pwSearchFormDivision">
         	<div class="idForm"><input type="text" name="id" id="id" class="id" placeholder="아이디를 입력하세요."></div>
         	<div class="nameForm"><input type="text" id="name" name="name" class="name" onkeydown="press(this.form)" placeholder="이름을 입력하세요."></div>
         	<% if(check.equals("fail")) { %>
         		<p style="text-align: center; color:red;">입력한 조건에 맞는 사용자가 존재하지 않습니다. 확인 후 다시 입력하세요</p>
         	<% } %>
         	<p id="tempPW"></p>
         	<input type="button" id="btn_pwSearch" class="btn_pwSearch" value="임시 패스워드 발급" onclick="pwSearchCheck()"> 
     	</div> 
	</form>

</div>

</body>
</html>