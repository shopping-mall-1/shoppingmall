<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>  
<%@page import="javax.sql.DataSource"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.nofind{
	font-size:13px;
	align-items:center;
	color:gray;
	
}

</style>

</head>

<body>

<!-- header 구역 시작 -->
<section>
	<jsp:include page="header.jsp" />
	<br>
</section>
<!-- header 구역 끝 -->

<%
	request.setCharacterEncoding("utf-8");
	String findKeyword = request.getParameter("findKeyword");
	String sort = request.getParameter("sort");
	
	String query = "SELECT code, name, price, stock, description, image, category as tbl_category, detail_category as tbl_detail, regist_date, benefit" 
			 +" from product where name like '" + "%" + findKeyword + "%" + "'";

	String query_total = "SELECT COUNT(*) as total from product where name like '" + "%" + findKeyword + "%" + "'";
	
	System.out.println("query");

	// 정렬 값에 따라 쿼리 정렬 추가
	if(sort != null){
		if(sort.equals("낮은가격"))
			query += " order by price";
		else if(sort.equals("높은가격"))
			query += " order by price desc";
		else if(sort.equals("판매량순"))
			query += " order by stock";
		else if(sort.equals("신상품순"))
			query += " order by regist_date desc";
		else if(sort.equals("혜택순"))
			query += " order by benefit desc";
		else
			query += "";
	}
	
	System.out.println(query);
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	Statement stmt_total = null;
	ResultSet rs_total = null;
	
	int code = 0;
	int price = 0;
	int stock = 0;
	String name = "";
	String description = "";
	String image = "";
	String tbl_category = "";
	String tbl_detail = "";
	String regist_date = "";
	float benefit = 0.00f;
	
	String total = "";
	
	try{
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt_total = con.createStatement();
		rs_total = stmt_total.executeQuery(query_total);
		
		
		while(rs_total.next()) total = rs_total.getString("total");
	
		stmt_total.close();
		rs_total.close();
		
		System.out.println(total);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!-- 배너광고 시작 -->
<!-- 배너 이미지 사이즈 1050x400  -->
<%-- <%
	if(menu.equals("신상품") || menu.equals("알뜰쇼핑")){
%>
<section>
	<div class="container" align="center">
	<div class="row">
		<div class="col">
		<a href="#"> <img src = "img/<%=menu %>.jpg" style="height:400px; width:1050px;"></a>
		</div>
	</div>
	</div>
	<br><br>
</section>
<%
	}
%> --%>
<!-- 배너광고 끝 -->

<!-- 카테코리 -->
<h3 align="center"><b> '<span style="color:purple"><%=findKeyword %></span>'에 대한 검색 결과</b></h3><br>

<%
	if(Integer.parseInt(total) == 0){
%>
	<br><br>
	<div align="center">
		<h4 class="nofind">검색된 상품이 없습니다.</h4>
	</div>
<%	}else {

%>
<!-- 정렬 조건 메뉴  -->
<div class="sort_box row">
	<div class="col" align="left">
		총 <%=total %>건
	</div>
	<div class="col" align="right">
		<a href="productAll.jsp?findKeyword=<%=findKeyword %>&sort=추천순">추천순</a> | 
		<a href="productAll.jsp?findKeyword=<%=findKeyword %>&sort=신상품순">신상품순</a> | 
		<a href="productAll.jsp?findKeyword=<%=findKeyword %>&sort=판매량순">판매량순</a> | 
		<a href="productAll.jsp?findKeyword=<%=findKeyword %>&sort=혜택순">혜택순</a> | 
		<a href="productAll.jsp?findKeyword=<%=findKeyword %>&sort=낮은가격">낮은 가격순</a> | 
		<a href="productAll.jsp?findKeyword=<%=findKeyword %>&sort=높은가격">높은 가격순</a>
	</div>
</div>

<!-- 상품 이미지, 이름, 가격, 설명 출력 - 카테고리, 상세 카테고리 여부에 따라 결정-->
	<div class="productList container">
		<div class="row">
			<% 
			DecimalFormat formatter = new DecimalFormat("###,###");
			try{				
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				
				while(rs.next()){
					
					price = rs.getInt("price");
					int discount = (int) (rs.getFloat("benefit") * 100);
					int dis_price =(int) (price*(1 - rs.getFloat("benefit")));	
					
			%>
				<div class="col-lg-4 col-md-6">
					<a id="choose" href="productdetail.jsp?code=<%=rs.getInt("code") %>&page=1">
					<section>
						<img src="<%=rs.getString("image") %>" class="img_size">
						<br><br>
						<h4 class="product"><%=rs.getString("name") %></h4>
			<%
				if(dis_price == rs.getInt("price")){
			%>			
			
						<h5 class="product"><b><%=formatter.format(dis_price) %> 원</b></h5>

						<br>
					</section>
					</a>
				</div>
			<% 
				}else{
			%>
						<h5 class="product"><b><span style="color:orange"><%=discount %>% &nbsp;</span><%=formatter.format(dis_price) %> 원</b></h5>
						<p class="product" style="color:#7A7883; text-decoration:line-through"><%=formatter.format(price) %>원</p>
						<%-- <p class="product" style="color:#7A7883"><%=rs.getString("description") %></p> --%>
						<br>
					</section>
					</a>
				</div>
			<%		
				} session.setAttribute("p_code", rs.getString("code"));
					}
					con.rollback();
					con.close();
					
					stmt.close();
					rs.close();

			}catch(Exception e){
				e.printStackTrace();
			}

			%>
		</div>
		<hr>
	</div>
<%
	}
%>
	
</body>

</html>