<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	String option = request.getParameter("option");
	
	//댓글 등록 
	if(option.equals("I")){
		
		int seqno = Integer.parseInt(request.getParameter("seqno"));
		String id = request.getParameter("id");
		String replywriter = request.getParameter("replywriter");
		String replycontent = request.getParameter("replycontent");
		String replyregdate = LocalDateTime.now().toString();
		
		String query = "insert into reply (seqno,id,replywriter,replycontent,replyregdate) "
					+ "values (" + seqno + ",'" + id + "','" + replywriter + "','" + replycontent + "','" + replyregdate + "')";

		System.out.println("[댓글 등록 쿼리] : " + query);			
					
		try{
			
			DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
			con = ds.getConnection();
			
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
					
	}

	if(option.equals("U")){
		
		int replyseqno = Integer.parseInt(request.getParameter("replyseqno"));
		String replycontent = request.getParameter("replycontent");
		
		String query = "update reply set replycontent = '" + replycontent + "' where replyseqno =" + replyseqno;
		
		System.out.println("[댓글 수정 쿼리] : " + query);
		
	try{
		
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		stmt.executeUpdate(query);
		
		if(stmt != null) stmt.close();
		if(con != null) con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
	}
	
	int del_seqno =0;
	if(option.equals("D")) {  

		String[] list = request.getParameterValues("list[]");

		int replyseqno = Integer.parseInt(list[0]);
		del_seqno = Integer.parseInt(list[1]);
		 		
		String query = "delete from reply where replyseqno = " + replyseqno;
	
		System.out.println("[댓글 삭제 쿼리] : " + query);
		
		try {
			DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
			con = ds.getConnection();
			
			stmt = con.createStatement();
			stmt.executeUpdate(query);
		
			if(stmt!= null) stmt.close(); 
			if(con != null) con.close(); 
		
		} catch (Exception e) { e.printStackTrace(); }
		
	}
	
	//댓글 읽어 오기
	try{
		
		int seqno = 0;
		
		if(option.equals("D")) seqno = del_seqno;
		else seqno = Integer.parseInt(request.getParameter("seqno"));
		
		String query = "select replyseqno, replywriter, replycontent, to_char(replyregdate, 'YYYY-MM-DD HH24:MI:SS') "
				 	+ "as replyregdate, id from reply where seqno = " + seqno 
				 	+ " order by replyseqno desc";
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		JsonObject jsonObject = null; 
		JsonArray jsonArray = new JsonArray();
		
		while(rs.next()){
			
			jsonObject = new JsonObject();
			
			jsonObject.addProperty("replyseqno",rs.getString("replyseqno"));
			jsonObject.addProperty("replywriter",rs.getString("replywriter"));
			jsonObject.addProperty("replycontent",rs.getString("replycontent"));
			jsonObject.addProperty("replyregdate",rs.getString("replyregdate"));
			jsonObject.addProperty("id",rs.getString("id"));
			jsonObject.addProperty("seqno",seqno);
			
			jsonArray.add(jsonObject);
			
		}
		
		response.getWriter().print(jsonArray);
		
		System.out.println("JSON 데이터 = " + jsonArray);
		System.out.println("[댓글 읽기 쿼리] : " + query);
		
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	

%>
