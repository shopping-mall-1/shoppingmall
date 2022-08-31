<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/order.css">
<meta name="viewport" content="width=device-width,initial-scale=1">

<title>마켓컬리 :: 주문서</title>
</head>
	<%
		//현재 접속 중인 유저아이디
		String userid = (String)session.getAttribute("id");
		//장바구니에서 체크한 상품코드 받기
		String[] str_code = request.getParameterValues("buy");
		
		int[] code = new int[str_code.length];
		for(int i=0;i<str_code.length;i++){
				code[i] = Integer.parseInt(str_code[i]);
				System.out.println("체크된 값 : "+code[i]+" ");
		}

		%>

<body>
	<script>
 	//총 금액 구하기
 	function sumPrice(){
		this.nums = [];
	    const value = document.querySelectorAll("span.b2t2_4_1")
	    this.sum = 0;
	    
	    for(var i=0;i<value.length;i++){
	    	nums.push(value[i].innerText);
	    	console.log(value[i])
	    }
	    
	    this.nums.forEach((item)=>{
	    	this.sum+=parseInt(item);
	    })
		
	 	$('.b7t1').text(this.sum+"원 결제하기");
	   
 	}
	
	</script>
	<jsp:include page="header.jsp" />

	<div>
	<div class="grid_order_1">
		<h2 class="order_title">주문서</h2>
		<div class="order_page">
			<div class="box_1">
				<h3 class="box_1_text_1">주문 상품</h3>
			</div>
			</div>
			<% 
			
			ArrayList<Integer> codeList = new ArrayList<Integer>();
			ArrayList<Integer> countList = new ArrayList<Integer>();
			ArrayList<String> nameList = new ArrayList<String>();
			ArrayList<Integer> priceList = new ArrayList<Integer>();	
			ArrayList<String> imageList = new ArrayList<String>();	
			ArrayList<ResultSet> codes = new ArrayList<ResultSet>();
			try{
				Connection con_list = null;

				String query_list="";
								
				DataSource ds_check = (DataSource)this.getServletContext().getAttribute("dataSource");
				con_list = ds_check.getConnection();
				
				Statement stmt_list = null;
				ResultSet rs_list=null;

				//카트 테이블에서 가져오기
				for(int i=0;i<code.length;i++){

					stmt_list = con_list.createStatement();
					query_list = "SELECT a.p_code as p_code, b.code as code, a.p_count as p_count, b.name as name, b.price as price, b.image as image FROM cart AS a "+
							"INNER JOIN product AS b ON b.code="+code[i]+" AND a.p_code="+code[i]+" AND a.customer='"+userid+"'";

					rs_list = stmt_list.executeQuery(query_list);
					System.out.println(code[i]);
					System.out.println("주문 목록 쿼리 : "+query_list);
					codes.add(rs_list); //rs값을 codes 배열에 인서트...
					//stmt_list.close();
					//rs_list.close();
					query_list = "";
					stmt_list = null;
					
				}			
				
				System.out.println("codes = " + codes);
				
				int p_code=0;
				int p_count=0;
				String name ="";
				int price=0;
				String image="";
			
				int index=0;
				System.out.println("resultsetarray크기: "+codes.size());
				
				%>
			
				<%
				
				for(int i=0;i<codes.size();i++){
					codes.get(i).next();
					
					System.out.println(i + "번째 시작");
					p_code = codes.get(i).getInt("p_code");
					codeList.add(p_code);
					//System.out.print(p_code+" "+codeList.get(index));
					
					System.out.println("p_code = " + p_code);
					
					p_count = codes.get(i).getInt("p_count");
					countList.add(p_count);
					System.out.println("p_count = " + p_count);
								
					name = codes.get(i).getString("name");
					nameList.add(name);
					System.out.println("name = " + name);
					
					price = codes.get(i).getInt("price")*p_count;
					priceList.add((Integer)price);
					System.out.println("price = " + price);
					
					System.out.println("상품 "+name);
					image = codes.get(i).getString("image");
					imageList.add(image);
					System.out.println("image = " + image);
					
					System.out.println("codeList[" + i + "] = " + codeList);
					
					System.out.println(i + "번째 끝");
					
			%>
			<div class="box_2">
				<span class="b2t2_1"><img src="<%=imageList.get(i) %>"></span>
				<span class="b2t2_2">
					<span class="b2t2_2_1"><%=nameList.get(i) %></span>
					<span data-testid="content-product-name" class="b2t2_2_2">
							
					</span>
				</span>
				<span class="b2t2_3"><%=countList.get(index) %>개</span>
				<span class="b2t2_4">
					<span class="b2t2_4_1"><%=priceList.get(index) %></span>
				</span>
			</div>
			<%
			index++;
			}
				
				con_list.close();

				
				}catch(Exception e){
				e.printStackTrace();
			}
			
			String query_mem = "select name, tel, address, email from member where id='"+userid+"'";
			Connection con_mem = null;
			Statement stmt_mem = null;
		
			ResultSet rs_mem=null;
			DataSource ds_mem = (DataSource)this.getServletContext().getAttribute("dataSource");
			
			try{
				con_mem = ds_mem.getConnection();
				stmt_mem = con_mem.createStatement();
				rs_mem = stmt_mem.executeQuery(query_mem);
				
				String name="";
				String tel ="";
				String address="";
				String email="";
				
				if(rs_mem.next()){
					name = rs_mem.getString("name");
					tel = rs_mem.getString("tel");
					address = rs_mem.getString("address");
					email = rs_mem.getString("email");

			%>
			<div class="box_3">
				<h3 class="box_1_text_1">주문자 정보</h3>
			</div>
			<div class="box_4">
				<div id="kurly-orderer-info" class="b4t1">
					<div class="b4t1_1">
						<span class="b4t1_1_1">보내는 분</span>
						<div class="b4t1_1_2">
							<div class="b4t1_name"><%=name %></div>
						</div>
					</div>
					<div class="b4t1_2_1">
						<span class="b4t1_phone">휴대폰</span>
						<div class="b4t1_2_2">
							<div class="b4t1_phonenumber"><%=tel %></div>
						</div>
					</div>
					<div class="b4t1_3_1">
						<span class="b4t1_email">이메일</span>
						<div class="b4t1_emailaddress">
							<%=email%>
							<div class="b4t1_3_2">
								<p class="b4t1_3_3">이메일을 통해 주문처리과정을 보내드립니다.</p>
								<p class="b4t1_3_3">정보 변경은 마이컬리 &gt; 개인정보 수정
									메뉴에서 가능합니다.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
			
			<div class="box_5">
				<div class="box_5_1">
					<h3 class="box_1_text_1">배송 정보</h3>
				</div>
				<div class="b5t1_grid">
					<div class="b5t1">
						<span class="b5t1_1">배송지</span>
						<div class="b5t1_2">
							<span class="b5t1_2_1">기본배송지</span>
							<p class="b5t1_2_2"><%=address %></p>
						</div>
			<%			
			con_mem.close();
			stmt_mem.close();
			rs_mem.close(); }
			}catch(Exception e){
				e.printStackTrace();
			}%>
					</div>
				</div>
			</div>
			<div class="box_6">
				<div class="box_6_grid_1">
					<div class="b6t1">
						<h3 class="box_1_text_1">결제 수단</h3>
					</div>
					<div class="b6t2">
						<span class="b6t2_pay">결제수단 선택</span>
						<div class="b6t2_1">
							<div class="b6t2_2">
								<div>
									<div class="b6t2_3">
										<button type="button" class="kakao_button"
											data-testid="kakao-pay-button" color="#f6e500">
											<img class="css-1wbfblw e1ewacwr0"
												src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNTAiIGhlaWdodD0iMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSIjMDAwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik03LjUxNSAyLjhDMy4zNjUgMi44IDAgNS40NDUgMCA4LjcwN2MwIDEuOTM4IDEuMTg3IDMuNjU3IDMuMDIxIDQuNzM0LS4xOTEuNzY4LS42ODQgMi43NDItLjc1IDIuOTU3LS4wODMuMjY2LS4xMDMgMS4wNDYuNzAyLjUxMi42MzQtLjQyIDIuNDc5LTEuNyAzLjU3LTIuMzQ4LjMxOC4wMzMuNjQyLjA1MS45NzIuMDUxIDQuMTUgMCA3LjUxNS0yLjY0NCA3LjUxNS01LjkwNiAwLTMuMjYyLTMuMzY1LTUuOTA3LTcuNTE1LTUuOTA3TTIxLjA0OCA0LjExM2MxLjUxNy0xLjMxMyAzLjQ2OC0xLjUwOCA0Ljg5My0uNTg1IDEuNzA3IDEuMTA2IDIuMTY4IDIuNzU0IDIuMTY4IDQuODkyIDAgMi40LTEuMTE1IDMuOTY4LTEuNjQyIDQuNDYtLjUyNi40OTMtMS42NzMgMS4yOTItMi44OCAxLjI5MkgyMS40MnYzLjc4NGgtMi45MTFWMy4yODJoMi4xMDZzLjI2LjU0OC40MzMuODN6bTEuOTUxIDEuMTUzYy0uNjk3IDAtMS4xNTMuMTc3LTEuNTMzLjQ3N3Y2LjMwNmgxLjEzOGMuNTU4IDAgMi41NDctLjUwNyAyLjU0Ny0zLjM4MyAwLS42NzctLjA5LTEuMzg1LS4yNzgtMS45LS4zNTctLjk3Ny0xLjI0Ny0xLjUtMS44NzQtMS41ek0zMy44MTcgMy4wNDZjMi4wODUgMCAyLjk0Mi43MTggMy40NDggMS4zNTQuNDgxLjYwNC44NjIgMS40OTcuODYyIDIuOHY2LjY4aC0yLjI2di0uOTU0cy0uNDQyLjQyLTEuMzc5LjgzMWMtLjk4LjQzLTIuNjUzLjg3Ny00LjA0MS0uMTg0LTEuMzk3LTEuMDY4LTEuMi0zLjQ3MS0uODUyLTQuMTU0LjQ4LS45MzggMS4zNjMtMS45NjggMy43MTYtMS45NjhoMi4wMjl2LS45MDhjMC0uNTU0LS41ODMtMS4xMDctMS43My0xLjEwNy0xLjI4IDAtMS44MzMuMTkyLTIuODE3LjYzNWwtLjk5Ni0xLjk0M3MxLjQ5Ni0xLjA4MiA0LjAyLTEuMDgyem0xLjQ3NyA2LjI1aC0xLjQxNWMtLjU5OSAwLTEuOTYxLjIxNi0xLjk2MSAxLjQ3NyAwIDEuMjgzIDEuMDkgMS4yNiAxLjQ0OCAxLjIzIDEuMDg5LS4wOTEgMS45MzgtLjc5NCAxLjkzOC0uNzk0bC0uMDEtMS45MTN6TTQ3LjA2MSAzLjA0NmwtMi4yOTEgOC4xMTEtMi41NC04LjExLTIuODQ5LjgyczMuNSA5LjM4MyAzLjYyNCA5Ljc4M2MuMTIzLjQtLjAwNS44NTgtLjI4IDEuMzIyLS4zNzEuNjMtMS44MjYgMi4wMy0xLjgyNiAyLjAzbDEuODc4IDEuNjYzcy44NTctLjY4OCAxLjc0NS0xLjc1NWMuNzQzLS44OTIgMS42MzYtMi44MyAxLjkzOC0zLjU3Ny44NTktMi4xMTkgMy40Mi05LjQ2NiAzLjQyLTkuNDY2bC0yLjgxOS0uODJ6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo="
												alt="카카오페이">
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="box_7">
				<button class="box_7_button" type="button" width="240"
					height="56" radius="3">
					<span class="b7t1"><script>sumPrice()</script></span>
				</button>
			</div>

		</div>
	
	

	</div>
	</div>



</body>
</html>