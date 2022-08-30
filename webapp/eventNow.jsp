<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>  
<%@page import="javax.sql.DataSource"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>

<style>

a{ 
	color:#000000;
	text-decoration:none;
}

a:hover{ 
	color:purple;
	text-decoration:none; 
}

#choose{
	color:#000000;
	text-decoration:none;
}

#choose:hover{
	color:#000000;
	text-decoration:none;
}

.category_box{
	box-sizing: border-box;
	width:1050px;
	border: 1px solid #D9D9D9;
	position: relative;
	margin-left:calc(50% - 1050px/2 - 12px);

}

.category_innerbox{
	box-sizing: border-box;
	width:900px;
	border: 1px solid #ffffff;
	position: relative;
	margin-left:calc(50% - 900px/2 - 12px);
	align-items:center;
}

.c_menu{
	padding:15px;
	margin-left:0;
	font-size:13px;
}

.sort_box{
	box-sizing: border-box;
	width:1050px;
	border: 1px solid #ffffff;
	position: relative;
	margin-left: calc(50% - 1050px/2 - 12px);
	margin-bottom:20px;
	font-size:12px;
}

.product{
	width:300px;
	text-align:left;
}

.productList{
 	width:1050px; 
}

.img_size{
	width:300px;
	height:400px;
}

</style>

</head>
<body>

<!-- header 구역 시작-->
<section>
	<jsp:include page="header.jsp" />
	<br>
</section>
<!-- header 구역 끝  -->

<%
	request.setCharacterEncoding("utf-8");
	String category = request.getParameter("category");

%> 
<div align="center">
	<img src="./img/추석.png">
</div>


</body>
</html>