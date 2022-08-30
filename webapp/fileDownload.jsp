<%@page import="javax.sql.DataSource"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>파일 다운로드</title>
</head>
<body>

<%
	int seqno = Integer.parseInt(request.getParameter("seqno"));

	//String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	//String uid = "webmaster";
	//String pwd = "12345";

	String query = "select org_filename, stored_filename from mboard where seqno=" + seqno;
	//System.out.println(query);		 

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String stored_filename = "";
	String org_filename = "";


	try{
	
		//Class.forName("org.mariadb.jdbc.Driver");
		//con = DriverManager.getConnection(url, uid, pwd);
	
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			org_filename = rs.getString("org_filename");
			stored_filename = rs.getString("stored_filename");
		}
		
	}catch(Exception e){
			e.printStackTrace();
	}
		
	stmt.close();
	rs.close();
	
	byte fileByte[] = FileUtils.readFileToByteArray(new File("c:\\Repository\\file\\"+stored_filename));
	
	response.setContentType("application/octet-stream");
	response.setContentLength(fileByte.length);
	response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(org_filename, "UTF-8")+"\";");
	response.getOutputStream().write(fileByte);
	response.getOutputStream().flush();
	response.getOutputStream().close();
	

%>



</body>
</html>