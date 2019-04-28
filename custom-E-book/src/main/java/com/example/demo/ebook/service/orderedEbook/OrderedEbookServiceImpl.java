package com.example.demo.ebook.service.orderedEbook;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.customEBook.CustomEBook;
import com.example.demo.ebook.model.orderedEbook.OrderedEbook;
import com.example.demo.ebook.model.payment.Payment;
import com.example.demo.ebook.repository.customEBook.EbookRepository;
import com.example.demo.ebook.repository.orderedEbook.OrderedEbookRepository;
import com.example.demo.ebook.service.customEBook.EbookService;

@Service
class OrderedEbookServiceImpl implements OrderedEbookService{
	@Autowired
	EbookService ebook_service;
	@Autowired
	OrderedEbookRepository repository;
	@Override
	public void saveOrder(Buyer buyer, Payment payment, String location) {
				OrderedEbook orderEbook = new OrderedEbook();
				orderEbook.setBuyer(buyer);
				orderEbook.setLocation(location);
				orderEbook.setPayment(payment);
				List<CustomEBook> ebooks=ebook_service.showContent(buyer);
				Set<Book> book_set =new HashSet<>();
				Set<Chapter> chapter_set=new HashSet<>();
				Set<String>keyword_set=new HashSet<>();
				String keywords="";
				int count=0;
				for(CustomEBook ebook:ebooks)
				{
					if(ebook.getChapter()==null)
					{
						book_set.add(ebook.getBook());
						if(count==0)
							keywords=ebook.getBook().getKeywords();
						else
							keywords=keywords+","+ebook.getBook().getKeywords();
						
					}
					else
					{
						chapter_set.add(ebook.getChapter());
						if(count==0)
							keywords=ebook.getChapter().getKeywords();
						else
							keywords=keywords+","+ebook.getChapter().getKeywords();
					}
					count=1;
				}
				String[] keywordList = keywords.split(",");
				for (String keyword : keywordList) {
					keyword_set.add(keyword);
				}
				keywords="";
				count=0;
				
				Iterator it=keyword_set.iterator();
				while(it.hasNext())
				{
					if(count==0)
						keywords=(String)it.next();
					else
						keywords=keywords+","+(String)it.next();
					count=1;
				}
				System.out.println(keywords);
				
				orderEbook.setKeywords(keywords);	
				orderEbook.setBookList(book_set);
				orderEbook.setChapterList(chapter_set);
				repository.save(orderEbook);
				
	}
	@Override
	public List<OrderedEbook> getOrderderedEbook(Buyer buyer) {
		List<OrderedEbook> orderedEbooks = repository.findByBuyer(buyer);
		return orderedEbooks;
	}
	@Override
	public OrderedEbook getSingleEbook(int id) {
		Optional<OrderedEbook> orderedEbook = repository.findById(id);
		return orderedEbook.get();
	}
	
}
