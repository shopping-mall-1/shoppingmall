<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="com.market.DBConnection"%>
<%@ page import="com.market.Product" %>
<%@ page import="com.market.Product" %>
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
<title>메인상품</title>
</head>
<script>

   <%int start = 9;%>
    let curPos = 0
    $('#next').click(function(){
        slideNext();
        <% start += 4; %>
    })

    $('#prev').click(function(){
        slidePrev();
        <% start -= 4; %>
    })

    function slideNext() {

        //fadein animation
        //curPos = 현재페이지 (페이지네이션)
        //100 4 25

        //1 25
        //1 = 4보여주는 개수() / 전체 데이터  - 1
        if (curPos < 1) {
            $($(".grid_1_items")[curPos]).toggleClass("active")
            $(".grid_1_items").hide();

            curPos += 1;
            $($(".grid_1_items")[curPos]).toggleClass("active")
            $(".active").fadeIn(800);
            
        } 
        
        // 마지막 페이지일경우에
        //else if (curPos == 1) {

        //}
    }
    
    function slidePrev() {

        if (curPos > 0) {
            $($(".grid_1_items")[curPos]).toggleClass("active")
            $(".grid_1_items").hide();
            curPos -= 1;
            $($(".grid_1_items")[curPos]).toggleClass("active")
            $(".active").fadeIn(800);
        } 
        //첫번째 페이지일떄
        //else if (curPos == 0) {

        //}
    }
});

</script>
<body>
   <%
      DBConnection con = new DBConnection();
      ArrayList<Product> listOfProducts = new ArrayList<Product>();
      
      con.StartConnection(getServletConfig());
      listOfProducts = con.GetAllProduct();
      con.CloseConnection();
      
      //String query = "select recommand from product where recommand like '추석%'";
      //System.out.println(query);
   %>

   <div class="pick_title">이 상품 어때요?</div>

   <div class="grid_1">
      <div id="prev"><img src="css/arrow-left.png"></div>
      <%
      
      for (int i = start ; i < start+4; i++) {
         Product item = listOfProducts.get(i);
      %>
         <div class="grid_1_item">
            <img src=<%=item.getImage()%> alt="상품 이미지" loading="lazy">
   
            <h3 class="product_title"><%=item.getName()%></h3>
            <div>
               <span class="discount_rate">36%</span> <span class="price"><%=item.getPrice()%>원</span>
            </div>
            <span class="pre_price">39,000 원</span>
         </div>
      <% } %>
      
      <div id="next"><img src="css/arrow-right.png"></div>
      
   </div>

   <div class="special_all">
	    <div class="special_item">
	        <div class="special_item_1">
	            <div>
	                <div class="c_1">추석 특가</div> <br>
	                <div class="c_2">24시간 한정 특가</div> <br>
	                <div class="c_3">12:00:00</div> <br>
	                <div class="c_4">망설이면 늦어요!</div> <br>
	            </div>
			</div>
			<div class="grid_2_item">
				<% for(int i = 7; i < 9; i++) {
	           		Product item = listOfProducts.get(i); %>
	           		<div>
					<img src=<%=item.getImage() %> alt="상품 이미지" loading="lazy"> <br>
	
					<h3 class="product_title"><%=item.getName() %></h3>
						<span class="discount_rate">36%</span> 
						<span class="price"><%= item.getPrice() %>원</span>
						<span class="pre_price">39,000 원</span>
					</div>
				<% } %>
			</div>
	    </div>
    </div>
</body>
</html>