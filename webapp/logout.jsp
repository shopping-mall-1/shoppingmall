<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<%

	/* 세션만 종료시킴: DB에서 로그아웃 시간 기록 안 함 */ 

	// String lastlogoutdate = LocalDateTime.now().toString();
	String id = (String)session.getAttribute("id");
	session.invalidate(); //모든 세션 종료--> 로그아웃...

	response.sendRedirect("index.jsp");
	
%>



</body>
</html>