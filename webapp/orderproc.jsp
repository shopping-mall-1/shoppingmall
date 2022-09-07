<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 db 처리</title>
</head>
<body>
<%
	String userid = (String)session.getAttribute("id");

	Connection con_insert = null;
	DataSource ds_insert = (DataSource)this.getServletContext().getAttribute("dataSource");
	con_insert = ds_insert.getConnection();
	
	Statement stmt_insert = null;
	String query_insert =
			"INSERT INTO tbl_order (customer, p_code, p_count, address)"+ 
			"("+
					"SELECT a.customer AS customer, a.p_code AS p_code, a.p_count AS p_count , "+
					"b.address as address FROM cart a INNER JOIN member b "+
					"ON a.customer = b.id WHERE a.isorder = 'y'"+
			")";
	
	//insert쿼리 실행
	stmt_insert = con_insert.createStatement();
	stmt_insert.executeUpdate(query_insert);
	
	con_insert.close();
	stmt_insert.close();
	
	//재고 수정하기 (product 테이블)
	Connection con_alter = null;
	DataSource ds_alter = (DataSource)this.getServletContext().getAttribute("dataSource");
	con_alter = ds_alter.getConnection();
	
	Statement stmt_alter = null;
	String query_alter =
			"UPDATE product a INNER JOIN cart b ON a.code = b.p_code SET a.stock = a.stock-b.p_count where b.customer='"+userid+"' ";
	
	
	stmt_alter = con_alter.createStatement();
	stmt_alter.executeUpdate(query_alter);
	
	con_alter.close();
	stmt_alter.close();	
	
	//cart테이블 isorder="y" 인 행 삭제하기 (결제한 제품 장바구니에서 지우기)
	Connection con_delete = null;
	DataSource ds_delete = (DataSource)this.getServletContext().getAttribute("dataSource");
	con_delete = ds_delete.getConnection();
	
	Statement stmt_delete = null;
	String query_delete = "delete from cart where isorder='y'";	
	
	//delete 쿼리 실행
	stmt_delete = con_delete.createStatement();
	stmt_delete.executeUpdate(query_delete);
	
	con_delete.close();
	stmt_delete.close();			
	
	response.sendRedirect("orderlist.jsp");

%>
</body>
</html>