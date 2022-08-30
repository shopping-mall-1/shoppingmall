<%@page import="java.io.File"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<%
	int code = Integer.parseInt(request.getParameter("code"));
	//파일 업로드 처리 부분
	String path = "c:\\Repository\\file";
	int uploadsize = 500*1024*1024;
	MultipartRequest multi = new MultipartRequest(request, path, uploadsize, "utf-8", new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");
	String mwriter = multi.getParameter("mwriter");
	String mtitle = multi.getParameter("mtitle");
	String mcontent = multi.getParameter("mcontent");
	String mregdate = LocalDateTime.now().toString();
	int filesize = 0;
	
	Enumeration files = multi.getFileNames();
	String name = (String)files.nextElement();
	
	String originalFileName = multi.getOriginalFileName(name); 
	String storedFileName = "";
	
	if(originalFileName != null){
		//변경되기 전 파일 이름에서 확장자 분리
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));	
		//난수값을 발생시켜 파일명 생성
		storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;	
	}
	
	//cos에서 변경 시킨 파일명
	String changedFileName = multi.getFilesystemName(name);
			
	//String url = "jdbc:mariadb://127.0.0.1:3306/jspdev";
	//String user = "webmaster";
	//String pwd = "@Ajendbh7!";

	Connection con = null;
	Statement stmt = null;

	try{
		
		//Class.forName("org.mariadb.jdbc.Driver");
		//con = DriverManager.getConnection(url, user, pwd);
		DataSource ds = (DataSource) this.getServletContext().getAttribute("dataSource");
	  	con = ds.getConnection();
		
		// insert into tbl_m1board (userid,mwriter,mtitle,mcontent,filename,filesize, mregdate) 
		// values (?,?,?,?,?,?,?)
	
		String query = "insert into mboard "
	             + "(id,mwriter,mtitle,mcontent,org_filename,stored_filename,filesize, mregdate,code) "
				 + "values ('" + id + "','" + mwriter 
				 + "','" + mtitle + "','" + mcontent + "','"
				 + originalFileName + "','" + storedFileName + "'," + filesize + ",'" + mregdate + "'," +code + ")";
		
		//System.out.println(query);
	
		stmt = con.createStatement();
		stmt.executeUpdate(query);
		
		stmt.close();
		con.close();
		
		//업로드된 파일명을 난수명으로 변경
		File file = new File(path + "\\" + changedFileName);
		if(file.exists()) file.renameTo(new File(path + "\\" + storedFileName));
			
		response.sendRedirect("productdetail.jsp?code=" + code +"&page=1");

	}catch(Exception e){
		e.printStackTrace();
		stmt.close();
		con.close();
	}

%>


</body>
</html>