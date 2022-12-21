package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;

public class OrdersDAO {
	public OrdersDAO() {}
	
	public void saveOrder(Orders o, Cart c) throws Exception {
		try {
			Connection conn = DBContext.getConnection();
			
			// thêm order vào csdl, lấy order_id để thêm vào từng sản phẩm của order
			String orderQuery = "insert into orders (user_mail, order_status, order_address, order_phone)"
					+ "values (?, ?, ?, ?)";
			
			// thêm tất cả sản phẩm trong cart vào csdl
			String productOrderQuery = "insert into orders_detail "
					+ "values (?, ?, ?, ?)";			
			
			PreparedStatement ps = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);
			
			ps.setNString(1, o.getCustomerMail());
			ps.setInt(2, o.getStatus());
			ps.setNString(3, o.getAddress());
			ps.setString(4, o.getPhoneNumber());
			
			if(ps.executeUpdate() > 0) {
				int orderID = -1;
				
				ResultSet rs = ps.getGeneratedKeys();
				
				if(rs.next()) {
					orderID = rs.getInt(1);
					c.setOrderID(orderID);
				}
				else {
					throw new SQLException("Failed to get order id.");
				}
				
				
				PreparedStatement pss = conn.prepareStatement(productOrderQuery);
				
				for(Product x: c.getItems()) {
					
					pss.setInt(1, orderID);
					pss.setInt(2, x.getId());
					pss.setInt(3, x.getNumber());
					pss.setDouble(4, x.getPrice());
					
					pss.executeUpdate();		
				}
				
			}else {
				throw new SQLException("Creating order failed.");
			}
			
			conn.close();
		} catch (ClassNotFoundException f) {
			f.printStackTrace();
		} catch (SQLException s) {
			s.printStackTrace();
		}
	}
}











