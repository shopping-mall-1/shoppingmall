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
	String userid = (String)session.getAttribute("userid");
	session.invalidate(); //모든 세션 종료--> 로그아웃...
	
 	//String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	//String uid = "webmaster";
	//String pwd = "12345";
	/*
	String query = "insert into tbl_member_log (userid,inouttime,status) values " 
			       + "('" + userid + "','" + lastlogoutdate + "','OUT')";
		      
	System.out.println("로그아웃 쿼리 : " + query);
	
	Connection con = null;
    Statement stmt = null;
    
    try{
    	
		//Class.forName("org.mariadb.jdbc.Driver");
		//con = DriverManager.getConnection(url, uid, pwd);
		
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		stmt.executeUpdate(query);
    	
    }catch(Exception e){
    	e.printStackTrace();
    }

    stmt.close();
    con.close();
    */
	
%>

<h1><%=userid %>님 안녕히 가세요. </h1>
<h1><a href="./index_home.jsp">처음으로</a></h1>


</body>
</html>