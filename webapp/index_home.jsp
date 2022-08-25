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
	
	$('.slider').bxSlider({pager:true, auto:true}); //슬라이더
});

</script>
<body>
<div id="container">
<jsp:include page="header.jsp" />
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