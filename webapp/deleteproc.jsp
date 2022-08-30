<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 삭제 페이지</title>
</head>
<%
	//int p_code = (Integer)session.getAttribute("code");
	
	
	String deleteWhat = request.getParameter("deleteWhat");
	System.out.print(deleteWhat);
	
	String userid = (String)session.getAttribute("id");
	System.out.print(userid);
	
	
	if(deleteWhat.equals("this")){
		//지금 선택한 제품 cart 테이블에서 삭제하기
		Integer p_code = Integer.parseInt(request.getParameter("code"));
		String query_delete = "delete from cart where p_code="+p_code+" and customer='"+userid+"'";
		Connection con_delete= null;
		Statement stmt_delete = null;
		
		System.out.println(query_delete);
		DataSource ds_check = (DataSource)this.getServletContext().getAttribute("dataSource");
		con_delete = ds_check.getConnection();
		stmt_delete = con_delete.createStatement();
		stmt_delete.executeUpdate(query_delete);
		System.out.println("[삭제쿼리] : "+query_delete);
		con_delete.close();
		stmt_delete.close();
		
	}else if(deleteWhat.equals("check")){
		
		//체크된 값 받아서 삭제
		String[] str_code = request.getParameterValues("codes");
		
		int[] code = new int[str_code.length];
		for(int i=0;i<str_code.length;i++){
				code[i] = Integer.parseInt(str_code[i]);
		}
		try{
		Connection con_check_del= null;
		Statement stmt_check_del= null;
		
		String query_check_del="";
		System.out.println(query_check_del);
		DataSource ds_check = (DataSource)this.getServletContext().getAttribute("dataSource");
		
		for(int i=0;i<code.length;i++){
			query_check_del = "delete from cart where p_code="+code[i]+" and customer='"+userid+"'";
			con_check_del = ds_check.getConnection();
			stmt_check_del = con_check_del.createStatement();
			stmt_check_del.executeUpdate(query_check_del);
			System.out.println("[삭제쿼리] : "+query_check_del);
		}
		con_check_del.close();
		stmt_check_del.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}else if(deleteWhat.equals("all")){
		//장바구니 비우기 (전체 삭제)
	
		String query_delete = "delete from cart where customer='"+userid+"'";
		Connection con_delete= null;
		Statement stmt_delete = null;
		
		System.out.println(query_delete);
		DataSource ds_check = (DataSource)this.getServletContext().getAttribute("dataSource");
		con_delete = ds_check.getConnection();
		stmt_delete = con_delete.createStatement();
		stmt_delete.executeUpdate(query_delete);
		System.out.println("[삭제쿼리] : "+query_delete);
		con_delete.close();
		stmt_delete.close();	
		
	}
	
	
	
	
%>
</body>
</html> 