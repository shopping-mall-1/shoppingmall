<%@page import="java.sql.*"%>
<%@page import="com.jsp.util.Page"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="com.market.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.market.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="css/productDetail.css">
<title>상품 상세 정보</title>
</head>
<style>
#mid_content{
width:1000px;
position: absolute;
left: 50%;
transform: translateX(-50%);
}

#container{
height:100%;
width:100%;

}

#side_left{
width:410px;
float:left;
margin:20px;
margin-top:5%;
}

#side_right{
width:450px;
float:right;
margin:30px;
margin-right:7%;
line-height: 1.2;
}

#side_right_box{
width:95%;
height:45%;
margin:5px;
margin-top:5%;
text-align: center;
}

#side_right_box2{
width:95%;
height:45%;
margin:5px;
margin-top:15%;
text-align: center;
}

#bottom_box{
width:100%;
margin:5px;
margin-top:100%;
text-align: center;
}

#count_div{
	width:150px;
	display:flex;
	margin-left:20px;
	margin-right:20px;
}

#count_div_1{
	float:right;
	margin-left:20px;
}

.btn {
	background-color: rgb(95, 0, 128);
	padding: 15px 30px;
	margin: 2px;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	color: white;
	font-weight: bold;
	display: inline-block;
	cursor: pointer;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	width: 160px;
	height: 50px;
	
}

#btn1:hover, .btn2:hover{
	background-color: gray;
}

</style>
<body>
<script>
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	 
	  // 더하기 : 재고보다 많게 선택하면 안된다고 알려주기
	  if(type === 'plus') {
		if(parseInt(number)-1>=0){
			$('#btn_minus').attr('disabled',false);
			number = parseInt(number)+1;
			plusPrice();
		}
		else{
			number = parseInt(number) + 1;
			plusPrice();
		}
			
	  }else if(type === 'minus')  { //빼기
		if(parseInt(number)-1<=1){
			$('#btn_minus').attr('disabled',true);
			number = 1;
			minusPrice();	
		}
		else{
				number = parseInt(number) - 1;
				minusPrice();
			}	
	  }
	  // 결과 출력. 선택한 수량
	  resultElement.innerText = number;
 
}
	
function gotoCart() {
	location.href = "cartlist.jsp";
}	
$(function(){
	  $("#confirm").click(function(){
	      gotoCart();
	      
	      //컨펌 이벤트 처리
	  });
	  $("#btn_cart").click(function(){        
	      $("#popup").css('display','flex').hide().fadeIn();
	      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
	  });
	  $("#close").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	  });
	  function modalClose(){
	      $("#popup").fadeOut(); //페이드아웃 효과
	  }
	    
	});
	
	
</script>
<%
	DBConnection con = new DBConnection();
	con.StartConnection(getServletConfig());

	//Integer p_code = (Integer)session.getAttribute("p_code");
	int p_code = Integer.parseInt(request.getParameter("code"));
	Product item = new Product();
	item = con.getproduct(p_code);
	int price = item.getPrice();
	con.CloseConnection();
	
	DBConnection con1 = new DBConnection();
	ArrayList<Product> listOfProducts = new ArrayList<Product>();
	con1.StartConnection(getServletConfig());
	listOfProducts = con1.GetAllProduct();
	con1.CloseConnection();
	
	%> 
<div class="container">
	
	<div style="width:1050px;height:50px"></div>
	<div id = "mid_content">
    		
    		<div id = "side_left" ><img src = <%=item.getImage() %> width=400px; height=500px;> </div>
		
		<div id = "side_right" align="left" >
			
			<h3><strong><%=item.getName() %></strong></h3>
			<p><h3><%=item.getPrice() %>원</h3>
			<hr size=1px>
			<p>회사 <%=item.getCompany() %>
			<hr size=1px>
			<p><h5>상세정보</h5> 
			<p><%=item.getDescription() %>
			<hr size=1px>
	
			<div id="count_div">
				<h4 style="font-weight: bold">수량</h4><div id="count_div1"><input id='btn_minus' type='button' onclick='count("minus")' value='-'/></div>
				<div id='result'>1</div><!-- 선택한 수량으로 바꾸기 -->
				<div id="count_div1"><input id='btn_plus' type='button' onclick='count("plus")' value='+'/></div>
			</div>
			<hr size=1px>			
			<div id = "side_right_box2">
			<div id="price_div" style="display:flex;">
				<p>총 상품금액 :<h3 id="price" style="font-weight: bold"><%=price %></h3>
			</div>	
			</div>
			<script>
				function plusPrice(){
					
					const priceElement = document.getElementById('price');
					
					let original_price = '<%=price%>' //화면에 표시된 원래 가격
					let now_price = priceElement.innerText; // 계산에 사용될 가격
				
					let price = now_price;
					//더하기 눌렸을 때 가격
					price = parseInt(now_price)+parseInt(original_price);
					priceElement.innerText = price;
				
				}
				
				function minusPrice(){
					
					const priceElement = document.getElementById('price');
					let original_price = '<%=price%>' //화면에 표시된 원래 가격
					let now_price = priceElement.innerText; // 계산에 사용될 가격
				
					let price = now_price;
					//빼기 눌렸을 때 가격
					price = parseInt(now_price)-parseInt(original_price);
					priceElement.innerText = price;
				}
			</script>
		
			<div id = "side_right_box">
				<button class="btn btn1" id="btn_cart">장바구니 담기</button>
				<button class="btn btn2" id="btn_order">바로주문</button>

			</div><br>
 
			<div class="popup-wrap" id="popup" style="display:none;"> 
	    		<div class="popup">
	      			<div class="popup-head">	
	          		<span class="head-title">Kurly</span>
	      </div>
	      			<div class="popup-body">	
	        		<div class="body-content">
	          		<div class="body-titlebox">
	          		</div>
	          		<div class="body-contentbox">
	          	  	<p> 장바구니에 상품이 담겼습니다.</p>
	            		장바구니로 이동하시겠습니까?
	         		 </div>
	        		</div>
	     			 </div>
	      			<div class="popup-foot"> 
	       				 <span class="pop-btn confirm" id="confirm">장바구니로 가기</span>
	        			 <span class="pop-btn close" id="close" style="color:white; font-size:15px;">창 닫기</span>
	      			</div>
	    		</div>
			</div>
		</div>		
		<div id = "bottom_box">
		<p>인기상품
		<hr size=1px>
			<div class="container">
			<div class="row" align="center">
				<% for(int i = 0; i < 4; i++) {
					Product item2 = listOfProducts.get(i); 		%>
			<div class="col-md-3">
				<p><a href="productdetail.jsp?code=<%=item2.getCode() %>"><img src = <%=item2.getImage() %> width=100px; height=120px;></a>
				<p><%=item2.getName() %>
				<p><%=item2.getPrice() %>원
			</div>
			<% } %>
		</div>
		<hr >
	</div>
		</div>
	
</div>
</div>

</body>
</html>