<%@page import="java.util.Random"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>임시 패스워드 발급</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	$(document).ready(function(){
		$("#btn_pwSearch").on("click", function(){
			location.href="login.jsp"	
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
   
#pwSearchForm {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  border:5px solid gray;
  border-radius: 30px;
}   
   

#btn_pwSearch  {
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
	String id = request.getParameter("id");
	String name = request.getParameter("name");

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	StringBuffer tempPW = new StringBuffer();
	
	try{
	
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
	
		String query1 = "select count(*) id_check from member where name = '" + name + "' and id = '" + id + "'";
		stmt = con.createStatement();
		rs = stmt.executeQuery(query1);
		
		int id_check = 0;
		while(rs.next()) id_check = rs.getInt("id_check");
		
		stmt.close();
		rs.close();
		
		System.out.println("[패스워드 찾기 쿼리] : " + query1);
		
		if(id_check==0) response.sendRedirect("searchPassword.jsp?check=fail");
		
		//숫자 + 영문대소문자 7자리 임시패스워드 생성
		
		Random rnd = new Random();
		for (int i = 0; i < 7; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z : 아스키코드 97~122
		    	tempPW.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z : 아스키코드 65~122
		    	tempPW.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		    	tempPW.append((rnd.nextInt(10)));
		        break;
		    }
		}
	
		String query2 = "update member set password = '" + String.valueOf(tempPW) + "' where id = '" + id + "'";
		
		System.out.println("[임시 패스워드 생성 쿼리] : " + query2);
		
		stmt = con.createStatement();
		stmt.executeUpdate(query2);
		
		stmt.close();
		con.close();
		
	}catch(Exception e){
		
		e.printStackTrace();
	}

%>

<div class="home_body_div" align=center>

	<div id="pwSearchForm">
     	<br><br><h1>임시 패스워드 : <%= String.valueOf(tempPW) %></h1>
       	<button id="btn_pwSearch">로그인 창으로 이동 </button>
    </div> 

</div>

</body>
</html>