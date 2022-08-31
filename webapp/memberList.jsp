<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.market.Member"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/adminList.css">
<title>회원 정보 관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<jsp:include page="header.jsp" />
</head>
<body>
<%
	// 관리자 계정이 아닌 경우 첫 페이지로 돌아감.
	String role = (String)session.getAttribute("role");
	if(role.equals("admin") == false) response.sendRedirect("index_home.jsp");

    request.setCharacterEncoding("UTF-8");

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    // 모든 일반 회원의 데이터를 가져오는 쿼리문
    String q_getMemberList = "select id, name, password, tel, address, email from member where role='none'";
    // 회원 정보를 배열리스트로 저장
    ArrayList<Member> memberList = new ArrayList<Member>();

    try{
        DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
        stmt = con.createStatement();
        rs = stmt.executeQuery(q_getMemberList);

        while(rs.next()) {
            Member one = new Member();
            one.setId(rs.getString("id"));
            one.setName(rs.getString("name"));
            one.setPassword(rs.getString("password"));
            one.setTel(rs.getString("tel"));
            one.setAddress(rs.getString("address"));
            one.setEmail(rs.getString("email"));

            memberList.add(one);
        }

    } catch(Exception e) { e.printStackTrace(); }
    finally {
        if(stmt != null) stmt.close();
        if(rs != null) rs.close();
        if(con != null) con.close();
    }
%>
<table>
    <caption>회원 목록</caption>
    <thead>
    <tr align="center">
        <th>아이디</th>
        <th>이름</th>
        <th>비밀번호</th>
        <th>전화번호</th>
        <th>배송지</th>
        <th>이메일</th>
    </tr>
    </thead>
    <tbody>
    <!-- tr 태그 하나가 한 명의 회원 -->
<%   for(int i = 0; i < memberList.size(); i++) {
        Member one = memberList.get(i);
%>
    <tr>
        <td><%=one.getId()%></td>
        <td><%=one.getName()%></td>
        <td><%=one.getPassword()%></td>
        <td><%=one.getTel()%></td>
        <td><%=one.getAddress()%></td>
        <td><%=one.getEmail()%></td>
    </tr>
<%
    }
%>
    </tbody>
</table>

</body>
</html>