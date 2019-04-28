package com.example.demo.ebook.model.chapter;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.example.demo.ebook.model.book.Book;

@Entity
public class Chapter implements Serializable {
	@Id
	@GeneratedValue
	private int id;
	private String description;
	private String name;
	private int startPage;
	private int endPage;
	private String keywords;
	private double price;
	@ManyToOne
	private Book book;
	private String loc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	@Override
	public String toString() {
		return "Chapter [id=" + id + ", description=" + description + ", name=" + name + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", keywords=" + keywords + ", price=" + price + ", book=" + book + ", loc="
				+ loc + "]";
	}
}
