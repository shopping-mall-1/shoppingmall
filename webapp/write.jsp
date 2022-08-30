<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시물 등록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%
int code = Integer.parseInt(request.getParameter("code"));
%>
<script>

function registerForm(){

	if($("#mwriter").val()=='') { alert("이름을 입력하세요!!!"); $("#mwriter").focus(); return false;  }
	if($("#mtitle").val()=='') { alert("제목을 입력하세요!!!");  $("#mtitle").focus(); return false;  }
	if($("#mcontent").val()=='') { alert("내용을 입력하세요!!!");  $("#mcontent").focus(); return false;  }
	
	$("#WriteForm").attr("action", "write_proc.jsp?code=<%= code%>").submit();
	
}

</script>

<style>

a:link { color: black; }
a:visited { color: black; }
a:hover { color: red; }
a:active { color: red; }
#hypertext { text-decoration-line: none; cursor: hand; }

.WriteForm {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align: center;
  border:3px solid #400080;
  border-radius: 30px;
}

#mwriter, #mtitle {
  width: 90%;
  border:none;
  border-bottom: 2px solid #400080;
  margin: 20px;
  padding: 10px 10px;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

#mcontent{
  width: 850px;
  height: 300px;
  padding: 10px;
  box-sizing: border-box;
  border: 2px solid #400080;
  font-size: 16px;
  resize: both;
}

.btn_write  {
  position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: rgb(95, 0, 128);;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn_cancel{
  position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: rgb(95, 0, 128);;
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
	if(id == null) response.sendRedirect("Account/login.jsp");
	//int code = Integer.parseInt(request.getParameter("code"));
	
	String name = "";
	
 	//String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	//String uid = "webmaster";
	//String pwd = "12345";
	String query = "select name from member where id = '" 
	              + id + "'"; 
	
	Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
        
	try{
		
		//Class.forName("org.mariadb.jdbc.Driver");
		//con = DriverManager.getConnection(url, uid, pwd);
		
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();

		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) 
			name = rs.getString("name");
		
	}catch(Exception e)	 {
		e.printStackTrace();
	}
	
	stmt.close();
	rs.close();
	con.close();
	
%>

<div align="center">
<div style="width:1050px;height:100px"></div>
	<h1>상품 문의하기</h1>
	<br>
	
	<form id="WriteForm" class="WriteForm" method="POST" enctype="multipart/form-data">
		<input type="text" id="mwriter" value="작성자 : <%=name %> 님" disabled>
		<input type="hidden" name="mwriter" value="<%=name %>">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="text" id="mtitle" name="mtitle"  placeholder="여기에 제목을 입력하세요">
		<textarea id="mcontent" cols="100" row="500" name="mcontent" placeholder="여기에 내용을 입력하세요"></textarea>
		<br>
		<input type="file" name="uploadFile">
		<br>
		<input type="button" class="btn_write" value="등록" onclick="registerForm()" />
		<input type="button" class="btn_cancel" value="취소" onclick="history.back()" />
	</form>
</div>
</body>
</html>