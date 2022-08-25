package com.market;
import java.io.Serializable;

public class Product implements Serializable {
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private Integer code;		// 상품 코드
	private String name;		// 상품명
	private String company;		// 제조사
	private Integer price;		// 상품 가격
	private Integer stock;		// 재고 수
	private String description;	// 상품 설명
	private String image;		// 이미지 파일의 이름(?)
	private String category; 	//카테고리
	private String detail_category; //상세한 카테고리
	
	public Product() { super(); }

	public Product(Integer productCode, String productName, Integer productPrice, 
					String productImage, String productCategory, String product_detail_category) {
		super();
		this.code = productCode;
		this.name = productName;
		this.price = productPrice;
		this.image = productImage;
		this.category = productCategory;
		this.detail_category = product_detail_category;
	}
	
	public Product(Integer pCode, String pName, Integer pPrice, String pDescription,
					String pCompany, Integer pStock, String pImage, String pCategory, String pDetail_category) {
		super();
		this.code = pCode;
		this.name = pName;		
		this.company = pCompany;
		this.price = pPrice;
		this.stock = pStock;
		this.description = pDescription;
		this.image = pImage;
		this.category = pCategory;
		this.detail_category = pDetail_category;
	}

	/* 시리얼~을 제외한 모든 변수의 get, set 함수를 추가 */
	// [Source]-[Generate Getters and Setters...]
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDetail_category() {
		return detail_category;
	}

	public void setDetail_category(String detail_category) {
		this.detail_category = detail_category;
	}
	
}
