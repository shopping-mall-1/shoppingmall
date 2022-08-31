<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="com.market.*"%>
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
	//DBConnection con = new DBConnection();
	//con.StartConnection(getServletConfig());
	
	int p_code = (Integer)session.getAttribute("code");
		
	//int p_code = Integer.parseInt(request.getParameter("code"));
	System.out.print(p_code+", ");
	int p_count = Integer.parseInt(request.getParameter("count"));
	int price = Integer.parseInt(request.getParameter("price"));
	
	//Product item = new Product();
	//item = con.getproduct(p_code);
	
	
	System.out.print(p_count+" ,"+price);
	//con.CloseConnection();
	
	String userid = (String)session.getAttribute("id");
	System.out.print(userid);
	//지금 선택한 제품이 cart테이블에 이미 있다면-> 수량만 더해서 추가
	String query_check = "select count(p_code), p_code ,p_count from cart where customer='"+userid+"' and p_code= "+p_code;
	Connection con_check = null;
	Statement stmt_check = null;
	ResultSet rs_check = null;
	System.out.println(query_check);
	DataSource ds_check = (DataSource)this.getServletContext().getAttribute("dataSource");
	con_check = ds_check.getConnection();	
	stmt_check = con_check.createStatement();
	
	rs_check = stmt_check.executeQuery(query_check);
	
	
	
	if(rs_check.next()){
		int code = rs_check.getInt("p_code");
		int count = rs_check.getInt("p_count")+p_count;
		int cnt = rs_check.getInt("count(p_code)");
		System.out.print(code);
		System.out.print(cnt);
		
		if(code==p_code&&cnt!=0){
			Connection con_update = null;
			Statement stmt_update = null;
			ResultSet rs_update = null;
			String query_update = "update cart set p_count = "+count+" where p_code="+p_code+" and customer='"+userid+"'";
			System.out.print(query_update);
			DataSource ds_update = (DataSource)this.getServletContext().getAttribute("dataSource");
			con_update = ds_update.getConnection();	
			stmt_update = con_update.createStatement();
			
			stmt_update.executeUpdate(query_update);
			stmt_update.close();
			con_update.close();	
			
		}else{
			
			//아니라면 현재 접속중인 유저아이디, 상품명, 상품코드, 수량을 cart 테이블로 insert
			Connection con_cart = null;
			Statement stmt = null;
			String query_insert = "insert into cart (customer,p_code,p_count) values ('"+userid+"',"+p_code+","+p_count+")";
			DataSource ds = (DataSource)this.getServletContext().getAttribute("dataSource");
			con_cart = ds.getConnection();	
			stmt = con_cart.createStatement();
			System.out.print("[장바구니 쿼리] : "+query_insert);
			stmt.executeUpdate(query_insert);	
			stmt.close();
			con_cart.close();
			stmt_check.close();
			con_check.close();				
		}
		
	}
	
	
%>
</body>
</html>