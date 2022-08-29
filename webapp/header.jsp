<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
</head>
<script>
$(document).ready(function(){
	//menu v1 
	$(".menu-v1").mouseover(function(){
		$(this).children(".submenu").stop().slideDown();
	});
	$(".menu-v1").mouseleave(function(){
		$(this).children(".submenu").stop().slideUp();
	});
	
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(200);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
	
	$('.slider').bxSlider({pager:true, auto:true}); //슬라이더
});

</script>
<body>

<div id="container">

	<div id="wrap">
	<div id="user_menu">
		<ul id="user_menu">
			<li style="margin:10px; "><a href="Account/signup.jsp">회원가입</a></li>  <!-- 각 기능이 있는 파일 링크 걸기 -->
			<%
				String username = (String)session.getAttribute("name");
				String role = (String)session.getAttribute("role");
				if(username == null) {
			%>
			<li style="margin:10px;"><a href="Account/login.jsp"> 로그인</a>  </li>
			<% }
				else {
					System.out.println("헤더: " + role);
					if(role.equals("none")) {
			%><!-- 로그아웃 링크 추가하기(Account/logout.jsp) -->
						<li style="margin:10px;"><a href="mypage.jsp"><b><%=username %></b></a> 님  </li>
			<%		} else if(role.equals("admin")) { %>
						<li style="margin:10px;"><a href="mypage_admin.jsp"><b><%=username %></b></a> 님  </li>
			<%		}
				} 
			%>
			<li style="margin:10px;"><a href="#"> 고객센터 ▼</a> </li>
		</ul>
	</div>
		<header>
			<a href="index.jsp" style='margin:10px; padding:0'><img src='css/logo.svg' style='margin:10px; padding:0'></a>
			<span style='color:rgb(95, 0, 128); margin:0px;'>마켓컬리</span>
		  	<div class="search">
  				<input type="text" placeholder="검색어 입력">
  				<img id="searchimg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			</div>
			<div class="menu_personal">
				<a href="#"><img src="css/gps.png" width="30px" height="30px"></a> <!-- 각 기능이 있는 파일 링크 걸기 -->
				<a href="#"><img src="css/cart.png" width="30px" height="30px"></a>
			</div>
			
		</header>
		<div id="menu">	
		<div class="dropdown">
		      <div class="menu_list" style="display:flex; align-items:center; ">
		      <img src="css/hamburger.png" style="margin:0;">
		      <span class="dropbtn"  style="margin:0;">카테고리</span>
		      
		       <div id="menu_list" style="  display:flex;">			      
			       <div style=" align-items:center; margin-left:160px;">
				      <a href="productAll.jsp?menu=신상품"><span>신상품</span> </a>
			      </div>
	    		 <div style="align-items:center; margin-left:160px;">
				      <a href="productAll.jsp?menu=베스트"><span>베스트</span> </a>
			      </div>
			      <div style=" align-items:center; margin-left:160px;">
				      <a href="productAll.jsp?menu=알뜰쇼핑"><span>알뜰쇼핑</span> </a>
			      </div>
	    		 <div style=" align-items:center; margin-left:160px;">
				      <a href="productAll.jsp?menu=특가/혜택"><span>특가/혜택</span> </a>
			      </div>	
		     </div> 
		      </div>

		      <div class="dropdown-content" style="margin:0;">
				<ul id="nav-v2" style="margin-left:0; padding-left:0;'">
					<li class="menu-v2"><a href="productList.jsp?category=채소&categoryNum=0">채소</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=채소&categoryNum=0&detail_category=친환경">친환경</a></li>
							<li><a href="productList.jsp?category=채소&categoryNum=0&detail_category=고구마·감자·당근">고구마·감자·당근</a></li>
							<li><a href="productList.jsp?category=채소&categoryNum=0&detail_category=시금치·쌈채소·나물">시금치·쌈채소·나물</a></li>
							<li><a href="productList.jsp?category=채소&categoryNum=0&detail_category=브로콜리·파프리카·양배추">브로콜리·파프리카·양배추</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=과일·견과·쌀&categoryNum=1">과일·견과·쌀</a>
						<ul class="submenu">	
							<li><a href="productList.jsp?category=과일·견과·쌀&categoryNum=1&detail_category=친환경">친환경</a></li>
							<li><a href="productList.jsp?category=과일·견과·쌀&categoryNum=1&detail_category=제철과일">제철과일</a></li>
							<li><a href="productList.jsp?category=과일·견과·쌀&categoryNum=1&detail_category=국산과일">국산과일</a></li>
							<li><a href="productList.jsp?category=과일·견과·쌀&categoryNum=1&detail_category=수입과일">수입과일</a></li>
							<li><a href="productList.jsp?category=과일·견과·쌀&categoryNum=1&detail_category=견과류">견과류</a></li>
							<li><a href="productList.jsp?category=과일·견과·쌀&categoryNum=1&detail_category=쌀">쌀</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2">수산·해산·건어물</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=제철수산">제철수산</a></li>
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=생선류">생선류</a></li>
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=굴비·반건류">굴비·반건류</a></li>
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=오징어·낙지·문어">오징어·낙지·문어</a></li>
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=새우·게·랍스터">새우·게·랍스터</a></li>
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=해산물·조개류">해산물·조개류</a></li>
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=수산가공품">수산가공품</a></li>
							<li><a href="productList.jsp?category=수산·해산·건어물&categoryNum=2&detail_category=김·미역·해조류">김·미역·해조류</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=정육·계란&categoryNum=3">정육·계란</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=정육·계란&categoryNum=3&detail_category=국내산소고기">국내산 소고기</a></li>
							<li><a href="productList.jsp?category=정육·계란&categoryNum=3&detail_category=수입산소고기">수입산 소고기</a></li>
							<li><a href="productList.jsp?category=정육·계란&categoryNum=3&detail_category=돼지고기">돼지고기</a></li>
							<li><a href="productList.jsp?category=정육·계란&categoryNum=3&detail_category=계란류">계란류</a></li>
							<li><a href="productList.jsp?category=정육·계란&categoryNum=3&detail_category=닭·오리고기">닭·오리고기</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=국·반찬·메인요리&categoryNum=4">국·반찬·메인요리</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=국·반찬·메인요리&categoryNum=4&detail_category=국·탕·찌개">국·탕·찌개</a></li>
							<li><a href="productList.jsp?category=국·반찬·메인요리&categoryNum=4&detail_category=밀키트·메인요리">밀키트·메인요리</a></li>
							<li><a href="productList.jsp?category=국·반찬·메인요리&categoryNum=4&detail_category=밑반찬">밑반찬</a></li>
							<li><a href="productList.jsp?category=국·반찬·메인요리&categoryNum=4&detail_category=김치·젓갈·장류">김치·젓갈·장류</a></li>
							<li><a href="productList.jsp?category=국·반찬·메인요리&categoryNum=4&detail_category=베이컨·햄·통조림">베이컨·햄·통조림</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=샐러드·간편식&categoryNum=5">샐러드·간편식</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=샐러드·간편식&categoryNum=5&detail_category=샐러드·닭가슴살">샐러드·닭가슴살</a></li>
							<li><a href="productList.jsp?category=샐러드·간편식&categoryNum=5&detail_category=도시락·밥류">도시락·밥류</a></li>
							<li><a href="productList.jsp?category=샐러드·간편식&categoryNum=5&detail_category=파스타·면류">파스타·면류</a></li>
							<li><a href="productList.jsp?category=샐러드·간편식&categoryNum=5&detail_category=떡볶이·튀김·순대">떡볶이·튀김·순대</a></li>
							<li><a href="productList.jsp?category=샐러드·간편식&categoryNum=5&detail_category=피자·핫도그·만두">피자·핫도그·만두</a></li>
							<li><a href="productList.jsp?category=샐러드·간편식&categoryNum=5&detail_category=죽·스프·카레">죽·스프·카레</a></li>
						 	<li><a href="productList.jsp?category=샐러드·간편식&categoryNum=5&detail_category=선식·시리얼">선식·시리얼</a></li>
						
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=면·양념·오일&categoryNum=6">면·양념·오일</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=면·양념·오일&categoryNum=6&detail_category=파스타·면류">파스타·면류</a></li>
							<li><a href="productList.jsp?category=면·양념·오일&categoryNum=6&detail_category=식초·소스·드레싱">식초·소스·드레싱</a></li>
							<li><a href="productList.jsp?category=면·양념·오일&categoryNum=6&detail_category=식용유·참기름·오일">식용유·참기름·오일</a></li>
							
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=생수·음료·우유·커피&categoryNum=7">생수·음료·우유·커피</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=생수·음료·우유·커피&categoryNum=7&detail_category=생수·탄산수">생수·탄산수</a></li>
							<li><a href="productList.jsp?category=생수·음료·우유·커피&categoryNum=7&detail_category=틈료·주스">음료·주스</a></li>
							<li><a href="productList.jsp?category=생수·음료·우유·커피&categoryNum=7&detail_category=우유·두유·요거트">우유·두유·요거트</a></li>
							<li><a href="productList.jsp?category=생수·음료·우유·커피&categoryNum=7&detail_category=커피">커피</a></li>
							<li><a href="productList.jsp?category=생수·음료·우유·커피&categoryNum=7&detail_category=차">차</a></li>
						
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=간식·과자·떡&categoryNum=8">간식·과자·떡</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=간식·과자·떡&categoryNum=8&detail_category=과자·스낵·쿠키">과자·스낵·쿠키</a></li>
							<li><a href="productList.jsp?category=간식·과자·떡&categoryNum=8&detail_category=초콜릿·캔디·젤리">초콜릿·캔디·젤리</a></li>
							<li><a href="productList.jsp?category=간식·과자·떡&categoryNum=8&detail_category=떡·한과">떡·한과</a></li>
							<li><a href="productList.jsp?category=간식·과자·떡&categoryNum=8&detail_category=아이스크림">아이스크림</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=건강식품&categoryNum=9">건강식품</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=건강식품&categoryNum=9&detail_category=영양제">영양제</a></li>
							<li><a href="productList.jsp?category=건강식품&categoryNum=9&detail_category=유산균">유산균</a></li>
							<li><a href="productList.jsp?category=건강식품&categoryNum=9&detail_category=홍삼·인삼·꿀">홍삼·인삼·꿀</a></li>
							<li><a href="productList.jsp?category=건강식품&categoryNum=9&detail_category=건강즙·건강음료">건강즙·건강음료</a></li>
							<li><a href="productList.jsp?category=건강식품&categoryNum=9&detail_category=건강분말">건강분말</a></li>
							<li><a href="productList.jsp?category=건강식품&categoryNum=9&detail_category=다이어트">다이어트</a></li>
						
						</ul>
					</li>
					<li class="menu-v2"><a href="productList.jsp?category=와인&categoryNum=10">와인</a>
						<ul class="submenu">
							<li><a href="productList.jsp?category=와인&categoryNum=10&detail_category=레드와인">레드와인</a></li>
							<li><a href="productList.jsp?category=와인&categoryNum=10&detail_category=화이트와인">화이트와인</a></li>
							<li><a href="productList.jsp?category=와인&categoryNum=10&detail_category=샴페인·스파클링">샴페인·스파클링</a></li>
							
						</ul>
					</li>
				</ul>

		        
     	</div>
			   </div>

		     </div>

		</div>
		</div>
		<hr>