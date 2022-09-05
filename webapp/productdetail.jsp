<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="com.market.Page"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="com.market.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.market.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="css/productDetail.css">
<link rel="stylesheet" type="text/css" href="css/list.css">
<title>상품 상세 정보</title>
</head>
<style>
*{
	margin: 0 auto;
}
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
	width:400px;
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
	padding: 15px 50px;
	margin: 30px;
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
	width: 380px;
	height: 50px;
	
}

#btn1:hover, .btn2:hover{
	background-color: gray;
}

#bottom_content{
width:1000px;
position: absolute;
left: 50%;
transform: translateX(-50%);
top-margin:30px;
}

input{
width:300px;
}

</style>
<body>
<script>
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  let stock = $('#stock').text();
	 
	  // 더하기 : 재고보다 많게 선택하면 안된다고 알려주기
	  if(type === 'plus') {
		if(parseInt(number)-1>=0){
			$('#btn_minus').attr('disabled',false);
			if(parseInt(number)+1>stock){
				alert("재고가 부족합니다.");
			}else{
				number = parseInt(number)+1;
				plusPrice();
			}
		
		}
		else{
			if(parseInt(number)+1>stock){
				alert("재고가 부족합니다.");
			}else{
				number = parseInt(number)+1;
				plusPrice();
			}
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
	    
	  if($('#stock').text()=='0'){
		  //장바구니 담기, 바로주문 버튼 없애고 품절 버튼 나오게
		  $('#btn_cart').css('display','none');
		  $('#btn_order').css('display','none');
		  
		  $('#btn_out').css('display','block');
	  }else{
		  $('#btn_cart').css('display','block');
		  $('#btn_order').css('display','block');
		  
		  $('#btn_out').css('display','none');		  
	  }
	});
	
	
	
	
</script>
<%
	
	DBConnection con = new DBConnection();
	con.StartConnection(getServletConfig());

	
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
	session.setAttribute("code", p_code);
	
	%> 
<div class="container">
	
	<div style="width:1050px;height:50px"></div>
	<div id = "mid_content">
    		
    		<div id = "side_left" ><img src = <%=item.getImage() %> width=400px; height=500px;> </div>
		
		<div id = "side_right" align="left" >
			<input type="hidden" id="code" value=<%=item.getCode() %>>
			<h3><strong><%=item.getName() %></strong></h3>
			<p><h3><%=item.getPrice() %>원</h3>
			<hr size=1px>
			<p>회사 <%=item.getCompany() %>
			<hr size=1px>
			<p><h5>상세정보</h5> 
			<p><%=item.getDescription() %>
			<hr size=1px>
	
			<div id="count_div">
				<h4 style="font-weight: bold">수량</h4><div id="count_div1"><input id='btn_minus' type='button' style="width:50px" onclick='count("minus")' value='-' disabled="disabled"/></div>
				<div id='result'>1</div><!-- 선택한 수량으로 바꾸기 -->
				<div id="count_div1"><input id='btn_plus' type='button' style="width:50px" onclick='count("plus")' value='+'/></div>
				<div style="display:flex;"> 
					<h6 style="font-weight: bold;">재고</h6>
					<div id="stock" style=" margin-left:20px;"><%=item.getStock() %></div>
					<h6 style="font-weight: bold;">개</h6>
				</div>	
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
				
				function sendCartData(){
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
		
			<div id = "side_right_box">
				<button class="btn btn1" id="btn_cart" onclick="sendCartData()">장바구니 담기</button>
				<button class="btn btn1" id="btn_out" style="display:none;">품절</button>
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
				<p><a href="productdetail.jsp?code=<%=item2.getCode() %>&page=1"><img src = <%=item2.getImage() %> width=100px; height=120px;></a>
				<p><%=item2.getName() %>
				<p><%=item2.getPrice() %>원
			</div>
			<% } %>
		</div>
		<hr >
	</div>
		</div>
	

<div id = "bottom_content">
<div style="width:1050px;height:50px"></div> 
<h4><Strong>PRODUCT Q&A</Strong></h4>
<div style="width:1050px;height:5px"></div> 
<h7 style="color:gray"><p>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
<p>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <strong>1:1문의</strong>에 남겨주세요.</h7>

 <%
	int pageNum = Integer.parseInt(request.getParameter("page"));
	String searchType = request.getParameter("searchType")==null?"":request.getParameter("searchType");
	String keyword = request.getParameter("keyword")==null?"":request.getParameter("keyword");

	String id = (String)session.getAttribute("id");
	//if(id == null) response.sendRedirect("Account/login.jsp");

	request.setCharacterEncoding("utf-8");
 %>	
<script>

function search(){
	
	var page = $("pageNum").val();
	var searchType = $("#searchType").val();
	var keyword =  $("#keyword").val();
	location.href = 'productdetail.jsp?code=<%=item.getCode()%>&page=<%=pageNum %>&searchType=' + searchType + '&keyword=' + keyword;
}

</script>


</head>

<body>
<div style="width:1050px;height:50px"></div>
<div class="tableDiv">

	<table class="InfoTable">
  		<tr>
   			<th>번호</th>
   			<th>제목</th>
   			<th>작성자</th>
   			<th>조회수</th>
   			<th>작성일</th>
  		</tr>

 		<tbody>

<%  
 	
	int postNum = 5; //한 페이지에 보여질 게시물 갯수 
	int displayPost = (pageNum -1)*postNum; //테이블에서 읽어 올 행의 위치

	String query = "select @rownum:=@rownum+1 as seq, seqno, mtitle, mwriter, to_char(mregdate,'YYYY-MM-DD HH24:MI:SS') as mregdate," 
			+ "hitno from (select @rownum:=0) a, mboard b where code = " + p_code;
	
	if(searchType.equals("mtitle")) 
		query += " and mtitle like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%')";
	else if(searchType.equals("mcontent"))
		query += " and mcontent like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%')";
	else if(searchType.equals("mtitle_mcontent"))
		query += " and mtitle like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%') or mcontent like concat('%','" + keyword + "','%')"; 
	else if(searchType.equals("mwriter"))
		query += " and mwriter like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%')";
	query += " order by seqno desc limit "+ displayPost + "," + postNum;
	
	
	System.out.println("[게시판 목록 보기 쿼리] : " + query);
	
	Connection con2 = null;
    Statement stmt = null;
    ResultSet rs = null;
        
	try{

		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con2 = ds.getConnection();
		
		stmt = con2.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			 
%>
 	<tr onMouseover="this.style.background='#f9f2ff';" onmouseout="this.style.background='white';">
		<td><%=rs.getInt("seq") %></td>
		<td style="text-align:left;">
			<a id="hypertext" href="view.jsp?code=<%=item.getCode()%>&seqno=<%=rs.getInt("seqno") %>&page=<%=pageNum %>&searchType=<%=searchType %>&keyword=<%=keyword %>" onMouseover='this.style.textDecoration="underline"' 
			  onmouseout="this.style.textDecoration='none';"><%=rs.getString("mtitle") %></a>
		</td>  
		<td><%=rs.getString("mwriter") %></td>
		<td><%=rs.getInt("hitno") %></td>
		<td><%=rs.getString("mregdate") %></td> 
	</tr>
<% 
		}
	}catch(Exception e)	 {
		e.printStackTrace();
	}
	
	if(stmt != null) stmt.close();
	if(rs != null) rs.close();
	if(con != null) con2.close();
	
%>
			
	</tbody>

	</table>
	<br>

	<div>
	
<%

	int listCount = 5; //한 화면에 보여질 페이지 갯수
	int totalCount = 0; //전체 게시물 갯수
	
	try{

		String query_totalCount = "select count(*) as totalCount from mboard where code = " + p_code;
		
		if(searchType.equals("mtitle")) 
			query_totalCount += " and mtitle like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%')";
		else if(searchType.equals("mcontent"))
			query_totalCount += " and mcontent like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%')";
		else if(searchType.equals("mtitle_mcontent"))
			query_totalCount += " and mtitle like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%') or mcontent like concat('%','" + keyword + "','%')"; 
		else if(searchType.equals("mwriter"))
			query_totalCount += " and mwriter like concat('%','" + URLDecoder.decode(keyword,"UTF-8") + "','%')";
		
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con2 = ds.getConnection();
		
		stmt = con2.createStatement();
		rs = stmt.executeQuery(query_totalCount);
		
		while(rs.next()) totalCount = rs.getInt("totalCount");
	}catch(Exception e){
		e.printStackTrace();
	}
	
	Page pageList = new Page();
	
	String pageListView = pageList.getPageList(pageNum, postNum, listCount, totalCount, searchType, keyword, p_code);

	if(stmt != null) stmt.close();
	if(rs != null) rs.close();
	if(con != null) con2.close();
	
%>
	<%=pageListView %>
	</div>

	<br>
	<div style="width:600px;height:50px;">
	<div>
  		<select id="searchType" name="searchType">
      		<option value="mtitle">제목</option>
      		<option value="mcontent">내용</option>
      		<option value="mtitle_mcontent">제목+내용</option>
      		<option value="mwriter">작성자</option>
  		</select>
 
    	<input type="text" id="keyword" name="keyword" />
  		<button type="button" onclick="search()">검색</button>
  
 	</div>
<br><br>	
	<div class="bottom_menu" style="text-align: right">
		<a href="write.jsp?code=<%=item.getCode() %>">상품 문의하기</a>&nbsp;&nbsp;
		<div style="width:1050px;height:50px"></div> 
	</div>
	</div>
		</div>
	</div>
	
</div>

</div>

</body>
</html>