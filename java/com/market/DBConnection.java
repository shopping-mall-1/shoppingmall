package com.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.sql.DataSource;

/**
 * DB 접근을 위해 StartConnection함수를 먼저 실행하고, CloseConnection함수로 종료할 것.		<br>
 * (1) DBConnection con = new DBConnection();		<br>
 * (1) con.StartConnection(getServletConfig());		<br>
 * (3) con.AddProduct(item);		<br>
 * (4) con.CloseConnection();
 */
public class DBConnection {

	private String query = null;
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	private DataSource ds = null;

	/**
	 * 새로운 상품을 product 테이블에 등록합니다.
	 */
	public void AddProductToDB(Product item) {
		query = "insert into product "
				+"(code, name, company, price, stock, description, image, category, detail_category) "
				+"values (" + item.getCode() + ", '" + item.getName() + "','" + item.getCompany() + "',"
				+ item.getPrice() + "," + item.getStock() + ",'" + item.getDescription() + "','"
				+ item.getImage() + "','" + item.getCategory() + "','" + item.getDetail_category() + "')";
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(query);
		} catch(Exception e){ e.printStackTrace(); }
	}
	
	/**
	 * 고객이 고른 상품의 코드와 상품의 개수를 cart 테이블에 등록합니다.
	 */
	public void AddProductToCart(String customer, int p_code, int p_count) {
		query = "insert into cart "
				+ "(customer, p_code, p_count) "
				+ "values('" + customer + "'," + p_code + "," + p_count + ")";
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(query);
		} catch(Exception e){ e.printStackTrace(); }
	}
	
	public ArrayList<Product> GetAllProduct() {
		ArrayList<Product> list = new ArrayList<Product>();
		
		query = "select code, name, company, price, stock, description, image, category, detail_category from product";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				Product item = new Product();
				item.setCode(rs.getInt("code"));
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setDescription(rs.getString("description"));
				item.setCompany(rs.getString("company"));
				item.setStock(rs.getInt("stock"));
				item.setImage(rs.getString("image"));
				item.setCategory(rs.getString("category"));
				item.setDetail_category(rs.getString("detail_category"));
				
				list.add(item);
			}
		} catch(Exception e){ e.printStackTrace(); }
		return list;
	}
	
	public void StartConnection(ServletConfig sc) {
		try{
			ds  = (DataSource)sc.getServletContext().getAttribute("dataSource");
			con = ds.getConnection();
			
		} catch(Exception e){ e.printStackTrace(); }
	}
	
	public void CloseConnection() {
		try {
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
			
		} catch(Exception e){ e.printStackTrace(); }
	}

	public Product getproduct(int code) {

		Product item = new Product();
		query = "select code, name, company, price, stock, description, image, category, detail_category from product where code=" + code;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
				
			rs.next();
			item.setCode(rs.getInt("code"));
			item.setName(rs.getString("name"));
			item.setPrice(rs.getInt("price"));
			item.setDescription(rs.getString("description"));
			item.setCompany(rs.getString("company"));
			item.setStock(rs.getInt("stock"));
			item.setImage(rs.getString("image"));
			item.setCategory(rs.getString("category"));
			item.setDetail_category(rs.getString("detail_category"));
		} catch(Exception e){ e.printStackTrace(); }
		return item;
	}	
}
