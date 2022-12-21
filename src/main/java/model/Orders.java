package model;

import java.util.Date;
import java.util.List;

public class Orders {
	private int orderId;
	private double price; // thành tiền
	private int status;
	private Date orderDate;
	private String address;
	private String phoneNumber;
	private List<ProductOrders> lp;
	private String customerMail;
	private Date receivedDate;
	private String discount;
	public Orders() {
		super();
	}
	public Orders(int orderId, double price, int status, Date orderDate, String address, String phoneNumber,
			List<ProductOrders> lp, String customerMail) {
		super();
		this.orderId = orderId;
		this.price = price;
		this.status = status;
		this.orderDate = orderDate;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.lp = lp;
		this.customerMail = customerMail;
	}
	public Orders(int status, String address, String phoneNumber, String customerMail) {
		super();
		this.status = status;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.customerMail = customerMail;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public List<ProductOrders> getLp() {
		return lp;
	}
	public void setLp(List<ProductOrders> lp) {
		this.lp = lp;
	}
	public String getCustomerMail() {
		return customerMail;
	}
	public void setCustomerMail(String customerMail) {
		this.customerMail = customerMail;
	}
	public Date getReceivedDate() {
		return receivedDate;
	}
	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
}
