
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page errorPage="error.jsp" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사용자정보 등록</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String tel = request.getParameter("tel");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address = address1 + " " + address2;
	String email = request.getParameter("email");

	
	Connection con = null;
	Statement stmt = null;

	try{
		
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
	
		
		String query = "insert into member "
	             + "(id,name,password,tel,address,email) " 
				 + "values ('" + id + "','" + name  + "','" + password
				 + "','" + tel + "','" + address + "','" + email + "')";
		
		System.out.println(query);
	
		stmt = con.createStatement();
		stmt.executeUpdate(query);
		
		stmt.close();
		con.close();
		
		// 가입 완료됐다고 창 하나 띄우고 로그인 페이지로 넘어가거나, 세션을 유지한 채로 첫페이지로 넘어가게 바꿀 것.
		response.sendRedirect("login.jsp");

	}catch(Exception e){
		e.printStackTrace();
		stmt.close();
		con.close();
	}
	
	
%>

   
</body>
</html>