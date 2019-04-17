package com.example.demo.ebook.repository.payment;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.ebook.model.payment.Payment;

public interface paymentRepository  extends CrudRepository<Payment,Integer>{

}
