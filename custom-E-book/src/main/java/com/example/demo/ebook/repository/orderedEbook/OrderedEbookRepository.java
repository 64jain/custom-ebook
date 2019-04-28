package com.example.demo.ebook.repository.orderedEbook;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.orderedEbook.OrderedEbook;

public interface OrderedEbookRepository extends CrudRepository<OrderedEbook, Integer> {
	List<OrderedEbook> findByBuyer(Buyer buyer);
}
