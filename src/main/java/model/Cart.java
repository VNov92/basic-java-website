package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Product> items; // danh sách sản phẩm trong giỏ hàng
	private int orderID;
	
	public Cart() {
		items = new ArrayList<>();
	}
	
	// thêm sản phẩm mới vào giỏ hàng
	public void add(Product ci) {
		for (Product x: items) {
			if (ci.getId() == x.getId()) {
				x.setNumber(x.getNumber() + 1);
				return;
			}
		}
		
		items.add(ci);
	}
	
	// xoá sản phẩm khỏi giỏ hàng
	public void remove(int id) {
		for (Product x: items) {
			if (x.getId() == id) {
				items.remove(x);
				return;
			}
		}
	}
	
	//  thành tiền
	public double getAmount() {
		double s = 0;
		for (Product x: items) {
			s += x.getPrice() * x.getNumber();
		}
		return Math.round(s * 100.0) / 100.0;
	}
	
	// danh sách sản phẩm trong giỏ hàng
	public List<Product> getItems() {
		return items;
	}	
	
	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public boolean isEmpty() {
		return items.isEmpty();
	}

}
