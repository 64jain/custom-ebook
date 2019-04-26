package com.example.demo.ebook.service.publisher;

import com.example.demo.ebook.model.publisher.Publisher;

public interface PublisherService {
	int registerPublisher(Publisher publisher);
	Publisher validatePublisher(String loginId, String password);
	boolean checkLoginExists(String login);
}
