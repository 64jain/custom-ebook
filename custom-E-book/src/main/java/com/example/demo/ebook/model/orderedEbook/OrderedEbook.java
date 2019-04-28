package com.example.demo.ebook.model.orderedEbook;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.payment.Payment;

@Entity
public class OrderedEbook implements Serializable {
	@Id
	@GeneratedValue
	private int id;
	
	@OneToOne
	Buyer buyer;
	
	@OneToOne
	Payment payment;
	
	String location;
	String keywords;
	
	@ManyToMany
	Set<Book> bookList;
	
	@ManyToMany
	Set<Chapter> chapterList;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Set<Book> getBookList() {
		return bookList;
	}

	public void setBookList(Set<Book> bookList) {
		this.bookList = bookList;
	}

	public Set<Chapter> getChapterList() {
		return chapterList;
	}

	public void setChapterList(Set<Chapter> chapterList) {
		this.chapterList = chapterList;
	}
	
}
