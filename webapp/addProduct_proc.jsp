<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.market.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.market.Product" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	/* Form에 입력한 정보를 가져옴 */
	String path = "C:\\Repository\\Image";
	int limitSize = 100*1024*1024;
	MultipartRequest multi = new MultipartRequest(request, path, limitSize, "utf-8", new DefaultFileRenamePolicy());
	
	String code = multi.getParameter("code");
	String name = multi.getParameter("name");
	String company = multi.getParameter("company");
	String sPrice = multi.getParameter("price");
	String sStock = multi.getParameter("stock");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String detail_category = multi.getParameter("detail_category");
	System.out.println("세부카테고리: "+ detail_category);
	
	/* string 값을 integer로 변환 */
	Integer price = (sPrice.isEmpty()) ?  0 : Integer.valueOf(sPrice);
	Integer stock = (sStock.isEmpty()) ?  0 : Integer.valueOf(sStock);

	/* 업로드한 파일 처리 */
	Enumeration files = multi.getFileNames();
	String originalFileName = multi.getOriginalFileName("imageFile"); //오리지널 파일명을 가져 온다.
	String storedFileName = "";
	
	if(originalFileName != null){
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		storedFileName = code + "+" + name + fileExtension;
	}
	
	//
	System.out.println(originalFileName+ ", " + storedFileName);
	
	/* 가져온 정보를 Product 객체로 복사 */
	Product item = new Product();
	item.setCode(Integer.valueOf(code));
	item.setName(name);
	item.setCompany(company);
	item.setPrice(price);
	item.setStock(stock);
	item.setDescription(description);
	item.setImage(storedFileName);
	item.setCategory(category);
	item.setDetail_category(detail_category);
	
	/* DB에 추가 */
	DBConnection con = new DBConnection();
	con.StartConnection(getServletConfig());
	con.AddProductToDB(item);
	con.CloseConnection();
	
	/* 업로드한 파일을 로컬에 저장 */
	// 변경된 이름으로 파일이 저장되지 않고 기존 이름으로 저장됨. 수정 필요.
	try{
		File imageFile = new File(path + "\\" + storedFileName);
		if(imageFile.exists()) imageFile.renameTo(new File(path + "\\" + storedFileName));
	}catch(Exception e){ e.printStackTrace(); }
	
	/* 상품 목록을 보여주는 페이지로 이동 */
	response.sendRedirect("products.jsp");
%>