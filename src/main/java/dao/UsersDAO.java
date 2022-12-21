package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.User;
import context.DBContext;

public class UsersDAO {

	public UsersDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean isExistsEmail(String email) {
		try {
			Connection conn = DBContext.getConnection();

			PreparedStatement ps = conn.prepareStatement("select 1 from account where user_mail = ?");

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			if (rs.next())
				return true;

			conn.close();

		} catch (SQLException | ClassNotFoundException s) {
			s.printStackTrace();
		}

		return false;
	}

	public User getUser(String email, String password) {
		User user = null;

		try {
			Connection conn = DBContext.getConnection();

			PreparedStatement ps = conn.prepareStatement("select * from account where user_mail = ? and password = ?");

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new User(
						rs.getString(1),
						rs.getInt(3),
						rs.getNString(4),
						rs.getNString(5),
						rs.getString(6) );				
			}

			rs.close();
			conn.close();

		} catch (SQLException | ClassNotFoundException s) {
			s.printStackTrace();
		}

		return user;
	}

	public void insertUser(String email, String password, int role, String name, String address, String phone) {
		try {
			Connection conn = DBContext.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into account"
					+ " values(?, ?, ?, ?, ?, ?)");
			
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setInt(3, role);
			ps.setNString(4, name);
			ps.setNString(5, address);
			ps.setString(6, phone);
			
			if(ps.executeUpdate() != 1)
				throw new SQLException();		
			
			ps.close();
			conn.close();		
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<User> getUsers(String type, String value){
		List<User> listUser = new ArrayList<>();
		try {
			Connection conn = DBContext.getConnection();
			
			if (type.equals("role")) {
				PreparedStatement ps = conn.prepareStatement("select user_mail, account_role, user_name, user_address, user_phone from account where account_role = ?");
				
				ps.setInt(1, Integer.parseInt(value));
				
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) {
					User user = new User(rs.getString(1), rs.getInt(2), rs.getNString(3), rs.getNString(4), rs.getString(5));
					listUser.add(user);
				}
				
			}
			
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return listUser;
		
	}

}
























