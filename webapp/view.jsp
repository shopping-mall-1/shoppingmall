<%@page import="java.net.URLDecoder"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시물 내용 보기</title>
<style>
*{
	margin: 0 auto;
	
}
a:link { color: black; }
a:visited { color: black; }
a:hover { color: red; }
a:active { color: red; }
#hypertext { text-decoration-line: none; cursor: hand; }

.boardView {
  width:900px;
  height:auto;
  padding: 20px, 20px;
  background-color:#FFFFFF;
  border:3px solid #400080;
  border-radius: 20px;
}

.mwriter, .mtitle, .mregDate, .mcontent, .filename {
  width: 90%;
  height:25px;
  outline:none;
  color: #636e72;
  font-size:16px;
  background: none;
  border-bottom: 2px solid #400080;
  margin: 30px;
  padding: 10px 10px;
  text-align: left;
}

.textArea {
  width: 90%;
  height: 350px;
  overflow: auto;
  margin: 22px;
  padding: 10px;
  box-sizing: border-box;
  border: 2px solid #400080;
  text-align: left;
  font-size: 16px;
  resize: both;
}


.replyDiv {
  margin-top: 30px;
  margin-left: 200px;
  margin-right: 200px;
  background-color:#FFFFFF;
  border:4px solid white;
  border-radius: 20px;
}

.bottom_menu { margin-top: 20px; 
text-align: center;	

 }

.bottom_menu > a:link, .bottom_menu > a:visited {
			background-color: rgb(95, 0, 128);
			color: maroon;
			padding: 15px 25px;
			text-align: center;	
			display: inline-block;
			text-decoration : none; 
			color: white;
}
.bottom_menu > a:hover, .bottom_menu > a:active { 
	background-color: gray;
	text-decoration : none; 
}


</style>
<!-- 세션, 파리미터값 가져 오기 -->
<%
	
	String session_id = (String)session.getAttribute("id");
	String session_name = (String)session.getAttribute("name");
	if(session_id == null) response.sendRedirect("Account/login.jsp");
	request.setCharacterEncoding("utf-8");
	String seqno = request.getParameter("seqno");
	String pageNum = request.getParameter("page");
	String searchType = request.getParameter("searchType")==null?"":request.getParameter("searchType");
	String keyword = request.getParameter("keyword")==null?"":request.getParameter("keyword");
	int code = Integer.parseInt(request.getParameter("code"));
%>

<script>

function mDelete(){
	if(confirm("정말 삭제 하시겠습니까?")==true) location.href='/delete.jsp?seqno=<%=seqno %>'
}

function fileDownload(){
	
	location.href='fileDownload.jsp?code=<%=code %>&page=<%=pageNum %>&seqno=<%=seqno %>';
}

function replyRegister() { //form 데이터 전송 --> 반드시 serialize()를 해야 한다.
	
	if($("#replycontent").val() == "") {alert("댓글을 입력하세요."); $("#replycontent").focus(); return false;}
	
	var queryString = $("form[name=replyForm]").serialize();
	$.ajax({
		url : "reply.jsp?option=I",
		type : "post",
		datatype : "json",
		data : queryString,
		success : replyList,
		error : function(data) {
					alert("서버오류 문제로 댓글 등록이 실패 했습니다. 잠시 후 다시 시도해주시기 바랍니다.");
              	    return false;
		}
	}); //End of ajax
	$("#replycontent").val("");	
}

function replyList(data){
	
	var session_id = '<%= session_id %>';
	const jsonInfo = JSON.parse(data);
	console.log("jsonInfo = " + jsonInfo);
	var result = "";
	for(const i in jsonInfo){
		
		result += "<div id='replyListView'>";
		result += "<div id = '" + jsonInfo[i].replyseqno + "' style='font-size: 0.8em'>";
		result += "작성자 : " + jsonInfo[i].replywriter;
						
		if(jsonInfo[i].id == session_id) {
			result += "[<a href=" + "'javascript:replyModify(" + jsonInfo[i].replyseqno + ")' style='cursor:pointer;'>수정</a> | " ;
			result += "<a href=" + "'javascript:replyDelete(" + jsonInfo[i].replyseqno + ")' style='cursor:pointer;'>삭제</a>]" ;
		}
		
		result += "&nbsp;&nbsp;" + jsonInfo[i].replyregdate
		result += "<div style='width:90%; height: auto; border-top: 1px solid gray; overflow: auto;'>";
		result += "<pre class='" + jsonInfo[i].replyseqno + "'>" + jsonInfo[i].replycontent + "</pre></div>";
		result += "</div>";
		result += "</div><br>";
	}
	$("#replyListView").remove();
	$("#replyList").html(result);
}

function replyList_delete(data){
	
	var session_id = '<%= session_id %>';
	var jsonInfo0 = JSON.stringify(data);
	var jsonInfo = JSON.parse(jsonInfo0);
	console.log("jsonInfo = " + jsonInfo);
	var result = "";
	for(const i in jsonInfo){
		
		result += "<div id='replyListView'>";
		result += "<div id = '" + jsonInfo[i].replyseqno + "' style='font-size: 0.8em'>";
		result += "작성자 : " + jsonInfo[i].replywriter;
						
		if(jsonInfo[i].id == session_id) {
			result += "[<a href=" + "'javascript:replyModify(" + jsonInfo[i].replyseqno + ")' style='cursor:pointer;'>수정</a> | " ;
			result += "<a href=" + "'javascript:replyDelete(" + jsonInfo[i].replyseqno + ")' style='cursor:pointer;'>삭제</a>]" ;
		}
		
		result += "&nbsp;&nbsp;" + jsonInfo[i].replyregdate
		result += "<div style='width:90%; height: auto; border-top: 1px solid gray; overflow: auto;'>";
		result += "<pre class='" + jsonInfo[i].replyseqno + "'>" + jsonInfo[i].replycontent + "</pre></div>";
		result += "</div>";
		result += "</div><br>";
	}
	$("#replyListView").remove();
	$("#replyList").html(result);
}

function startupPage(){
	
	var queryString = { "seqno": "<%= seqno %>" };
	$.ajax({
		url : "reply.jsp?option=L",
		type : "post",
		datatype : "json",
		data : queryString,
		success : replyList,
		error : function(data) {
						alert("서버 오류로 댓글 불러 오기가 실패했습니다.");
              	    	return false;
				}
	}); //End od ajax
}

function replyDelete(replyseqno) { 
	if(confirm("정말로 삭제하시겠습니까?") == true) {
		var queryString =  {"list": [replyseqno, <%=seqno %>]};
		$.ajax({
			url : "reply.jsp?option=D",
			type : "post",
			data : queryString,
			dataType : "json",
			success : replyList_delete,
			error : function(data) {
						alert("서버오류 문제로 댓글 등록이 실패 했습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	            		return false;
			}
		}); //End od ajax
	}
}

function replyModify(replyseqno) {

	var replyContent = $("." + replyseqno).html();
	
	var strReplyList = "<form id='formModify' name='formModify' method='POST'>"
					+ "작성자 : <%=session_name %>&nbsp;"
					+ "<input type='button' id='btn_replyModify' value='수정'>"
					+ "<input type='button' id='btn_replyModifyCancel' value='취소'>"
					+ "<input type='hidden' name='replyseqno' value='" + replyseqno + "'>"
					+ "<input type='hidden' name='seqno' value='<%=seqno %>'>"
					+ "<input type='hidden' id='writer' name='replywriter' value='<%=session_name %>'>"
					+ "<input type='hidden' id='id' name='id' value='<%=session_id %>'><br>"
					+ "<textarea id='replycontent' name='replycontent' cols='80' rows='5' maxlength='150' placeholder='글자수:150자 이내'>" + replyContent + "</textarea><br>"
					+ "</form>";
	$('#' + replyseqno).after(strReplyList);				
	$('#' + replyseqno).remove();

	$("#btn_replyModify").on("click", function(){
		var queryString = $("form[name=formModify]").serialize();
		$.ajax({
			url : "reply.jsp?option=U",
			type : "post",
			dataType : "json",
			data : queryString,
			success : replyList_delete,
			error : function(data) {
							alert("서버오류 문제로 댓글 등록이 실패 했습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	              	    	return false;
			}
		}); //End of $.ajax
	 }); //End of $("#btn_replyModify")
	
	 $("#btn_replyModifyCancel").on("click", function(){
		 if(confirm("정말로 취소하시겠습니까?") == true  ) { $("#replyListView").remove(); startupPage(); }
	 });	 
	
}
	
function replyCancel() { 
		if(confirm("정말로 취소 하시겠습니까?") == true) { $("#replyContent").val(""); $("#replyContent").focus(); }
}
</script>
</head>
<body onload="startupPage()">

<% 	
    
	//게시판 내용 보기
	String db_id = "";
	String mwriter = "";
	String mtitle = "";
	String mregdate = "";
	String mcontent = "";
	int hitno = 0;
	String org_filename = "";
	try{

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select id,mwriter,mtitle,to_char(mregdate, 'YYYY-MM-DD HH24:MI:SS') as mregdate,mcontent,hitno,org_filename,stored_filename "
					+ "from mboard where seqno =" + seqno; 
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
	
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			db_id = rs.getString("id");
			mwriter = rs.getString("mwriter");
			mtitle = rs.getString("mtitle");
			mregdate = rs.getString("mregdate");
			mcontent = rs.getString("mcontent");
			hitno = rs.getInt("hitno");
			org_filename = rs.getString("org_filename");
		}

		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
		if(con != null) con.close();

	}catch(Exception e){
			e.printStackTrace();
	}
		
	//이전 글 보기
	int pre_seqno = 0;
	try{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select max(seqno) as seqno from mboard where seqno < " + seqno;
		if(searchType.equals("mtitle"))
			query += " and mtitle like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%')";
		else if(searchType.equals("mcontent"))
			query += " and mcontent like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%')";
		else if(searchType.equals("mtitle_mcontent"))
			query += " and (mcontent like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%') or mtitle like concat('%','" + keyword + "','%'))" ;
		else if(searchType.equals("mwriter"))
			query += " and mwriter like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%')";	
		System.out.println("[이전글 보기 쿼리] : " + query);

		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		while(rs.next()) pre_seqno = rs.getInt("seqno"); //이전글 
		
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
		if(con != null) con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}	

	//다음글 보기
	int next_seqno = 0;
	try{

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select min(seqno) as seqno from mboard where seqno > " + seqno;
		if(searchType.equals("mtitle"))
			query += " and mtitle like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%')";
		else if(searchType.equals("mcontent"))
			query += " and mcontent like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%')";
		else if(searchType.equals("mtitle_mcontent"))
			query += " and (mcontent like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%') or mtitle like concat('%','" + keyword + "','%'))" ;
		else if(searchType.equals("mwriter"))
			query += " and mwriter like concat('%','" + URLDecoder.decode(keyword, "UTF-8") + "','%')";	
				
		System.out.println("[다음글 보기 쿼리] : " + query);

		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
				
		while(rs.next()) next_seqno = rs.getInt("seqno"); 
		
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
		if(con != null) con.close();
		
	}catch(Exception e){
			e.printStackTrace();
	}

	//조회수 증가
	if(!session_id.equals(db_id)) {
		hitno++;
		String query = "update mboard set hitno = " + hitno + " where seqno=" + seqno;
		System.out.println("[조회수 증가 쿼리] : " + query);

		try{
			Connection con = null;
			Statement stmt = null;
			
			DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
			con = ds.getConnection();
			
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			
		}catch(Exception e){ e.printStackTrace(); }
	}	
%>

<div class="main" align="center">
	<div style="width:1050px;height:100px"></div>
	<h1>상품 문의하기</h1>
	<br>
	<div class="boardView">
		<div class="mwriter">이름 : <%=mwriter %></div>
		<div class="mtitle">제목 : <%=mtitle %></div>
		<div class="mregDate">날짜 : <%=mregdate %></div>
		<div class="textArea"><pre><%=mcontent %></pre></div>
		
		<% if(!org_filename.equals("null")){ %>
			<div class="filename">파일명 : <a href="javascript:fileDownload()"><%=org_filename %></a></div>
		<% } else {%>
			<div class="filename">업로드된 파일이 없습니다.</div>
		<% } %>	
	</div>

	<div class="bottom_menu">
		<% if(pre_seqno !=0){ %>
				&nbsp;&nbsp;<a href="view.jsp?code=<%=code %>&seqno=<%=pre_seqno %>&page=<%=pageNum %>&searchType=<%=searchType %>&keyword=<%=keyword %> onMouseover="this.style.textDecoration='underline';" 
					onmouseout="this.style.textDecoration='none';">이전글 ▼</a> &nbsp;&nbsp;
		<% } %>		
			<a href="productdetail.jsp?code=<%=code %>&page=<%=pageNum %>&searchType=<%=searchType %>&keyword=<%=keyword %>" onMouseover="this.style.textDecoration='underline';" 
					onmouseout="this.style.textDecoration='none';">목록보기</a> &nbsp;&nbsp;

		<% if(next_seqno !=0){ %>
			<a href="view.jsp?code=<%=code %>&seqno=<%=next_seqno %>&page=<%=pageNum %>&searchType=<%=searchType %>&keyword=<%=keyword %>" onMouseover="this.style.textDecoration='underline';" 
						onmouseout="this.style.textDecoration='none';">다음글 ▲</a> &nbsp;&nbsp;
		<% } %>	
			<a href="write.jsp?code=<%=code %>" onMouseover="this.style.textDecoration='underline';" 
					onmouseout="this.style.textDecoration='none';">글 작성</a> &nbsp;&nbsp;
		<% if(session_id.equals(db_id)) {%>
			<a href="modify.jsp?code=<%=code %>&seqno=<%=seqno %>&page=<%=pageNum %>&searchType=<%=searchType %>&keyword=<%=keyword %>" onMouseover="this.style.textDecoration='underline';" 
					onmouseout="this.style.textDecoration='none';">글 수정</a> &nbsp;&nbsp;
			<a href="delete.jsp?code=<%=code %>&seqno=<%=seqno %>&page=<%=pageNum %>" onMouseover="this.style.textDecoration='underline';" 
						onmouseout="this.style.textDecoration='none';">글 삭제</a> &nbsp;&nbsp;
		<%} %>				
	</div>
	
	<div class="replyDiv" style="text-align:center;">

		<p id="replyNotice">댓글을 작성해 주세요</p>
		<form id="replyForm" name="replyForm" method="POST"> 
			작성자 : <input type="text" id="replywriter" name="replywriter" value=<%=session_name %> disabled><br>
	    	<textarea id='replycontent' name='replycontent' cols='80' rows='5' maxlength='150' placeholder='글자수:150자 이내'></textarea><br>
	    	<input type="hidden" name="seqno" value="<%=seqno %>">
	    	<input type="hidden" name="replywriter" value="<%=session_name %>">
	    	<input type="hidden" name="id" value="<%=session_id %>">
		</form>
		<input type="button" id="btn_mreply" value="댓글등록" onclick="replyRegister()">
		<hr>
		
		<div id="replyList" style="width:60%; height:600px; overflow:auto;">
			<div id="replyListView"></div> 
		</div><!-- replyList End  -->		
	</div>
</body>
</html>