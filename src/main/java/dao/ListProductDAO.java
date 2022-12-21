package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDAO {
	// danh sách sản phẩm truy vấn theo brand
	public List<Product> listProduct(String brand, int offset, int limit) {
		List<Product> listProduct = new ArrayList<>();
		try {		
			Connection conn = DBContext.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("select * from products where product_brand = ? limit ?,?");
			
			ps.setString(1, brand);
			ps.setInt(2, offset);
			ps.setInt(3, limit);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getNString(2));
				p.setDes(rs.getNString(3));
				p.setPrice(rs.getDouble(4));
				p.setSrc(rs.getString(5));
				p.setType(rs.getString(6));
				p.setBrand(rs.getString(7));
				listProduct.add(p);
			}
			
			rs.close();
			conn.close();
		}catch (ClassNotFoundException f) {
			f.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listProduct;
	}
	
	public List<Product> listProduct(int offset, int limit) {
		List<Product> listProduct = new ArrayList<>();
		try {		
			Connection conn = DBContext.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("select * from products limit ?,?");
			
			ps.setInt(1, offset);
			ps.setInt(2, limit);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getNString(2));
				p.setDes(rs.getNString(3));
				p.setPrice(rs.getDouble(4));
				p.setSrc(rs.getString(5));
				p.setType(rs.getString(6));
				p.setBrand(rs.getString(7));
				listProduct.add(p);
			}
			
			rs.close();
			conn.close();
		}catch (ClassNotFoundException f) {
			f.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listProduct;
	}
	
	// chi tiết 1 sản phẩm
	public Product getProduct(int id) {
		Product p = new Product();
		try {
			Connection conn = DBContext.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("select * from products where product_id=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				p.setId(rs.getInt(1));
				p.setName(rs.getNString(2));
				p.setDes(rs.getNString(3));
				p.setPrice(rs.getDouble(4));
				p.setSrc(rs.getString(5));
				p.setType(rs.getString(6));
				p.setBrand(rs.getString(7));
			}
			
			rs.close();
			conn.close();
		}catch (ClassNotFoundException f) {
			f.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return p;
		
	}
	
	// danh sách sản phẩm truy vấn theo từ khoá
	public List<Product> search(String s, String type, int offset, int limit) {
		List<Product> listProduct = new ArrayList<>();
		try {		
			Connection conn = DBContext.getConnection();
			
			PreparedStatement ps = null;
			
			if (type.equals("name")) {
				ps = conn.prepareStatement("select * from products where product_name REGEXP ? limit ?,?");
			
				ps.setString(1, s+"+");
				ps.setInt(2, offset);
				ps.setInt(3, limit);
			}
			
			if (type.equals("masp")) {
				ps = conn.prepareStatement("select * from products where product_id = ?");
				
				ps.setString(1, s);
			}
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getNString(2));
				p.setDes(rs.getNString(3));
				p.setPrice(rs.getDouble(4));
				p.setSrc(rs.getString(5));
				p.setType(rs.getString(6));
				p.setBrand(rs.getString(7));
				listProduct.add(p);
			}
			
			rs.close();
			conn.close();
		}catch (ClassNotFoundException f) {
			f.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listProduct;
	}
	
	// đếm số sản phẩm tìm thấy
	public int search(String s, String type) {
		int count = 0;
		try {		
			Connection conn = DBContext.getConnection();
			
			PreparedStatement ps = null;
			
			if (type.equals("name")) {
				ps = conn.prepareStatement("select count(*) as count from products where product_name REGEXP ?");
				ps.setString(1, s+"+");	
			}
			if(type.equals("brand")) {
				ps = conn.prepareStatement("select count(*) as count from products where product_brand = ?");
				ps.setString(1, s);
			}
			if(type.equals("masp")) {
				ps = conn.prepareStatement("select count(*) as count from products where product_id = ?");
				ps.setString(1, s);
			}
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close();
			conn.close();
		}catch (ClassNotFoundException f) {
			f.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int search() {
		int count = 0;
		try {		
			Connection conn = DBContext.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("select count(*) as count from products");
						
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close();
			conn.close();
		}catch (ClassNotFoundException f) {
			f.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
}










