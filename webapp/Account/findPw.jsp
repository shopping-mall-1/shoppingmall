<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

function idCheck(){
	
	if(document.idForm.id.value == ''){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(document.idForm.email.value == ''){
		alert("이메일을 입력해주세요");
		return false;
	}
	document.idForm.action = 'idCheck.jsp';
	document.idForm.submit();
}


function press(){
	
	if(event.keyCode == 13){idCheck();}
	
}

</script>

<meta charset="utf-8">
<title>아이디찾기</title>

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
   
.idform {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  border:5px solid gray;
  border-radius: 30px;
}   
.id, .name, .passwd {
  width: 150%;
  border: none;
  border-bottom: 2px solid #adadad;
  outline:black;
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
.id  {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 20px;
  width:80%;
  height:40px;
  background:none ;
  background-position: left;
  background-size: 200%;
  color:gray;
  font-weight: bold;
  border:2px solid gray;
  border-radius: 30px;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
.email  {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 20px;
  width:80%;
  height:40px;
  background:none ;
  background-position: left;
  background-size: 200%;
  color:gray;
  font-weight: bold;
  border:2px solid gray;
  border-radius: 30px;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
</style>
</head>
<body>
<br><br><br>
<div class="main" align="center">
	<div class="login">
		<h1>비밀번호찾기</h1>
		<form name="idForm" id="idForm" class="idForm" method="post"> 

			<input type="text" name="id" id="id" class="id" placeholder="아이디를 입력해주세요.">
			<br><br>
         	<input type="text" id="email" name="email" class="email" onkeydown="press(this.form)" placeholder="이메일을 입력해주세요.">
         	<br><br>
     		<input type="button" id="btn_login" class="login_btn" value="찾기" onclick="idCheck()"> 

		</form>
      
	</div>

 
</div>

</body>
</html>

