package com.example.demo.ebook.controller.orderedEbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.ebook.service.orderedEbook.OrderedEbookService;

@Controller
public class OrderedEbookController {
	@Autowired
	OrderedEbookService service;
	
}
