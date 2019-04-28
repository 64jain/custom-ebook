package com.example.demo.ebook.service.buyer;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.payment.Payment;
import com.example.demo.ebook.repository.buyer.BuyerRepository;
import com.example.demo.ebook.repository.payment.paymentRepository;

@Service
public class BuyerServiceImpl implements BuyerService {

	@Autowired
	BuyerRepository repository;
	@Autowired
	paymentRepository pay_repository;

	@Override
	public int registerBuyer(Buyer buyer) {
		// return dao.registerBuyer(buyer);
		Buyer save = repository.save(buyer);
		return save.getId();
	}

	@Override
	public Buyer validateBuyer(String loginId, String password) {
		List<Buyer> buyers = repository.findByLoginId(loginId);
		if (buyers.size() == 0) {
			return null;
		} else {

			Buyer buyer = buyers.get(0);
			if (buyer.getPassword().equals(password)) {
				return buyer;
			} else {
				return null;
			}
		}
	}

	@Override
	public List<File> buyerMyOrders(Buyer buyer) {
		String path = System.getProperty("user.home")+"/ebooks/buyer_"+buyer.getId()+"/Books";
		File[] files = new File(path).listFiles();
		List<File> files_list = Arrays.asList(files);
		return files_list;
	}

	@Override
	public List<Payment> buyerPayments(Buyer buyer) {
		List<Payment> payments = pay_repository.findByBuyer(buyer);
		return payments;
	}

	@Override
	public boolean checkLoginExists(String login) {
		List<Buyer> buyers = repository.findByLoginId(login);
		if (buyers.size() == 0) {
			return false;
		}
		return true;
	}
	
	
}
