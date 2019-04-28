package com.example.demo.ebook.repository.orderedEbook;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.ebook.model.orderedEbook.OrderedEbook;

public interface OrderedEbookRepository extends CrudRepository<OrderedEbook, Integer> {
	
}
