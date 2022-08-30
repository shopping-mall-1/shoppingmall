<%@page import="javax.sql.DataSource"%>
<%@page import="com.market.ProductStock"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 재고 관리</title>
<jsp:include page="header.jsp" />
</head>
<body>
<%
	//관리자 계정이 아닌 경우 첫 페이지로 돌아감.
	String role = (String)session.getAttribute("role");
	if(role.equals("admin") == false) response.sendRedirect("index_home.jsp");

	request.setCharacterEncoding("UTF-8");
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	String q_getStockList = "select code, name, price, stock from product";
	
	ArrayList<ProductStock> stockList = new ArrayList<ProductStock>();
	
	try{
        DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
        stmt = con.createStatement();
        rs = stmt.executeQuery(q_getStockList);

        while(rs.next()) {
            ProductStock one = new ProductStock();
            one.setCode(rs.getInt("code"));
            one.setName(rs.getString("name"));
            one.setPrice(rs.getInt("price"));
            one.setStock(rs.getInt("stock"));

            stockList.add(one);
        }

    } catch(Exception e) { e.printStackTrace(); }
    finally {
        if(stmt != null) stmt.close();
        if(rs != null) rs.close();
        if(con != null) con.close();
    }
%>


<table border="1">
    <caption>상품 재고 관리</caption>
    <thead>
    <tr align="center">
        <td>코드</td>
        <td>이름</td>
        <td>가격</td>
        <td>재고</td>
    </tr>
    </thead>
    <tbody>
<%	for(int i = 0; i < stockList.size(); i++) {
		ProductStock one = stockList.get(i);
		if(one.getStock() <= 0) {
%>
    	<tr style="font-weight:bold; color:red;">
<%		} else if(one.getStock() < 5) { %>
		<tr style="font-weight:bold; color:brown;">
<% 		} else { %>
		<tr>
<%		} %>
	        <td><%=one.getCode() %></td>
	        <td><%=one.getName() %></td>
	        <td align="right"><%=one.getPrice() %>원</td>
			<td align="right"><%=one.getStock() %></td>
	    </tr>
<%
	}
%>
    </tbody>
</table>

</body>
</html>