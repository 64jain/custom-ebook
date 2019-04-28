package com.example.demo.ebook.repository.book;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.ebook.model.book.Book;
import java.lang.String;
import java.util.List;
import com.example.demo.ebook.model.publisher.Publisher;

public interface BookRepository extends CrudRepository<Book, Integer>{
	List<Book> findByKeywordsContaining(String keywords);
	List<Book> findByPublisher(Publisher publisher);
	List<Book> findByIdIn(List<Integer> books_id);
	
}
