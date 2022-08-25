<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/index.css">
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
			<li style="margin:10px; "><a href="#">회원가입</a></li>  <!-- 각 기능이 있는 파일 링크 걸기 -->
			<li style="margin:10px;"><a href="#"> 로그인</a>  </li>
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
				      <span >신상품</span>
			      </div>
	    		 <div style="align-items:center; margin-left:160px;">
				      <span >베스트</span>
			      </div>
			      <div style=" align-items:center; margin-left:160px;">
				      <span >알뜰쇼핑</span>
			      </div>
	    		 <div style=" align-items:center; margin-left:160px;">
				      <span>특가/혜택</span>
			      </div>	
		     </div> 
		      </div>

		      <div class="dropdown-content" style="margin:0;">
				<ul id="nav-v2" style="margin-left:0; padding-left:0;'">
					<li class="menu-v2"><a href="#">채소</a>
						<ul class="submenu">
							<li><a href="#">친환경</a></li>
							<li><a href="#">고구마,감자,당근</a></li>
							<li><a href="#">시금치,쌈채소,나물</a></li>
							<li><a href="#">브로콜리,파프리카,양배추</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="#">과일,견과,쌀</a>
						<ul class="submenu">	
							<li><a href="#">친환경</a></li>
							<li><a href="#">제철과일</a></li>
							<li><a href="#">국산과일</a></li>
							<li><a href="#">수입과일</a></li>
							<li><a href="#">견과류</a></li>
							<li><a href="#">쌀</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="#">수산,해산,건어물</a>
						<ul class="submenu">
							<li><a href="#">제철수산</a></li>
							<li><a href="#">생선류</a></li>
							<li><a href="#">굴비,반건류</a></li>
							<li><a href="#">오징어,낙지,문어</a></li>
							<li><a href="#">새우,게,랍스터</a></li>
							<li><a href="#">해산물,조개류</a></li>
							<li><a href="#">수산가공품</a></li>
							<li><a href="#">김,미역,해조류</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="#">정육,계란</a>
						<ul class="submenu">
							<li><a href="#">국내산 소고기</a></li>
							<li><a href="#">수입산 소고기</a></li>
							<li><a href="#">돼지고기</a></li>
							<li><a href="#">계란류</a></li>
							<li><a href="#">닭,오리고기</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="#">국,반찬,메인요리</a>
						<ul class="submenu">
							<li><a href="#">국,탕,찌개</a></li>
							<li><a href="#">밀키트,메인요리</a></li>
							<li><a href="#">밑반찬</a></li>
							<li><a href="#">김치,젓갈,장류</a></li>
							<li><a href="#">베이컨,햄,통조림</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="#">샐러드,간편식</a>
						<ul class="submenu">
							<li><a href="#">샐러드,닭가슴살</a></li>
							<li><a href="#">도시락,밥류</a></li>
							<li><a href="#">파스타,면류</a></li>
							<li><a href="#">떡볶이,튀김,순대</a></li>
							<li><a href="#">피자,핫도그,만두</a></li>
							<li><a href="#">죽,스프,카레</a></li>
						 	<li><a href="#">선식,시리얼</a></li>
						
						</ul>
					</li>
					<li class="menu-v2"><a href="#">면,양념,오일</a>
						<ul class="submenu">
							<li><a href="#">파스타,면류</a></li>
							<li><a href="#">식초,소스,드레싱</a></li>
							<li><a href="#">식용유,참기름,오일</a></li>
							
						</ul>
					</li>
					<li class="menu-v2"><a href="#">생수,음료,우유,커피</a>
						<ul class="submenu">
							<li><a href="#">생수,탄산수</a></li>
							<li><a href="#">음료,주스</a></li>
							<li><a href="#">우유,두유,요거트</a></li>
							<li><a href="#">커피</a></li>
							<li><a href="#">차</a></li>
						
						</ul>
					</li>
					<li class="menu-v2"><a href="#">간식,과자,떡</a>
						<ul class="submenu">
							<li><a href="#">과자,스낵,쿠키</a></li>
							<li><a href="#">초콜릿,캔디,젤리</a></li>
							<li><a href="#">떡,한과</a></li>
							<li><a href="#">아이스크림</a></li>
						</ul>
					</li>
					<li class="menu-v2"><a href="#">건강식품</a>
						<ul class="submenu">
							<li><a href="#">영양제</a></li>
							<li><a href="#">유산균</a></li>
							<li><a href="#">홍삼,인삼,꿀</a></li>
							<li><a href="#">건강즙,건강음료</a></li>
							<li><a href="#">건강분말</a></li>
							<li><a href="#">다이어트</a></li>
						
						</ul>
					</li>
					<li class="menu-v2"><a href="#">와인</a>
						<ul class="submenu">
							<li><a href="#">레드와인</a></li>
							<li><a href="#">화이트와인</a></li>
							<li><a href="#">샴페인,스파클링</a></li>
							
						</ul>
					</li>
				</ul>

		        
     	</div>
			   </div>

		     </div>

		</div>
	<div class="slider">
    	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/e831a059-ca75-4d55-a78e-128a96ce028d.jpg"></div>
   	 	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/026ebc78-835d-4bed-ad49-9a55b2ce0b36.jpg"></div>
   	 	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/300ef081-0ccc-4cf9-8eab-ec5117e7ec2c.jpg"></div>
   	 	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/2918f8a3-59a8-462f-8f1a-f895979a292b.jpg"></div>
   	 	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/a24b2e93-2efd-4921-9838-e4c03de2a2f3.png"></div>
   	 	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/e555d31c-df05-44a6-ba00-eb64156e1c76.jpg"></div>
   	 	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/4dc79c6b-b6bd-431e-8533-5b12f61ee136.jpg"></div>
   	 	 <div><img src="https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/ff053cc9-d2a3-4ba2-96a8-5dc858feaef6.jpg"></div>

	</div>			
	
	</div>
	


</body>
</html>