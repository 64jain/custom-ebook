package com.example.demo.ebook.service.orderedEbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.ebook.repository.orderedEbook.OrderedEbookRepository;

@Service
public class OrderedEbookServiceImpl implements OrderedEbookService {

	@Autowired
	OrderedEbookRepository repository;
	
	
}
