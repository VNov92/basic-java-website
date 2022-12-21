package beans;

import java.io.Serializable;

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	private int role;
	private String name;
	private String address;
	private String phone;
	public User() {
		super();
	}
	public User(String email, int role, String name, String address, String phone) {
		super();
		this.email = email;
		this.role = role;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getName() {
		String[] temp = name.split(" ");
		String tempName = "";
		for(int i = 0; i<temp.length-1; i++) {
			tempName += temp[i].substring(0,1);
		}
		tempName += " " + temp[temp.length-1];
		return tempName;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
