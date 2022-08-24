<%@page import="com.market.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.market.Product" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String code = request.getParameter("code");
	String name = request.getParameter("name");
	String company = request.getParameter("company");
	String sPrice = request.getParameter("price");
	String sStock = request.getParameter("stock");
	String description = request.getParameter("description");
	String image = request.getParameter("image");
	
	/* string 값을 integer로 변환 */
	Integer price = (sPrice.isEmpty()) ?  0 : Integer.valueOf(sPrice);
	Integer stock = (sStock.isEmpty()) ?  0 : Integer.valueOf(sStock);
	
	Product item = new Product();
	item.setCode(Integer.valueOf(code));
	item.setName(name);
	item.setCompany(company);
	item.setPrice(price);
	item.setStock(stock);
	item.setDescription(description);
	item.setImage(image);
	
	/* DB에 추가 */
	DBConnection con = new DBConnection();
	con.StartConnection(getServletConfig());
	con.AddProductToDB(item);
	con.CloseConnection();
	
	/* 상품 목록을 보여주는 페이지로 이동 */
	response.sendRedirect("products.jsp");
%>