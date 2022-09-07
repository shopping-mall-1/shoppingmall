<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 세부 카테고리 항목을 변경하는 함수를 addProduct_category.js 파일로 따로 분리하였음 -->
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
$(document).ready(function(){
	// 등록 버튼을 눌렀을 때, 빈칸을 다 입력했는지 확인합니다.
	$("#btn_submit").click(function(){
		if($("#input_code").val() == '') { $("#input_code").focus(); return false; }
		if($("#input_name").val() == '') { $("#input_name").focus(); return false; }
		if($("#category").val() == "0") { $("#category").focus(); return false; }
		if($("#detail_category").val() == "0") { $("#detail_category").focus(); return false; }
		if($("#input_company").val() == '') { $("#input_company").focus(); return false; }
		if($("#input_price").val() == '') { $("#input_price").focus(); return false; }
		if($("#input_stock").val() == '') { $("#input_stock").focus(); return false; }
		if($("#input_desc").val() == '') { $("#input_desc").focus(); return false; }
		
		if($("#image").val() == '') {
			document.querySelector("div#product_image_container").innerHTML="<b style='color:red;'>파일을 선택하세요</b>";
			return false;
		}
		
		// 빈칸을 다 입력했으면, form 전달.
		$("#newProductForm").attr("action","addProduct_proc.jsp").submit();	
	});
	
	// 상품코드의 유효성을 검증합니다.
	$("#input_code").change(function(){
		$.ajax({
			url: "addProduct_codeCheck.jsp",
			type: "post",
			datatype: "json",
			data: {"input_code": $("#input_code").val()},
			success: function(data){
				var jsonInfo = JSON.parse(data);
				console.log("jsonInfo: " + jsonInfo);
				if(jsonInfo.code_count == 1){
					$("#code_Check").html("<b style='color:red;'>해당 코드가 이미 존재합니다.</b>");
					$("#input_code").val("").focus();
				} else $("#code_Check").html("사용 가능한 코드입니다.");
			}
		})
	});
});
</script>
</head>
<body>
<%
	// 관리자 계정이 아닌 경우 첫 페이지로 돌아감.
	String role = (String)session.getAttribute("role");
	if(role.equals("admin") == false) response.sendRedirect("index.jsp");
%>
	<jsp:include page="header.jsp" />
	<div class="container">
		<form name="newProductForm" id="newProductForm"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group-two">
				<label>상품 코드</label>
				<input type="text" id="input_code" name="code" placeholder="상품코드 입력">
				<div id="code_Check"></div>
			</div>
			<div class="form-group-two">
				<label>상품 이름</label>
				<input type="text" id="input_name" name="name" placeholder="상품명 입력">
			</div>

			<div class="form-group-two">
				<label>카테고리</label>
					<select name="category" id="category" onchange="selectCategory(this.form.category)">
						<option value="0">분류 선택</option>
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
					<!-- 세부 카테고리를 동적으로 변경함 -->
					<select name="detail_category" id="detail_category" disabled>
						<option value="0">분류 선택</option>
					</select>
			</div>

			<div class="form-group-two">
				<label>제조사</label>
				<input type="text" id="input_company" name="company" placeholder="제조사 입력">
			</div>
			<div class="form-group-two">
				<label>가격</label> <input type="text" id="input_price" name="price" placeholder="가격 입력">
			</div>
			<div class="form-group-two">
				<label>재고</label> <input type="text" id="input_stock" name="stock" placeholder="재고 입력">

			</div>
			<div class="form-group-two">
				<label>상세 설명</label>
				<textarea name="description" cols="60" rows="4" id="input_desc" placeholder="설명 입력"
					style="resize: none;"></textarea>
			</div>
			<div class="form-group-two">
				<label>상품 이미지</label>
				<input type="file" id="image" name="imageFile" accept="image/*" onchange="setPreview(event);" />
				<div id="product_image_container"></div>
			</div>

			<%--등록/취소 버튼 --%>
			<div class="form-group-two">
				<input type="button" class="btn_submit" id="btn_submit" value="등록">
				<input type="button" class="btn_cancel" value="취소" onclick="history.back()" />
			</div>
		</form>
	</div>