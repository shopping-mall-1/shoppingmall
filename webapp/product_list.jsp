<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.market.DBConnection"%>
<%@page import="java.sql.*"%>  
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.market.Product" %>
<%@page import="javax.sql.DataSource"%>

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
	hieght:auto;
	border: 1px solid #D9D9D9;
	position: relative;
	left: calc(50% - 1050px/2 - 12px);
	item-align:center;
}

.category_innerbox{

	box-sizing: border-box;
	width:900px;
	hieght:auto;
	border: 1px solid #ffffff;
	position: relative;
	item-align:center;]
	margin:auto;
}

.c_menu{
	padding:15px;
}

.sort_box{
	box-sizing: border-box;
	width:1050px;
	hieght:auto;
	border: 1px solid #ffffff;
	position: relative;
	left: calc(50% - 1050px/2 - 12px);
	margin-bottom:20px;
	font-size:11px;
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
	position:relative;	
}

</style>

<script>
function gotoDetail()
{
	location.href="ProductDetail.jsp";
}
	
</script>

</head>
<body>

<!-- header 들어갈 구역 -->
<section>

<br>
</section>

<!-- 배너광고 구역 -->
<section>
	<div class="container" align="center">
	<div class="row">
		<div class="col">
		<a href="#"> <img src = "/img/img_add.jpg"></a>
		</div>
	</div>
	</div>
	<br><br>
</section>



<%
	String category = request.getParameter("category");
	int categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
	String detail_category = request.getParameter("detail_category");
	DBConnection con = new DBConnection();
	ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	con.StartConnection(getServletConfig());
	listOfProducts = con.GetAllProduct();
	con.CloseConnection();
	
	//들어오는 값 확인
	System.out.println(category);
	System.out.println(detail_category);	
	
	//분리 - 메뉴 리스트
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
<!-- 카테코리 -->
<h3 align="center"><b> <%=category %></b></h3><br>

<!-- 세부카테고리 구역 -->
<section>
 	<div class="row">
		<div class="category_box" align="center">
			<div class="category_innerbox" align="center">
				<div class="row">
		<%
			for(int i = 0; i < menu[categoryNum].length; i++) {
		%>
				<div class="c_menu col-4">
					<a href="product_list.jsp?category=<%=category %>&categoryNum=<%=categoryNum %>&detail_category=<%=menu[categoryNum][i] %>"> <%=menu[categoryNum][i] %> </a>
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

<!-- 정렬 조건 메뉴  -->
<div class="sort_box row">
	<div class="col" align="left">
		<!-- 건수 표시 -->
	</div>
	<div class="col" align="right">
		<a href="#">추천순</a> | <a href="#">신상품순</a> | <a href="#">판매량순</a> | <a href="#">낮은 가격순</a> | <a href="#">높은 가격순</a>
	</div>
</div>

<!-- 상품 이미지, 이름, 가격, 설명 출력 - 카테고리, 상세 카테고리 여부에 따라 결정-->
	<div class="productList container" align="center" onclick="gotoDetail()">
		<div class="row" align="center">
			<% 
				for(int i = 0; i < listOfProducts.size(); i++) {
				Product item = listOfProducts.get(i); 		
				
				
				if(detail_category== null || detail_category.equals("전체보기")){
					if(item.getCategory().equals(category)){
						
			%>
				<div class="col-lg-4">
					<a id="choose" href="ProductDetail.jsp?code=<%=item.getCode() %>">
					<section>
						<img src="./img/product_img/<%=item.getImage() %>" class="img_size">
						<br><br>
						<h4 class="product"><%=item.getName() %></h4>
						<p class="product"><%= item.getDescription() %></p>
						<p class="product"><%= item.getPrice() %>원</p></a>
					</section>
				</div>
			<% 
						}
					}
				else if(detail_category != null){
					if(item.getDetail_category().equals(detail_category)){
			%>
					<div class="col-lg-4">
						<a id="choose" href="ProductDetail.jsp?code=<%=item.getCode()%>">
						<section>
							<img src="./img/product_img/<%=item.getImage() %>" class="img_size">
							<br><br>
							<h4 class="product"><%=item.getName() %></h4>
							<p class="product"><%= item.getDescription() %></p>
							<p class="product"><%= item.getPrice() %>원</p>
						</section>
						</a>
					</div>
			<% 
		   				session.setAttribute("p_code",item.getCode());	}
					}
				}
			%>
		</div>
		<hr>
	</div>

	
</body>
</html>