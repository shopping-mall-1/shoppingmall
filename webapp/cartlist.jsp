<%@page import="java.util.ArrayList"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="com.market.Product"%>
<%@page import="com.market.DBConnection"%>
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
<style>
*{
	
	margin:0 auto;
}
</style>
<script>

$(document).ready(function(){

		//유저 아이디가 cart테이블에 없으면 장바구니에 상품없습니다&&목록 div 없애기. 있으면 목록 출력
		if($('#count_cart').val()=='0'){
			$('#nocart').css('display','block');
			$('#orderform').css('display','none');
		}
		else{
			$('#orderform').css('display','block');
			$('#nocart').css('display','none');
		}
				
})

//한 줄 삭제
function deleteThis(){
	

    	event.target.parentElement.parentElement.parentElement.remove(); //화면에서 사라지게...
    	
    	//ajax로 deleteproc.jsp에 해당 상품 코드 보내기
		var code=0;
		var what = 'this';
		code=$('#code').val();

		console.log(code);
		var allData = {"code":code,"deleteWhat":what};
		
		$.ajax({
			url:"deleteproc.jsp",
			type:"POST",
			data:allData,
			datatype:"html"
		})

}

//체크된 것 삭제 
function checkDelete(){
	var codes = [];
    document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {
    	var val = $("input[name=buy]:checked").val();
    	codes.push(val);
        item.parentElement.parentElement.parentElement.remove();  	
      })
    	
        var what = 'check';
          
        console.log(what);
        
        var allData = {"codes":codes,"deleteWhat":what};
        
    		$.ajax({
    			url:"deleteproc.jsp",
    			type:"POST",
    			traditional:true,
    			data:allData,
    			datatype:"html",
    			success:function(data){
    				console.log(data);
    			},
    			error:function(data){
    				console.log(codes[0]);
    				console.log("실패");
    			}
    		})
    }
    

function allDelete(){
    document.querySelectorAll('.row.data').forEach(function (item) {
        item.remove();
       
      });
	var what = 'all';
	
	var allData = {"deleteWhat":what};
	
	$.ajax({
		url:"deleteproc.jsp",
		type:"POST",
		traditional:true,
		data:allData,
		datatype:"html",
		success:function(data){
			console.log(data);
		},
		error:function(data){
			
			console.log("실패");
		}
	})
	
}     
    
    
//체크박스 전체 선택 / 해제
$(document).on('click','#all',function(){    
	if($('#all').is(':checked')){     
		   $('.check_child').prop('checked',true);   
		  }else{      
			 $('.check_child').prop('checked',false);     
		  } });
$(document).on('click','.check_child',function(){   
	  if($('input[class=check_child]:checked').length==$('.check_child').length){    
		    $('#all').prop('checked',true);  
		  }else{   
			    $('#all').prop('checked',false);     } });

</script>
<body>
<%
	
	String userid = (String)session.getAttribute("id");

	Connection con_count = null;
	Statement stmt_count = null;
	ResultSet rs_count = null;
	
	//cart 테이블에 현재 유저 있는 지  있으면->목록 출력  없으면-> 장바구니에 상품이 없습니다.
	String query_count = "select count(customer) from cart where customer ='"+userid+"'";
	DataSource ds = (DataSource)this.getServletContext().getAttribute("dataSource");
	con_count = ds.getConnection();	
	stmt_count = con_count.createStatement();
	rs_count = stmt_count.executeQuery(query_count);	
	int p_code =0;
	int isInCart=0;
	if(rs_count.next()){
		isInCart = rs_count.getInt(1);
	}
	System.out.println("현재 유저 :"+userid+" 장바구니 담은 수:"+isInCart);
	stmt_count.close();
	con_count.close();
	rs_count.close();
	
	//이미지, 상품명, 개수, 금액 (상품 목록) 가져오기
	Connection con_cart = null;
	Statement stmt_cart = null;
	ResultSet rs_cart = null;
	
	int p_count=0;
	String name ="";
	int price=0;
	String image="";
	try{
	String query_cart = "SELECT a.p_code, a.p_count, b.name, b.price, b.image FROM cart AS a "+
			"INNER JOIN product AS b ON a.p_code=b.code AND a.customer='"+userid+"'";
	
	DataSource ds_cart = (DataSource)this.getServletContext().getAttribute("dataSource");

	con_cart = ds_cart.getConnection();
	stmt_cart = con_cart.createStatement();
	rs_cart = stmt_cart.executeQuery(query_cart);

	
	
	
%>
<!--고정영역 추가 -->
<jsp:include page='header.jsp'/>
<div id="body_container">

	<h3 align="center"> 장바구니 </h3>

<div style="display:inline-block;"><input type="checkbox" id="all" name="all"><label for="all"></label>전체선택 </div><!-- 전체 선택 --><br>
<div id="content_section">

 <br>
 <!-- 장바구니 리스트 -->
 
 <div id="cart_content" >
 	<input id="count_cart" type="hidden" value="<%=isInCart %>" />
 	<div id="nocart"><center id="nocart" style=" align-items: center;">장바구니에 담긴 상품이 없습니다.</center></div>
 	
	
		
 <form name="orderform" id="orderform" method="post" class="orderform" action="order.jsp" onsubmit="return false;">
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum" style="color:white;">합계</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split" style="margin-bottom:20px;"></div>
                </div>
        	           	<!-- 반복문으로 목록 출력 -->
 	<% 
 	int sum_price = 0;
 	
	while(rs_cart.next()){
		p_code = rs_cart.getInt("a.p_code");
		p_count = rs_cart.getInt("a.p_count");
		name = rs_cart.getString("b.name");
		price = rs_cart.getInt("b.price");
		
		image = rs_cart.getString("b.image");%>
	   
                <div class="row data" style="float:left;">
						
                    <div class="subdiv">
                    	<input type="hidden" value="<%=p_code %>">
                        <div class="check"><input type="checkbox" id="code" class="check_child" name="buy" checked="" value="<%=p_code %>">&nbsp;</div>
                        
                        <div class="img" style="margin-bottom:20px;"><img src="<%=image %>" width="60"></div>
                        <div class="pname">
                            <a href="productdetail.jsp?code=<%=p_code %>"><span><%=name %></span></a>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><%=price %></div>
                        <div class="num">
                            <div class="updown" style="display:flex;">
 				<div id="count_div1"><input id='btn_minus' type='button' value='-'/></div>
				<div id="p_num1"><%=p_count %></div><!-- 선택한 수량으로 바꾸기 -->
				<div id="count_div1"><input id='btn_plus' type='button' value='+'/></div>
                                
                            </div>
                        </div>
                        <div class="sum_value" style="margin-left:20px;"><%=price*p_count %></div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><button class="deleteThis" onclick="deleteThis()">삭제</button></div>
                    </div>
                </div>
                
               

	<% 
	}
	
	con_cart.close();
	stmt_cart.close();
	rs_cart.close();
	
 	}catch(Exception e){
 		e.printStackTrace();
 	}

 	%>
 	<script>
 	//수량에 따른 합계 영역, 총 금액 영역 변경 && ajax로 updatecart에 수량, 금액 업데이트 보내기

	
	function alterCartData(){
		var code=0;
		var count=0;
		var price=0;
		
		code=$("#code").html();
		count=$("#result").html();
		price=$("#price").html();
		
		var allData = {"code":code,"count":count,"price":price};
		
		$.ajax({
			url:"cartproc.jsp",
			type:"POST",
			data:allData,
			datatype:"html"
		})
	}
	
 	</script>
 	 
 	             <div class="right-align basketrowcmd">
                <button type="button" onclick="checkDelete()">선택상품삭제</button>
                <button type="button" onclick="allDelete()">장바구니비우기</button>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품 개수 : <%=isInCart %></div>
        
            <div class="bigtext right-align box blue summoney" id="sum_p_price"></div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="order.jsp">주문하기</a>
                </div>
            </div>
            </div>
                </form>
 </div>			
</div>
</div>
</body>
</html>