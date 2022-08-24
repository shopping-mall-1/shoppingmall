<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<form name="newProduct" action="addProduct_proc.jsp" class="form-horizontal" method="post">
			<div class="form-group-two">
				<label>상품 코드</label>
				<input type="text" name="code">
			</div>
			<div class="form-group-two">
				<label>상품 이름</label>
				<input type="text" name="name">
			</div>
			<div class="form-group-two">
				<label>제조사</label>
				<input type="text" name="company">
			</div>
			<div class="form-group-two">
				<label>가격</label>
				<input type="text" name="price">
			</div>
			<div class="form-group-two">
				<label>재고</label>
				<input type="text" name="stock">
			</div>
			<div class="form-group-two">
				<label>상세 설명</label>
				<textarea name="description" cols="60" rows="4" style="resize:none;"></textarea>
			</div>
			<div class="form-group-two">
				<label>상품 이미지</label>
				<input type="text" name="image" value="이미지파일.png">
			</div>
			<div class="form-group-two">
				<input type="submit" class="btn_submit" value="등록">
			</div>
		</form>
	</div>
</body>
</html>