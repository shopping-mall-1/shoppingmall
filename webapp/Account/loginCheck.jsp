<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
<%@page import="java.sql.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Locale"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 체크</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	//로그인 창에서 파리미터로 받은 값
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	Connection con = null;
	
	Statement stmt1 = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	
	int id_count = 0;
	int pwd_count = 0;

	//존재하는 아이디 인지 확인
	String q_findID = "select count(*) as id_count from member where id= '" + id + "'";
	//패스워드가 틀렸는지 확인
	String q_checkPassword = "select count(*) as id_count from member " 
							+ "where id='" + id + "' and "
							+ "password='" + password + "'";
	// 세션 유지를 위해 id를 가져옴
	String q_sessionID = "select name from member where id = '" + id + "'";
	
	
	// DB 접속 부분을 분리할 것.
	try{
	
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt1 = con.createStatement();
		stmt2 = con.createStatement();
		stmt3 = con.createStatement();
		
		rs1 = stmt1.executeQuery(q_findID);
		rs2 = stmt2.executeQuery(q_checkPassword);
		rs3 = stmt3.executeQuery(q_sessionID);
		
		String name = "";
		while(rs1.next()) id_count = rs1.getInt("id_count");
		while(rs2.next()) pwd_count = rs2.getInt("id_count");
		while(rs3.next()) name = rs3.getString("name");
		
		//아이디가 존재하고 패스워드도 틀리지 않은 사용자
		if(id_count != 0 && pwd_count !=0){
			
			session.setMaxInactiveInterval(3600*7); //세션 유지 기간 설정
			session.setAttribute("id", id); //세션 생성
			session.setAttribute("name", name);
						
			stmt1.close();
			stmt2.close();
			stmt3.close();
			rs1.close();
			rs2.close();
			rs3.close();
			con.close();
			
			// 로그인 완료 후 이동
			response.sendRedirect("../index_home.jsp");
			
		} else if(id_count == 0){ //아이디가 존재하지 않는 사용자

			stmt1.close();
			stmt2.close();
			rs1.close();
			rs2.close();
			con.close();
						
%>			
			<script>
				alert("사용자가 존재하지 않습니다.");
				document.location.href='login.jsp';
			</script>	
<% 	
		}else if(id_count!=0 && pwd_count == 0){ //아이디는 있으나 패스워드가 틀린 사용자
		
			stmt1.close();
			stmt2.close();
			rs1.close();
			rs2.close();
			con.close();

%>			
	
			<script>
				alert("패스워드를 잘못 입력 했습니다.");
				document.location.href='login.jsp';
			</script>
			
<% 		 
		}
		
	}catch(Exception e){ e.printStackTrace(); }
%>

</body>
</html>