<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ø� :: �ֹ�����</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/orderlist.css">
</head>
<body>
<jsp:include page='header.jsp'/>
<script>
$(document).ready(function(){
	//order���̺� �������� ������ �ֹ����� �����ϴ�&&��� div ���ֱ�. ������ ��� ���
	if($('#checkOrder').val()=='0'){
		$('#no_order').css('display','block');
		$('#orderlist_exist').css('display','none');
	}
	else{
		$('#orderlist_exist').css('display','block');
		$('#no_order').css('display','none');
	}
		

})
</script>
<%
	String userid =(String)session.getAttribute("id");
	Connection con_check = null;
	DataSource ds_check = (DataSource)this.getServletContext().getAttribute("dataSource");
	con_check = ds_check.getConnection();
	
	Statement stmt_check = null;
	ResultSet rs_check = null;
	
	String query_check = "select count(order_code) from tbl_order where customer = '"+userid+"'";
	
	
	stmt_check = con_check.createStatement();
	rs_check = stmt_check.executeQuery(query_check);
	int orderCount = 0;
	
	if(rs_check.next()){
		orderCount = rs_check.getInt(1);
	}
	System.out.println(userid+" �ֹ����� cnt : "+orderCount+"��");

	con_check.close();
	stmt_check.close();

%>
<div id="container">
	<center>�ֹ�����</center>
	<input id="checkOrder" type="hidden" value="<%=orderCount%>">
	<div id="no_order"><center id="no_order" style=" align-items: center; margin-top:50px;">�ֹ������� �����ϴ�.</center></div>
	
	<div id="orderlist_exist">
			<div class="box_2">
			<input id ="code" type="hidden" value="">
			<span style="width:100px;">�ֹ���ȣ</span>
			<span style="width:100px;">����</span>
			
			<span style="width:400px;">�̸�</span>
			<span style="width:100px;">����</span>
			
			<span style="width:100px;">�����ݾ�</span>
			
			<span style="width:100px;">�ֹ���¥</span>
			<span style="width:100px;">�ֹ�����</span>
			</div>
	<%
		//�ֹ����� ��������
		Connection con_order = null;
		DataSource ds_order = (DataSource)this.getServletContext().getAttribute("dataSource");
		con_order = ds_order.getConnection();
		
		Statement stmt_order = null;
		ResultSet rs_order = null;
		
		String query_order = "SELECT a.order_code AS code, a.p_count AS p_count, a.state as state, a.order_date AS order_date,"+
				"b.image as image, b.name as p_name, b.price as price  FROM tbl_order as a INNER JOIN   product as b "+
				"ON a.customer = '"+userid+"' AND a.p_code = b.code ORDER BY order_date DESC;";
		
		
		stmt_order = con_order.createStatement();
		rs_order = stmt_order.executeQuery(query_order);
		
		int order_code = 0;
		int p_count = 0;
		String order_date = "";
		String image = "";
		String name = "";
		int price = 0;
		String state = "";
		
		while(rs_order.next()){
			order_code = rs_order.getInt("code");
			p_count = rs_order.getInt("p_count");
			order_date = rs_order.getString("order_date");
			image = rs_order.getString("image");
			name = rs_order.getString("name");
			price = rs_order.getInt("price");
			state = rs_order.getString("state");
	%>
			<div class="box_2">
				<input id ="code" type="hidden" value="">
				<span style="width:100px;"><%=order_code %></span>
				<span style="width:100px;"><img src="<%=image %>" style="width: 60px; height: 78px;"></span>
				
				<span style="width:400px;"><%=name %></span>
				<span style="width:100px;"><%=p_count %></span>
				
				<span style="width:100px;"><%=price*p_count %></span>
			
				<span style="width:100px;"><%=order_date %></span>
				<span style="width:100px;"><%=state %></span>
			</div>
			<%}
			con_order.close();
			stmt_order.close();
			rs_order.close();
		%>
	</div>
</div>
</body>
</html>