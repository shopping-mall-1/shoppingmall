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
 	int categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
	String detail_category = request.getParameter("detail_category"); 
	String sort = request.getParameter("sort");
		
	//메뉴 리스트
 	String[][] menu = {
			{"전체보기", "친환경", "고구마·감자·당근", "시금치·쌈채소·나물", "브로콜리·파프리카·양배추"},
			{"전체보기", "친환경", "제철과일", "국산과일", "수입과일", "견과류", "쌀"},
			{"전체보기", "제철수산", "생선류", "굴비·반건류","오징어·낙지·문어", "새우·게·랍스터","해산물·조개류","수산가공품","김·미역·해조류"},
			{"전체보기", "국내산 소고기", "수입산 소고기", "돼지고기", "계란류", "닭·오리고기"},
			{"전체보기", "국·탕·찌개", "밀키트·메인요리", "밑반찬", "김치·젓갈·장류", "베이컨·햄·통조림"},
			{"전체보기", "샐러드·간편식", "도시락·밥류", "떡볶이·튀김·순대", "피자·핫도그·만두", "죽·스프·카레", "선식·시리얼"},
			{"전체보기", "파스타·면류", "식초·소스·드레싱", "식용유·참기름·오일"},
			{"전체보기", "생수·탄산수", "음료·주스", "우유·두유·요거트", "커피", "차"},
			{"전체보기", "과자·스낵·쿠키", "초콜릿·캔디·젤리", "떡·한과", "아이스크림"},
			{"전체보기", "영양제", "유산균", "홍삼·인삼·꿀", "건강즙·건강음료", "건강분말", "다이어트"},
			{"전체보기", "레드와인", "화이트와인", "샴페인·스파클링"}
	}; 	
	
%> 

<!-- 카테코리 구역 시작-->
<h3 align="center"><b> 금주의 <%=category %></b></h3><br>
<!-- 카테고리 구역 끝  -->

<!-- 세부 카테고리 구역 시작 -->
<section>
 	<div class="row">
		<div class="category_box" align="center">
			<div class="category_innerbox">
				<div class="row">
		<%
			for(int i = 0; i < menu[categoryNum].length; i++) {
		%>
				<div class="c_menu col-3" align="left">
					<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=menu[categoryNum][i] %>"> <%=menu[categoryNum][i] %> </a>
				</div>
		<%
			}
		%>		
				</div>
			</div>
		</div>
	</div>	
<br>
</section>
<!-- 세부 카테고리 구역 끝  -->

<%
	// 상품 정보를 가져오는 쿼리
	String query = "select code, name, price, stock, description, image, category as tbl_category, detail_category as tbl_detail, regist_date, benefit, this_week from product where this_week= 'Y' and category= '" + category + "'";
	
	// product 테이블의 행 개수를 모두 세는 쿼리
	String query_total = "select Count(*) as total from product where this_week = 'Y'";
	
	// 세부 카테코리 값에 따라 쿼리 조건 추가
	if(detail_category== null || detail_category.equals("전체보기")){
		query += "";
		query_total += " and category= '" + category + "'";
	}else if(detail_category != null){
		query += " and detail_category= '" + detail_category + "'";
		query_total += " and detail_category= '" + detail_category + "'";
	}
	
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
	String this_week = "";
	
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

<!-- 정렬 조건 구역 시작 -->
<div class="sort_box row">
	<div class="col" align="left">
		총 <%=total %>건
	</div>
	<div class="col" align="right">
		<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=detail_category %>&sort=추천순">추천순</a> | 
		<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=detail_category %>&sort=신상품순">신상품순</a> | 
		<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=detail_category %>&sort=판매량순">판매량순</a> | 
		<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=detail_category %>&sort=혜택순">혜택순</a> | 
		<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=detail_category %>&sort=낮은가격">낮은 가격순</a> | 
		<a href="eventProduct.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=detail_category %>&sort=높은가격">높은 가격순</a>
	</div>
</div>
<!-- 정렬 조건 구역 끝  -->

<!-- 상품 리스트 출력 구역 시작 -->
<div class="productList container">
	<div class="row">
	<% 
		// 숫자를 천 단위 쉼표 넣어서 표현하기
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
					<img src="./<%=rs.getString("image") %>" class="img_size">
					<br><br>
					<h4 class="product"><%=rs.getString("name") %></h4>
					
		<%
				if(dis_price == rs.getInt("price")){ // 할인이 없는 경우
		%>			
		
					<h5 class="product"><b><%=formatter.format(dis_price) %> 원</b></h5>
					<br>
				</section>
				</a>
			</div>
		<% 
			}else{ // 할인하는 경우
		%>
					<h5 class="product"><b><span style="color:orange"><%=discount %>% &nbsp;</span><%=formatter.format(dis_price) %> 원</b></h5>
					<p class="product" style="color:#7A7883; text-decoration:line-through"><%=formatter.format(price) %>원</p>
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
<!-- 상품 리스트 출력 구역 끝  -->	

</body>
</html>