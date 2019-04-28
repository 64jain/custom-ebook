package com.example.demo.ebook.service.orderedEbook;

import java.util.List;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.orderedEbook.OrderedEbook;
import com.example.demo.ebook.model.payment.Payment;

public interface OrderedEbookService {
 void saveOrder(Buyer buyer,Payment payment,String location);
 List<OrderedEbook> getOrderderedEbook(Buyer buyer);
 OrderedEbook getSingleEbook(int id);
}
