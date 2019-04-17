package com.example.demo;

import java.io.IOException;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.customEBook.CustomEBook;
import com.example.demo.ebook.model.publisher.Publisher;
import com.example.demo.ebook.repository.buyer.BuyerRepository;
import com.example.demo.ebook.repository.customEBook.EbookRepository;
import com.example.demo.ebook.repository.publisher.PublisherRepository;
import com.example.demo.ebook.service.buyer.BuyerService;

import com.example.demo.ebook.service.customEBook.EbookService;

import com.example.demo.ebook.service.chapter.ChapterService;

import com.example.demo.ebook.service.publisher.PublisherService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CustomEBookApplicationTests {

	@Autowired
	ApplicationContext context;
	//@Test
	public void saveBuyer() {
		BuyerRepository repository = context.getBean(BuyerRepository.class);
		BuyerService service = context.getBean(BuyerService.class);
		Buyer buyer = new Buyer();
		buyer.setEmail("test@test.com");
		buyer.setLoginId("set");
		buyer.setName("john");
		buyer.setPassword("pass");
		service.registerBuyer(buyer);
		//repository.save(buyer);
	}
	//@Test
	public void savePublisher() {
		PublisherRepository repository = context.getBean(PublisherRepository.class);
//		BuyerService service = context.getBean(BuyerService.class);
		Publisher publisher = new Publisher();
		publisher.setEmail("test@test.com");
		publisher.setLoginId("set");
		publisher.setName("john");
		publisher.setPassword("pass");
//		service.registerBuyer(buyer);
		repository.save(publisher);
	}
	
	//@Test
	public void validatePublisher() {
		PublisherService service = context.getBean(PublisherService.class);
		String login="sh4yansh@gmail.com";
		String pass="123456";
		Publisher publisher = service.validatePublisher(login, pass);
		System.out.println(publisher);
	}
	
	//@Test
	public void validatePublisherRepo() {
		PublisherRepository repo = context.getBean(PublisherRepository.class);
		String login="sh4yansh@gmail.com";
		String pass="pass";
		List<Publisher> list = repo.findByLoginId(login);
		Publisher publisher = list.get(0);
		System.out.println(publisher);
	}

//	@Test
	/*public void Show()
	{
		
		EbookRepository repository = context.getBean(EbookRepository.class);
		EbookService service = context.getBean(EbookService.class);
		Buyer buyer=new Buyer();
		buyer.setId(4);
		buyer.setEmail("sam@gmail.com");
		buyer.setLoginId("sam1096");
		buyer.setName("sam");
		buyer.setPassword("1234");
		System.out.println("**********************");
		System.out.println(buyer);
		System.out.println("**********************");

		System.out.println("");
		System.out.println("");
		List<CustomEBook> list=repository.findByBuyerOrderBySequence(buyer);
		for(int i=0;i<list.size();i++)
			{System.out.println("**********************");
				System.out.println(list.get(i).getPrice());
				System.out.println("**********************");

			}
		System.out.println("**********************");
		System.out.println("done");
		System.out.println("**********************");
			}
		
	*/

	
	//@Test
	public void preview() throws IOException {
		ChapterService service = context.getBean(ChapterService.class);
		int startPage = 1;
		int endPage = 1;
		String source = "/home/shreyansh/ebooks/publisher_5/book_20/complete_book.pdf";
		String dest = System.getProperty("user.dir")+ "/src/main/resources/static/images/temp/start_preview_1";
		System.out.println(System.getProperty("user.dir"));

		service.cutPdf(startPage, endPage, source, dest, true, true);
	}
	
	@Test
	public void previewChapter() {
		ChapterService service = context.getBean(ChapterService.class);
		String loc = "/home/shreyansh/ebooks/publisher_5/book_25/chap_3.pdf";
		String previewChapter = service.previewChapter(loc);
		System.out.println(previewChapter);
	}


}
