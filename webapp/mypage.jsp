<%@page import="com.market.Member"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
.id, .name,  .tel, .address, .email {
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
.passwd{
position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 20px;
  width:80%;
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

.btn_cancel  {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-top: 20px;
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
	String id = (String)session.getAttribute("id");
	Member one = new Member();
    request.setCharacterEncoding("UTF-8");

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    // 모든 일반 회원의 데이터를 가져오는 쿼리문
    String q_getMemberList = "select id, name, password, tel, address, email from member where id='" + id + "'";
 
    try{
        DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
        stmt = con.createStatement();
        rs = stmt.executeQuery(q_getMemberList);

       rs.next();
           
       one.setId(rs.getString("id"));
       one.setName(rs.getString("name"));
       one.setPassword(rs.getString("password"));
       one.setTel(rs.getString("tel"));
       one.setAddress(rs.getString("address"));
       one.setEmail(rs.getString("email"));

    } catch(Exception e) { e.printStackTrace(); }
    finally {
        if(stmt != null) stmt.close();
        if(rs != null) rs.close();
        if(con != null) con.close();
    }
    
   String tel_format="(\\d{3})(\\d{3,4})(\\d{4})";
%>
<br><br><br>

<div class="main" align="center">
  <div class="registerForm">
	      
    <h1>마이페이지</h1>
    <form name="registerForm" id="registerFosssrm" method="post"> 
        <input type="text" id="id" name="id" class="id" readonly placeholder="아이디 : <%= one.getId()%>">
	    <input type="text" id="name" name="name" class="name" readonly placeholder="이름 : <%= one.getName()%>">
        <input type="button" id="passwd" name="passwd" class="passwd" value="비밀번호를 변경하시려면 눌러주세요"  onclick="location.href='Account/memberInfoPasswordModifyView.jsp'">
        <input type="text" id="tel" name="tel" class="tel" readonly placeholder="전화번호 : <%= one.getTel().replaceAll(tel_format, "$1-$2-$3")%>">
  <TH> </TH>
</TR>
<TR><br>
 	<input type="text" id="address" name="address" class="address" readonly placeholder="주소 : <%= one.getAddress()%>">
</TR>
		<input type="text" id="email" name="email" class="email" readonly placeholder="이메일 :<%= one.getEmail()%>">
		<input type="button" id="btn_cancel" class="btn_cancel" value="뒤로가기" onclick="history.back()">
	</form>

  </div>
</div>
<br><br>

  
 

</body>
</html>
