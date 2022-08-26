<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="addProduct_category.js"></script>
<script>

/// setPreview(e) :
/// 선택한 이미지 파일 1개를 id가 #product_image_container인 div 태그에서 출력한다
function setPreview(event) {
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#product_image_container").innerText='';
		document.querySelector("div#product_image_container").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}

function selectCategory(s) {
	resetDetail(s.value);
	changeDetail(s.value);
}

</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
<%

%>
	<div class="container">
		<form name="newProduct" action="addProduct_proc.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group-two">
				<label>상품 코드</label> <input type="text" name="code">
			</div>
			<div class="form-group-two">
				<label>상품 이름</label> <input type="text" name="name">
			</div>
			
			<div class="form-group-two">
				<label>카테고리</label>
					<select name="category" onchange="selectCategory(this.form.category)">
						<option value="0">분류를 선택하세요</option>
						<option value="채소">채소</option>
						<option value="과일·견과·쌀">과일·견과·쌀</option>
						<option value="수산·해산·건어물">수산·해산·건어물</option>
						<option value="정육·계란">정육·계란</option>
						<option value="국·반찬·메인요리">국·반찬·메인요리</option>
						<option value="샐러드·간편식">샐러드·간편식</option>
						<option value="면·양념·오일">면·양념·오일</option>
						<option value="생수·음료·우유·커피">생수·음료·우유·커피</option>
						<option value="간식·과자·떡">간식·과자·떡</option>
						<option value="건강식품">건강식품</option>
						<option value="와인">와인</option>
					</select>
					<select name="detail_category" id="detail_category" disabled>
						<option value="0">분류를 선택하세요</option>
					</select>
			</div>
			
			<div class="form-group-two">
				<label>제조사</label> <input type="text" name="company">
			</div>
			<div class="form-group-two">
				<label>가격</label> <input type="text" name="price">
			</div>
			<div class="form-group-two">
				<label>재고</label> <input type="text" name="stock">
			</div>
			<div class="form-group-two">
				<label>상세 설명</label>
				<textarea name="description" cols="60" rows="4"
					style="resize: none;"></textarea>
			</div>
			<div class="form-group-two">
				<label>상품 이미지</label>
				<input type="file" id="image" name="imageFile" accept="image/*" onchange="setPreview(event);" />
				<div id="product_image_container"></div>
			</div>
			
			<%--등록/취소 버튼 --%>
			<div class="form-group-two">
				<input type="submit" class="btn_submit" value="등록"> <input
					type="button" class="btn_cancel" value="취소"
					onclick="history.back()" />
				<div id="product_image_container"></div>
			</div>
		</form>
	</div>
</body>
</html>