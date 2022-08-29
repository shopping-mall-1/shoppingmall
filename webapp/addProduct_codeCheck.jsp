<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.google.gson.JsonObject"%>

<%

String pCode = request.getParameter("input_code");
String q_findCode = "select count(*) as code_count from product where code='" + pCode + "'";

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
	DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
	con = ds.getConnection();
	
	stmt = con.createStatement();
	rs = stmt.executeQuery(q_findCode);
	
	int code_count = 0;
	while(rs.next()) code_count = rs.getInt("code_count"); 
	
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("code_count", code_count);
	
	response.getWriter().print(jsonObject);
	
	if(stmt != null) stmt.close();
	if(con != null) con.close();
	if(rs != null) rs.close();
			
} catch(Exception e){ e.printStackTrace(); }

%>