package com.example.demo.ebook.service.publisher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.ebook.model.publisher.Publisher;
import com.example.demo.ebook.repository.publisher.PublisherRepository;

@Service
public class PublisherServiceImpl implements PublisherService {

	@Autowired
	PublisherRepository repository;

	@Override
	public int registerPublisher(Publisher publisher) {
		Publisher save = repository.save(publisher);
		return save.getId();
	}

	@Override
	public Publisher validatePublisher(String loginId, String password) {
		List<Publisher> publishers = repository.findByLoginId(loginId);
		if (publishers.size() == 0) {
			return null;
		} else {

			Publisher publisher = publishers.get(0);
			if (publisher.getPassword().equals(password)) {
				return publisher;
			} else {
				return null;
			}
		}

	}

	@Override
	public boolean checkLoginExists(String login) {
		List<Publisher> publishers = repository.findByLoginId(login);
		if (publishers.size() == 0) {
			return false;
		}
		return true;
	}

}
