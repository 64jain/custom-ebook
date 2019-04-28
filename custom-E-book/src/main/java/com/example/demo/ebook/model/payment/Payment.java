package com.example.demo.ebook.model.payment;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.example.demo.ebook.model.buyer.Buyer;
@Entity
public class Payment {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String email;
	private String buyer_addr;
	@ManyToOne
	private Buyer buyer;
	private boolean hardCopy;
	private double price;
	private String payment_method;
	//@Temporal(TemporalType.DATE)
	private Date purchaseDate;
	private String title;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBuyer_addr() {
		return buyer_addr;
	}
	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Buyer getBuyer() {
		return buyer;
	}
	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}
	public boolean isHardCopy() {
		return hardCopy;
	}
	public void setHardCopy(boolean hardCopy) {
		this.hardCopy = hardCopy;
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
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "Payment [id=" + id + ", name=" + name + ", email=" + email + ", buyer_addr=" + buyer_addr + ", buyer="
				+ buyer + ", hardCopy=" + hardCopy + ", price=" + price + ", payment_method=" + payment_method
				+ ", purchaseDate=" + purchaseDate + ", title=" + title + "]";
	}
	
	
	
}
