<%@page import="com.market.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.market.Product" %>
<%@page import="javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>~ Product List ~</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
		DBConnection con = new DBConnection();
		ArrayList<Product> listOfProducts = new ArrayList<Product>();
		
		con.StartConnection(getServletConfig());
		listOfProducts = con.GetAllProduct();
		con.CloseConnection();
	%> 
	<div class="container">
		<div class="row" align="center">
			<% for(int i = 0; i < listOfProducts.size(); i++) {
				Product item = listOfProducts.get(i); 		%>
			<div class="col-md-4">
				<h3><%=item.getName() %></h3>
				<p><%= item.getDescription() %>
				<p><%= item.getPrice() %>원
			</div>
			<% } %>
		</div>
		<hr >
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>