package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class TestDAO {

	public List<Product> getListProduct (){
		List<Product> listProducts = new ArrayList<>();
		String sql ="select * from products";
		try {
			Connection conn = DBContext.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Product p = new Product();
				p.setBrand(rs.getString("product_brand"));
				p.setDes(rs.getNString("product_description"));
				
				listProducts.add(p);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listProducts;
		
	}

}
