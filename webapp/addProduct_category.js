/**
 * addProduct.jsp에서 사용하는 카테고리 선택창 내용 변경 JS 함수. 길어서 분리함.
 */
/// resetDetail(select)
/// 소분류 선택창을 리셋한다.
function resetDetail(s) {
	var detail = document.getElementById("detail_category");
	
	while(detail.hasChildNodes()) 
		detail.removeChild(detail.firstChild);
	$("#detail_category").append("<option value='0'>소분류를 선택하세요</option>");
	
	if(s == "0") detail.disabled = true;
	else		 detail.disabled = false;
}

// changeDetail(category)
/// 선택된 대분류에 따라 소분류 선택지를 변경한다
function changeDetail(s) {
	
	switch(s){
	case "채소":
		$("#detail_category").append("<option value='친환경'>친환경</option>");
		$("#detail_category").append("<option value='고구마·감자·당근'>고구마·감자·당근</option>");
		$("#detail_category").append("<option value='시금치·쌈채소·나물'>시금치·쌈채소·나물</option>");
		$("#detail_category").append("<option value='브로콜리·파프리카·양배추'>브로콜리·파프리카·양배추</option>");
		break;
		
	case "과일·견과·쌀":
		$("#detail_category").append("<option value='친환경'>친환경</option>");
		$("#detail_category").append("<option value='제철과일'>제철과일</option>");
		$("#detail_category").append("<option value='국산과일'>국산과일</option>");
		$("#detail_category").append("<option value='수입과일'>수입과일</option>");
		$("#detail_category").append("<option value='견과류'>견과류</option>");
		$("#detail_category").append("<option value='쌀'>쌀</option>");
		break;
		
	case "수산·해산·건어물":
		$("#detail_category").append("<option value='제철수산'>제철수산</option>");
		$("#detail_category").append("<option value='생선류'>생선류</option>");
		$("#detail_category").append("<option value='굴비·반건류'>굴비·반건류</option>");
		$("#detail_category").append("<option value='오징어·낙지·문어'>오징어·낙지·문어</option>");
		$("#detail_category").append("<option value='새우·게·랍스터'>새우·게·랍스터</option>");
		$("#detail_category").append("<option value='해산물·조개류'>해산물·조개류</option>");
		$("#detail_category").append("<option value='수산가공품'>수산가공품</option>");
		$("#detail_category").append("<option value='김·미역·해조류'>김·미역·해조류</option>");
		break;
		
	case "정육·계란":
		$("#detail_category").append("<option value='국내산 소고기'>국내산 소고기</option>");
		$("#detail_category").append("<option value='수입산 소고기'>수입산 소고기</option>");
		$("#detail_category").append("<option value='돼지고기'>돼지고기</option>");
		$("#detail_category").append("<option value='계란류'>계란류</option>");
		$("#detail_category").append("<option value='닭·오리고기'>닭·오리고기</option>");
		break;
		
	case "국·반찬·메인요리":
		$("#detail_category").append("<option value='국·탕·찌개'>국·탕·찌개</option>");
		$("#detail_category").append("<option value='밀키트·메인요리'>밀키트·메인요리</option>");
		$("#detail_category").append("<option value='밑반찬'>밑반찬</option>");
		$("#detail_category").append("<option value='김치·젓갈·장류'>김치·젓갈·장류</option>");
		$("#detail_category").append("<option value='베이컨·햄·통조림'>베이컨·햄·통조림</option>");
		break;
		
	case "샐러드·간편식":
		$("#detail_category").append("<option value='샐러드·닭가슴살'>샐러드·닭가슴살</option>");
		$("#detail_category").append("<option value='도시락·밥류'>도시락·밥류</option>");
		$("#detail_category").append("<option value='파스타·면류'>파스타·면류</option>");
		$("#detail_category").append("<option value='떡볶이·튀김·순대'>떡볶이·튀김·순대</option>");
		$("#detail_category").append("<option value='피자·핫도그·만두'>피자·핫도그·만두</option>");
		$("#detail_category").append("<option value='죽·스프·카레'>죽·스프·카레</option>");
		$("#detail_category").append("<option value='선식·시리얼'>선식·시리얼</option>");
		break;
		
	case "면·양념·오일":
		$("#detail_category").append("<option value='파스타·면류'>파스타·면류</option>");
		$("#detail_category").append("<option value='식초·소스·드레싱'>식초·소스·드레싱</option>");
		$("#detail_category").append("<option value='식용유·참기름·오일'>식용유·참기름·오일</option>");
		break;
		
	case "생수·음료·우유·커피":
		$("#detail_category").append("<option value='생수·탄산수'>생수·탄산수</option>");
		$("#detail_category").append("<option value='음료·주스'>음료·주스</option>");
		$("#detail_category").append("<option value='우유·두유·요거트'>우유·두유·요거트</option>");
		$("#detail_category").append("<option value='커피'>커피</option>");
		$("#detail_category").append("<option value='차'>차</option>");
		break;
		
	case "간식·과자·떡":
		$("#detail_category").append("<option value='과자·스낵·쿠키'>과자·스낵·쿠키</option>");
		$("#detail_category").append("<option value='초콜릿·캔디·젤리'>초콜릿·캔디·젤리</option>");
		$("#detail_category").append("<option value='떡·한과'>떡·한과</option>");
		$("#detail_category").append("<option value='아이스크림'>아이스크림</option>");
		break;
		
	case "건강식품":
		$("#detail_category").append("<option value='영양제'>영양제</option>");
		$("#detail_category").append("<option value='유산균'>유산균</option>");
		$("#detail_category").append("<option value='홍삼·인삼·꿀'>홍삼·인삼·꿀</option>");
		$("#detail_category").append("<option value='건강즙·건강음료'>건강즙·건강음료</option>");
		$("#detail_category").append("<option value='건강분말'>건강분말</option>");
		$("#detail_category").append("<option value='다이어트'>다이어트</option>");
		break;
		
	case "와인":
		$("#detail_category").append("<option value='레드와인'>레드와인</option>");
		$("#detail_category").append("<option value='화이트와인'>화이트와인</option>");
		$("#detail_category").append("<option value='샴페인·스파클링'>샴페인·스파클링</option>");
		break;
		
	default: break;
	}
}