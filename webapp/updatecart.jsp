<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� ��������</title>
</head>
<body>
<%
	String userid = (String)session.getAttribute("id");
	int code = Integer.parseInt(request.getParameter("code"));
	int count = Integer.parseInt(request.getParameter("count"));
	
	System.out.println("������Ʈ�� ��ǰ�ڵ� :"+code+", ���� : "+count);
	
	String query = "UPDATE cart SET p_count = "+count+" WHERE p_code="+code+" AND customer = '"+userid+"'";
	Connection con = null;
	Statement stmt = null;
	
	DataSource ds= (DataSource)this.getServletContext().getAttribute("dataSource");
	
	try{
		con= ds.getConnection();	
		stmt = con.createStatement();
		
		stmt.executeUpdate(query);
	}catch(Exception e){
		e.printStackTrace();
	}
	con.close();
	stmt.close();
%>
</body>
</html>