<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WebMarket 회원가입</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

function sample6_execDaumPostcode() {

    new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수
	
	
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}
			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
	
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
	
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}
	 
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('sample6_address').value = fullAddr;
			
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('sample6_address2').focus();
		}

	}).open();
}

</script>
<style>
body { font-family: "나눔고딕", "맑은고딕" }
h1 { font-family: "HY견고딕" }

.registerForm {
  width:900px;
  height:auto;
  padding: 10px, 10px;
  background-color:#FFFFFF;
  border:4px solid gray;
  border-radius: 20px;
}
.id, .name, .passwd, .passwd1, .tel, .address, .email {
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
.btn_register  {
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

	$(document).ready(function(){
	
		$("#btn_register").click(function(){
			
			if($("#id").val() == '') { alert("아이디를 입력해주세요."); $("#id").focus();  return false; }
			if($("#name").val() == '') { alert("이름을 입력해주세요."); $("#name").focus(); return false; }
			var Pass = $("#passwd").val();
			var Pass1 = $("#passwd1").val();
			if(Pass == '') { alert("비밀번호를 입력해주세요."); $("#passwd").focus(); return false; }
			if(Pass1 == '') { alert("비밀번호를 한번 더 입력해주세요."); $("#passwd1").focus(); return false; }
			if(Pass != Pass1) 
				{ alert("입력된 비밀번호를 확인해보세요"); $("#passwd1").focus(); return false; }
			
			// 암호유효성 검사
			var num = Pass.search(/[0-9]/g);
		 	var eng = Pass.search(/[a-z]/ig);
		 	var spe = Pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);	
			if(Pass.length < 8 || Pass.length > 20) { alert("암호는 8자리 ~ 20자리 이내로 입력해주세요."); return false; }
			else if(Pass.search(/\s/) != -1){ alert("비밀번호는 공백 없이 입력해주세요."); return false; }
			else if(num < 0 || eng < 0 || spe < 0 ){ alert("비밀번호는 영문,숫자,특수문자를 혼합하여 입력해주세요."); return false; }
			
		 	if($("#tel").val() == '') { alert("전화번호를 입력해주세요."); $("#tel").focus(); return false; }
		 	//전화번호 문자열 정리
			var beforeTel = $("#tel").val();
		 	var afterTel = beforeTel.replace(/\-/gi,"").replace(/\ /gi,"").trim();
		 	//console.log("afterTel : " + afterTel);
		 	$("#tel").val(afterTel);
		 	if($("#address").val() == '') { alert("주소를 입력해주세요."); $("#address").focus(); return false; }
			if($("#email").val() == '') { alert("예 : WebMarket@market.com"); $("#email").focus(); return false; }
			
			$("#registerForm").attr("action","memberRegistry.jsp").submit();	
		});
		
		$("#id").change(function(){
			
			$.ajax({
				url: "idCheck.jsp",
				type: "post", 
				datatype: "json",
				data: {"id": $("#id").val()},
				success: function(data){
					var jsonInfo = JSON.parse(data);
					console.log("jsonInfo = " + jsonInfo)
					if(jsonInfo.id_count == 1 ){
						$("#checkID").html("동일한 아이디가 존재합니다. 새로운 아이디를 입력하세요.");
						$("#id").val("").focus();
					}else $("#checkID").html("사용 가능한 아이디입니다.");
				}
			});

		});
		
	});
	
</script>

</head>
<body>
<br><br><br>

<div class="main" align="center">
  <div class="registerForm">
	      
    <h1>회원가입</h1>
    <form name="registerForm" id="registerForm" method="post"> 
        <input type="text" id="id" name="id" class="id" placeholder="아이디를 입력해주세요">
        <p id="checkID" style="color:red;text-align:center;"></p>
	    <input type="text" id="name" name="name" class="name" placeholder="이름을 입력해주세요">
        <input type="password" id="passwd" name="password" class="passwd" placeholder="비밀번호를 입력해주세요">
        <p style="color:#5F0080;text-align:center;">※ 8~20이내의 영문자, 숫자, 특수문자 조합으로 암호를 만들어 주세요.</p>
        <input type="password" id="passwd1" name="passwd1" class="passwd1" placeholder="비밀번호를 한번 더 입력해주세요">
        <input type="text" id="tel" name="tel" class="tel" placeholder="숫자만 입력해주세요">
        

  <TH> </TH>
  <TD>
<br>
    <input type="text" name="zipcode" size="7" id="sample6_postcode" placeholder="우편번호">
    <input type="button" class="btn btn-primary btn-sm" value="주소검색" onclick="sample6_execDaumPostcode()">
  </TD>

</TR>

<TR><br>
  <TH>주소</TH>
  <TD>
    <input type="text" name="address1" size="40" id="sample6_address" readonly placeholder="주소검색을 이용하여 입력해주세요"> <br>
    <input type="text" name="address2" size="40" id="sample6_address2" placeholder="상세주소를 입력해주세요.">
  </TD>
</TR>
		<input type="text" id="email" name="email" class="email" placeholder="예 : WebMarket@market.com">
		<input type="button" id="btn_register" class="btn_register" value="가입하기" >
		<input type="button" id="btn_cancel" class="btn_cancel" value="취소" onclick="history.back()">
	</form>

  </div>
</div>
<br><br>
</body>
</html>