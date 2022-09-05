<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String query = "select count(*) as id_count from member where id = '" + id + "'";
	   
	// DB 접속 구문을 변경할 것.
	try{

		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		int id_count = 0;
		while(rs.next()) id_count = rs.getInt("id_count"); 
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("id_count", id_count);
		
		//System.out.println("[아이디 중복 확인 JSON] : " + jsonObject);
		response.getWriter().print(jsonObject);
		
		stmt.close();
		con.close();
		rs.close();
				
	}catch(Exception e){
		e.printStackTrace();
	}

%>