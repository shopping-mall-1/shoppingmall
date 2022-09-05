<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
function IDSearchCheck(){

	if($("#name").val() == "") { alert("이름을 입력하세요."); $("#name").focus();  return false; }
	if($("#tel").val() == '') { alert("전화번호를 입력하세요."); $("#tel").focus(); return false; }
	$("#IDSearchForm").attr("action", "IDView.jsp").submit();
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
   
.IDSearchForm {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  border:5px solid gray;
  border-radius: 30px;
}   
   
.nameForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.telForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.name, .tel {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn_IDSearch  {
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

<%

	String check = request.getParameter("check")==null?"true":request.getParameter("check");

%>

<body>

<div class="home_body_div" align=center>

	<form name="IDSearchForm" class="IDSearchForm" id="IDSearchForm" method="post">
     	<h1>아이디 찾기</h1>
     	<div class="IDSearchFormDivision">
         	<div class="nameForm"><input type="text" name="name" id="name" class="name" placeholder="이름을 입력해주세요"></div>
         	<div class="telForm"><input type="text" id="tel" name="tel" class="tel" onkeydown="press(this.form)" placeholder="전화번호를 숫자만 입력하세요"></div>
         	<% if(check.equals("fail")){ %>
          		<p style="text-align: center; color:#5F0080;">입력한 조건에 맞는 사용자가 존재하지 않습니다. 확인 후 다시 입력해주세요</p>
          	<%} %>	
          	<input type="button" id="btn_IDSearch" class="btn_IDSearch" value="아이디 찾기" onclick="IDSearchCheck()"> 
     	</div> 
	</form>

</div>

</body>
</html>