package com.example.demo.ebook.model.payment;
import javax.persistence.*;
@Entity
public class Payment {
	@Id
	@GeneratedValue
	private int id;
	private int buyerid;
	private int ebookid;
	private boolean copy_type;
	private double price;
	private String payment_method;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(int buyerid) {
		this.buyerid = buyerid;
	}
	public int getEbookid() {
		return ebookid;
	}
	public void setEbookid(int ebookid) {
		this.ebookid = ebookid;
	}
	public boolean isCopy_type() {
		return copy_type;
	}
	public void setCopy_type(boolean copy_type) {
		this.copy_type = copy_type;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	
}
