<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/cartlist.css">
<title>장바구니 목록</title>

</head>
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
		}
		else
	    	number = parseInt(number) + 1;
	    
	  }else if(type === 'minus')  { //빼기
		if(parseInt(number)-1<=1){
			$('#btn_minus').attr('disabled',true);
			number = 1;
		}
		else	
	    	number = parseInt(number) - 1;
	    //0이면 - 불가
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}
	
</script>
<!--고정영역 추가 -->
<div id="content_subject"><span>장바구니</span></div>
<input type="checkbox" id="all" name="all"><label for="all"></label> <!-- 전체 선택 -->
<div id="content_section">
 <!-- 장바구니 리스트 -->
	<ul>
		<li class="cartlist"> <!-- 목록 한 줄 -->
		<input type="checkbox" id="check"><label for="check"></label> 
		<img class="cart_img" width="60" height="70" style="margin-left:10px; margin-right:10px;"> 
		<a>
		<p>상품명 가져오기</p>
		</a>
		<div id="count_div">
			<div id="count_div1"><input id='btn_minus' type='button' onclick='count("minus")' value='-'/></div>
			<div id='result'>1</div><!-- 선택한 수량으로 바꾸기 -->
			<div id="count_div1"><input id='btn_plus' type='button' onclick='count("plus")' value='+'/></div>
		</div>
		<div id="price"><p>금액</p></div>
		<input id="btn_delete" type="button" value='x'>
		</li>
	</ul>
	<div id="cart_order"></div> <!-- 배송지, 금액, 주문하기 버튼 -->
	
</div>


</body>
</html>