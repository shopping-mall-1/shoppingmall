<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시물 수정</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%
int code = Integer.parseInt(request.getParameter("code"));
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	if(id == null) response.sendRedirect("login.jsp");
	
	int seqno = Integer.parseInt(request.getParameter("seqno"));
	String pageNum = request.getParameter("page");
	String searchType = request.getParameter("searchType")==null?"":request.getParameter("searchType");
	String keyword = request.getParameter("keyword")==null?"":request.getParameter("keyword");

%>

<script>

function registerForm(){

	if($("#mwriter").val()=='') { alert("이름을 입력하세요!!!"); $("#mwriter").focus(); return false;  }
	if($("#mtitle").val()=='') { alert("제목을 입력하세요!!!");  $("#mtitle").focus(); return false;  }
	if($("#mcontent").val()=='') { alert("내용을 입력하세요!!!");  $("#mcontent").focus(); return false;  }
	
	$("#WriteForm").attr("action", "modify_proc.jsp?code=<%= code%>&seqno<%= seqno%>&page<%= pageNum%>&searchType<%= searchType%>&keyword<%= keyword%>").submit();
	
}

</script>

<style>
a:link { color: black; }
a:visited { color: black; }
a:hover { color: red; }
a:active { color: red; }
#hypertext { text-decoration-line: none; cursor: hand; }

.WriteForm {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  text-align: center;
  border:3px solid #400080;
  border-radius: 30px;
}

#mwriter, #mtitle {
  width: 90%;
  border:none;
  border-bottom: 2px solid #400080;
  margin: 20px;
  padding: 10px 10px;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

#mcontent{
  width: 850px;
  height: 300px;
  padding: 10px;
  box-sizing: border-box;
  border: 2px solid #400080;
  font-size: 16px;
  resize: both;
}

.btn_write  {
  position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: rgb(95, 0, 128);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn_cancel{
  position:relative;
  left:20%;
  transform: translateX(-50%);
  margin-top: 20px;
  margin-bottom: 10px;
  width:40%;
  height:40px;
  background: gray;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

</style>

</head>   
<body>

<%

 	//String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	//String uid = "webmaster";
	//String pwd = "12345";
	String query = "select mwriter,mtitle,mcontent from mboard where seqno=" + seqno; 
	System.out.println("[수정 보기 쿼리] : " + query);
	
	Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String mwriter = "";
    String mtitle = "";
    String mcontent = "";
        
	try{
		
		//Class.forName("org.mariadb.jdbc.Driver");
		//con = DriverManager.getConnection(url, uid, pwd);

		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()){ 
			
			mwriter = rs.getString("mwriter");
			mtitle = rs.getString("mtitle");
			mcontent = rs.getString("mcontent");
		}
		
	}catch(Exception e)	 {
		e.printStackTrace();
	}
	
	stmt.close();
	rs.close();
	con.close();
	
	

%>

<div align="center">
<div style="width:1050px;height:100px"></div>
	<h1>상품 문의 수정</h1>
	<br>
	
	<form id="WriteForm" class="WriteForm" method="POST">
		<input type="text" id="mwriter" value="작성자 : <%=mwriter %> 님" disabled>
		<input type="hidden" name="seqno" value="<%=seqno %>">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="searchType" value="<%=searchType%>">
		<input type="hidden" name="keyword" value="<%=keyword%>">
		<input type="hidden" name="page" value="<%=pageNum%>">		
		<input type="text" id="mtitle" name="mtitle" value="<%=mtitle %>">
		<textarea id="mcontent" cols="100" rows="500" name="mcontent"><%=mcontent %></textarea>
		<br>
		<input type="button" class="btn_write" value="수정" onclick="registerForm()" />
		<input type="button" class="btn_cancel" value="취소" onclick="history.back()" />
	</form>
</div>
</body>
</html>