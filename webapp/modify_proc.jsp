<%@page import="java.net.URLDecoder"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<%
	
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	int code = Integer.parseInt(request.getParameter("code"));
	int seqno = Integer.parseInt(request.getParameter("seqno"));
	String searchType = request.getParameter("searchType")==null?"":request.getParameter("searchType");
	String keyword = request.getParameter("keyword")==null?"":request.getParameter("keyword");
	String pageNum = request.getParameter("page");
	String mtitle = request.getParameter("mtitle");
	String mcontent = request.getParameter("mcontent");
	String mregdate = LocalDateTime.now().toString();
	
	System.out.println("searchType=" + searchType);
	System.out.println("keyword=" + keyword);

	Connection con = null;
	Statement stmt = null;

	try{
		
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		//Class.forName("org.mariadb.jdbc.Driver");
		//con = DriverManager.getConnection(url, user, pwd);

		String query = "update mboard set mtitle = '" + mtitle + "',"
	             + "mcontent = '" + mcontent + "',mregdate='" + mregdate + "' where seqno = " + seqno;
		
		//System.out.println(query);
	
		stmt = con.createStatement();
		stmt.executeUpdate(query);
		
		stmt.close();
		con.close();
		
		//keyword = URLDecoder.decode(keyword, "UTF-8");
	
		//response.sendRedirect("view.jsp?code="+ code + "&seqno=" + seqno + "&page=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword);
%>		
	<script>
		location.href='view.jsp?code=<%=code%>&seqno=<%=seqno %>&page=<%=pageNum %>&searchType=<%=searchType %>&keyword=<%= keyword %>';
	</script>
	

<% 		
	}catch(Exception e){
		e.printStackTrace();
		stmt.close();
		con.close();
	}

%>

</body>
</html>