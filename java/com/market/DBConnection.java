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
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private DataSource ds = null;

	/**
	 * 새로운 상품을 product 테이블에 등록합니다.
	 */
	public void AddProductToDB(Product item) {
		query = "insert into product "
				+"(code, name, company, price, stock, description, image) "
				+"values (?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(   1, item.getCode());
			pstmt.setString(2, item.getName());
			pstmt.setString(3, item.getCompany());
			pstmt.setInt(   4, item.getPrice());
			pstmt.setInt(   5, item.getStock());
			pstmt.setString(6, item.getDescription());
			pstmt.setString(7, item.getImage());
			pstmt.executeUpdate();
		} catch(Exception e){ e.printStackTrace(); }
	}
	
	/**
	 * 고객이 고른 상품의 코드와 상품의 개수를 cart 테이블에 등록합니다.
	 */
	public void AddProductToCart(String customer, int p_code, int p_count) {
		query = "insert into cart "
				+ "(customer, p_code, p_count) "
				+ "values(?,?,?)";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, customer);
			pstmt.setInt(   2, p_code);
			pstmt.setInt(   3, p_count);
			pstmt.executeUpdate();
		} catch(Exception e){ e.printStackTrace(); }
	}
	
	public ArrayList<Product> GetAllProduct() {
		ArrayList<Product> list = new ArrayList<Product>();
		
		query = "select code, name, company, price, stock, description, image from product";
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
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
			
		} catch(Exception e){ e.printStackTrace(); }
	}
}
