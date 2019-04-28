package com.example.demo.ebook.repository.payment;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.payment.Payment;

public interface paymentRepository  extends CrudRepository<Payment,Integer>{
	List<Payment> findByBuyer(Buyer buyer);
}
