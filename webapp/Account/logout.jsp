<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	session.invalidate(); //모든 세션 종료--> 로그아웃...
	response.sendRedirect("../index.jsp");
%>