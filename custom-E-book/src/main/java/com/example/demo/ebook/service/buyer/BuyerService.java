package com.example.demo.ebook.service.buyer;

import java.io.File;
import java.util.List;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.payment.Payment;

public interface BuyerService {
	int registerBuyer(Buyer buyer);
	Buyer validateBuyer(String loginId, String password);
	List<File> buyerMyOrders(Buyer buyer);
	List<Payment> buyerPayments(Buyer buyer);
	boolean checkLoginExists(String login);
}
