package com.example.demo.ebook.service.book;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.apache.commons.io.FileUtils;
import org.apache.pdfbox.multipdf.Splitter;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.publisher.Publisher;
import com.example.demo.ebook.repository.book.BookRepository;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	BookRepository repository;
	@Override
	public Book registerBook(Book book,Publisher publisher) {
		book.setPublisher(publisher);
		book.setKeywords(book.getKeywords()+","+book.getBookName()+","+publisher.getName());
		Book save = repository.save(book);
		return save;
	}
	@Override
	public String saveBook(MultipartFile file, Book book, int publisherId) throws IOException {
		if (!file.isEmpty()) {
			byte[] bytes = file.getBytes();
			String homeDir = System.getProperty("user.home");
			System.out.println(homeDir);
			String destination = homeDir+"/ebooks/publisher_"+publisherId+"/book_"+book.getId()+"/complete_book.pdf";
			File file2 = new File(destination);
			file2.getParentFile().mkdirs();
			FileUtils.writeByteArrayToFile(file2, bytes);
			int noOfPages = getNoOfPages(destination);
			String preview_destination = homeDir+"/ebooks/publisher_"+publisherId+"/book_"+book.getId()+"/complete_book_preview.pdf";
			
			int endPage = 2;
			if(noOfPages<2) {
				endPage = noOfPages;
			}
			else {
				int temp = (int) (0.2 * noOfPages);
				if(temp>endPage) {
					endPage = temp;
				}
			}
			cutPdf(1, endPage, destination, preview_destination, true);
			book.setTotalNoOfPages(noOfPages);
			book.setBookLoc(destination);
			book.setChaptersAdded(false);
			repository.save(book);
			return destination;
		}
		return "";
		
	}
	
	public String cutPdf(int startPage, int endPage, String source, String dest, boolean book_preview_flag) throws IOException {
		File file = new File(source);
		PDDocument sourceDocument = PDDocument.load(file);
		Splitter splitter = new Splitter();
		splitter.setStartPage(startPage);
		splitter.setEndPage(endPage);
		splitter.setSplitAtPage(endPage);
		List<PDDocument> split1 = splitter.split(sourceDocument);
		if(book_preview_flag) {
			PDPage blankPage = new PDPage();
			split1.get(0).addPage(blankPage);
			PDPageContentStream contentStream = new PDPageContentStream(split1.get(0), blankPage);
			contentStream.beginText();
			contentStream.newLineAtOffset(25, 700);
			String text = "This is only a preview of the book, buy the book to view its contents";
			contentStream.setFont(PDType1Font.TIMES_ROMAN, 20);
			contentStream.showText(text);
			contentStream.endText();
			contentStream.close();	
		}
		split1.get(0).save(new File(dest));
		sourceDocument.close();
		return "";
	}
	
	@Override
	public List<Book> getPublisherBooks(Publisher publisher) {
		List<Book> byPublisher = repository.findByPublisher(publisher);
		return byPublisher;
	}
	@Override
	public Book getBookById(int id) {
		Optional<Book> book = repository.findById(id);
		return book.get();
	}
	@Override
	public void update(Book book) {
		repository.save(book);
	}
	@Override
	public int getNoOfPages(String location) throws IOException {
		PDDocument doc = PDDocument.load(new File(location));
		int count = doc.getNumberOfPages();
		return count;
	}

}
