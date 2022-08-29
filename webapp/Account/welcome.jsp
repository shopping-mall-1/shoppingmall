
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

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
   
#ViewForm {
  width:900px;
  height:auto;
  padding: 35px;
  background-color:#FFFFFF;
  text-align:left;
  border:5px solid gray;
  border-radius: 30px;
} 

</style>

<title>환영 페이지</title>
</head>
<body>
<br><br>
<%

	String id = (String)session.getAttribute("id");
	if(id == null) response.sendRedirect("login.jsp");

	String regdate = "";
	String lastlogindate = "";
	String lastlogoutdate = "";

 	//String url = "jdbc:mariadb://127.0.0.1:3306/jspdev";
	//String uid = "webmaster";
	//String pwd = "@Ajendbh7!";
	String query1 = "select to_char(regdate,'YYYY-MM-DD HH24:MI:SS') as regdate, to_char(lastlogindate,'YYYY-MM-DD HH24:MI:SS') as lastlogindate " 
	               + " from member where id = '" + id + "'"; 
	
	System.out.println(query1);
	
	String query2 = "select max(to_char(inouttime,'YYYY-MM-DD HH24:MI:SS')) as lastlogoutdate " 
            + " from member_log where id = '" + id + "' and status = 'OUT'"; 
	
	System.out.println(query2);
	
	Connection con = null;
    Statement stmt1 = null;
    Statement stmt2 = null;
    ResultSet rs1 = null;
    ResultSet rs2 = null;
    
	try{
		
		//Class.forName("org.mariadb.jdbc.Driver");
		//con = DriverManager.getConnection(url, uid, pwd);

		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt1 = con.createStatement();
		stmt2 = con.createStatement();
		rs1 = stmt1.executeQuery(query1);
		rs2 = stmt1.executeQuery(query2);
		
		while(rs1.next()) {
			regdate = rs1.getString("regdate");
			lastlogindate = rs1.getString("lastlogindate");
		}
		
		while(rs2.next()) lastlogoutdate = rs2.getString("lastlogoutdate");
				
	}catch(Exception e)	 {
		e.printStackTrace();
	}
	
	stmt1.close();
	stmt2.close();
	rs1.close();
	rs2.close();
	con.close();
		
%>

<!-- <fmt:setLocale value="ko" /> --> 
<fmt:setBundle basename="Bundle.message" var="resourceBundle" />
<div id="main" align=center>
	<div id="ViewForm">
		<h1><%=session.getAttribute("id") %>(<%=session.getAttribute("name") %>), <fmt:message key="hello" bundle="${resourceBundle}"/> </h1>
		
		<fmt:setLocale value="en" />
		<fmt:setBundle basename="Bundle.message" var="resourceBundle" />
		
		<h1><%=session.getAttribute("id") %>(<%=session.getAttribute("name") %>), <fmt:message key="hello" bundle="${resourceBundle}"/></h1>
		
		
		<h1>■ 회원 가입일 : <%=regdate %></h1>
		<h1>■ 마지막 로그인 날짜 : <%=lastlogindate %></h1>
		<h1>■ 마지막 로그아웃 날짜 : <%=lastlogoutdate %></h1>
		
		<h1><p style="text-align:center;">[ <a href="list.jsp?page=1">게시판 가기</a> ] | [ <a href="logout.jsp">로그아웃</a> [ <a href="memberInfoPasswordModifyView.jsp
		">비밀번호 변경</a> ] |]</p></h1>
	</div>
</div>
</body>
</html>