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
	$(document).ready(function(){
		$("#btn_IDSearch").on("click", function(){
			location.href="login.jsp";	
		})
	})
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
   
#IDSearchForm {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  border:5px solid gray;
  border-radius: 30px;
}   
   

#btn_IDSearch  {
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

	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String id = "";
	
	String query = "select id from member where name = '" + name + "' and tel = '" + tel + "'";

	try{
	
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) id = rs.getString("id");
		
		stmt.close();
		rs.close();
		
		System.out.println("[아이디 찾기 쿼리] : " + query);
		
		if(id.equals("") || id == null) response.sendRedirect("searchID.jsp?check=fail");
	
	}catch(Exception e){
		
		e.printStackTrace();
	}
			
%>

<div class="home_body_div" align=center>


	<div id="IDSearchForm">
     	<br><br><h1>아이디 : <%=id %></h1>
       	<button id="btn_IDSearch">로그인 창으로 이동</button>
    </div> 

</div>

</body>
</html>