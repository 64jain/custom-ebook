package com.example.demo.ebook.service.customEBook;

import java.io.IOException;
import java.util.*;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.customEBook.CustomEBook;
import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.buyer.Buyer;
public interface EbookService {
	List<CustomEBook> showContent(Buyer buyer);
	void deleteChapter(int id);
	int updateEbook(List<Integer>ebookid,List<Integer>sequence);
	 void deleteContentAfterSave(Buyer buyer);
	List<Book> getBooks(String keywords);
	List<Chapter> getChapters(String keywords);
	int saveEBook(List<Integer> books_id,List<Integer> chapters_id,Buyer buyer);
	void generateHTMLFromPDF(String filename) throws IOException;
	void mergePdf(Buyer buyer,boolean preview);
	 void savePaymentContent(String name,String email,Buyer buyer,String price,String addr,String copy_type,String paymentMethod);
}
