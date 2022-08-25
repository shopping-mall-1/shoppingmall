<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

function loginCheck(){
	
	if(document.loginForm.id.value == ''){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(document.loginForm.password.value == ''){
		alert("패스워드를 입력해주세요");
		return false;
	}
	document.loginForm.action = 'loginCheck.jsp';
	document.loginForm.submit();
}


function press(){
	
	if(event.keyCode == 13){loginCheck();}
	
}

</script>

<meta charset="utf-8">
<title>로그인</title>

<style>
body { font-family: "HY견고딕", "HY견고딕" }
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
   
.login {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  border:5px solid gray;
  border-radius: 30px;
}   
.id, .name, .passwd {
  width: 80%;
  border: none;
  border-bottom: 2px solid #adadad;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
  margin-top: 20px;
}
.bottomText {
  text-align: center;
  font-size: 20px;
}
.login_btn  {
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

.join_btn  {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: white;
  background-position: left;
  background-size: 200%;
  color:#5F0080;
  font-weight: bold;
  border-style:solid;
  border-color:#5F0080;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.id_find{
  position:relative;
  left:40%;
  text-align:right;
  transform: translateX(-50%);
  width:80%;
  height:40px;
  background: white;
  background-position: left;
  background-size: 10%;
  color:gray;
  border:none;
  font-weight: bold;
  cursor:pointer;
  transition: 0.4s;
 }
  .password_find{
  position:relative;
  left:40%;
  text-align:right;
  transform: translateX(-50%);
  width:80%;
  height:40px;
  background: white;
  background-position: left;
  background-size: 10%;
  color:gray;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
 }
</style>
</head>
<body>
<br><br><br>
<div class="main" align="center">
	<div class="login">
		<h1>로그인</h1>
		<form name="loginForm" id="loginForm" class="loginForm" method="post"> 
			<input type="text" name="id" id="id" class="id" placeholder="아이디를 입력해주세요.">
         	<input type="password" id="password" name="password" class="passwd" onkeydown="press(this.form)" placeholder="비밀번호를 입력해주세요.">
         	<br><br>
			<input type="button" id="find" class="id_find" value="아이디 찾기" onclick="location.href='searchID.jsp'">
			<input type="button" id="find" class="password_find" value="비밀번호 찾기" onclick="location.href='searchPassword.jsp'">
     		<input type="button" id="btn_login" class="login_btn" value="로그인" onclick="loginCheck()"> 
     		<input type="button" id="btn_join" class="join_btn" value="회원가입" onclick="location.href='signup.jsp'" > 
		</form>
      
	</div>

 
</div>

</body>
</html>

