package com.example.demo.ebook.service.orderedEbook;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.orderedEbook.OrderedEbook;
import com.example.demo.ebook.model.payment.Payment;

public interface OrderedEbookService {
 void saveOrder(Buyer buyer,Payment payment,String location);
}
