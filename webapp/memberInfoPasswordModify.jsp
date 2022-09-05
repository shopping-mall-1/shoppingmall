<%@page import="java.time.LocalDateTime"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String oldpassword = request.getParameter("oldpassword");
	String newpassword = request.getParameter("password");
	
	Connection con = null;
	DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
	con = ds.getConnection();
    
	String db_password = "";
	try{
		
		String query = "select password from member where id = '" + id + "'";
		
	    Statement stmt = null;
	    ResultSet rs = null;

		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) db_password = rs.getString("password");  
			
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();	
		
	}catch(Exception e)	 {
		e.printStackTrace();
	}
	
	System.out.println("oldpassword = " + oldpassword);
	System.out.println("db_password = " + db_password);
	System.out.println("newpassword = " + newpassword);

	if(!db_password.equals(oldpassword)) {
		
		if(con != null) con.close();
		response.sendRedirect("memberInfoPasswordModifyView.jsp?check=fail"); 
	}
	else {
		
		try{
			
			String query = "update member set password = '" + newpassword + "',pwcheck = 1,lastpwdate = '" + LocalDateTime.now() + "' where id = '" + id + "'";
			
		    Statement stmt = null;

			stmt = con.createStatement();
			stmt.executeUpdate(query);
				
			if(stmt != null) stmt.close();
			if(con != null) con.close();				
			response.sendRedirect("index.jsp");
			
		}catch(Exception e)	 {
			e.printStackTrace();
		}
		
	}
	
%>


</body>
</html>