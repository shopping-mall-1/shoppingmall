<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>  
<%@page import="javax.sql.DataSource"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="css/product_list.css"> -->
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

.banner_size{
	width:1050px;
	height:200px;
	margin-bottom:15px;
}

</style>

</head>
<body>

<!-- header 들어갈 구역 -->
<section>
<jsp:include page="header.jsp" />
<br>
</section>


<%
	request.setCharacterEncoding("utf-8");
	String menu = request.getParameter("menu");

%>

<!-- 배너광고 시작 -->
<!-- 배너 이미지 사이즈 1050x400 / 배너 이미지 확장자 jpg -->

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventNow.jsp"> <img src = "images/banner_img/이벤트.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=채소&categoryNum=0"> <img src = "images/banner_img/채소.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=과일·견과·쌀&categoryNum=1"> <img src = "images/banner_img/과일·견과·쌀.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=수산·해산·건어물&categoryNum=2"> <img src = "images/banner_img/수산·해산·건어물.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=정육·계란&categoryNum=3"> <img src = "images/banner_img/정육·계란.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=국·반찬·메인요리&categoryNum=4"> <img src = "images/banner_img/국·반찬·메인요리.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=샐러드·간편식&categoryNum=5"> <img src = "images/banner_img/샐러드·간편식.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=면·양념·오일&categoryNum=6"> <img src = "images/banner_img/면·양념·오일.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=생수·음료·우유·커피&categoryNum=7"> <img src = "images/banner_img/생수·음료·우유·커피.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=간식·과자·떡&categoryNum=8"> <img src = "images/banner_img/간식·과자·떡.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=건강식품&categoryNum=9"> <img src = "images/banner_img/건강식품.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>

<div class="container" align="center">
	<div class="row">
		<div class="col">
			<a href="eventProduct.jsp?category=와인&categoryNum=10"> <img src = "images/banner_img/와인.jpg" class="banner_size" onerror="this.parentNode.style.display='none'"></a>
		</div>
	</div>
</div>



<%-- <%
	//String path = "C:\\eclipse_work\\Shop\\src\\main\\webapp\\img\\";
	String path = "C:\\eclipse_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ShoppingMall\\images\\banner_img\\";
	File folder = new File(path);
	File[] fList = folder.listFiles();
	String categoryNum = "";
	
	for(int i=0; i < fList.length; i++){
		String fileName = fList[i].getName();
		String fileType = fileName.substring((fileName.length()-3), fileName.length());
		String category = fileName.substring(0, (fileName.length()-4));
        	
		if(category.equals("채소"))
			categoryNum ="0";
		else if(category.equals("과일·견과·쌀"))
			categoryNum="1";
		else if(category.equals("수산·해산·건어물"))
			categoryNum="2";
		else if(category.equals("정육·계란"))
			categoryNum="3";
		else if(category.equals("국·반찬·메인요리"))
			categoryNum="4";
		else if(category.equals("샐러드·간편식"))
			categoryNum="5";
		else if(category.equals("면·양념·오일"))
			categoryNum="6";
		else if(category.equals("생수·음료·우유·커피"))
			categoryNum="7";
		else if(category.equals("간식·과자·떡"))
			categoryNum="8";
		else if(category.equals("건강식품"))
			categoryNum="9";
		else if(category.equals("와인"))
			categoryNum="10";

		
		//System.out.println(fileName);
        //System.out.println(fileType);
        System.out.println(category);
        System.out.println(categoryNum);
		
        if(fileType.equals("jpg") && !fileName.equals("이벤트.jpg")){
%>
	<div class="container" align="center">
		<div class="row">
			<div class="col">
				<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>"> <img src="./images/banner_img/<%=fileName %>" class="banner_size" onerror="this.parentNode.style.display='none'" ></a>
			</div>
		</div>
	</div>
<%
		}
	}
%> --%>

<!--기본 배너 틀 #부분과 ... 부분 알맞게 수정 -->

<!-- 	<div class="container" align="center">
		<div class="row">
			<div class="col">
				<a href="#"> <img src = "img/..." class="banner_size" onerror="this.parentNode.style.display='none'"></a>
			</div>
		</div>
	</div> -->


<!-- 배너광고 끝 -->
	
</body>

</html>