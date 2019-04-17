package com.example.demo.ebook.controller.book;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.publisher.Publisher;
import com.example.demo.ebook.service.book.BookService;
import com.example.demo.ebook.service.chapter.ChapterService;

@Controller
public class BookController {
	
	@Autowired
	BookService service;
	@Autowired
	ChapterService chap_service;
	
	@RequestMapping(value = "/registerBook", method = RequestMethod.POST)
	public String registerPublisher(@RequestParam("file") MultipartFile file, @ModelAttribute("book") Book book, ModelMap map,HttpSession session) throws IOException {
		if(session.getAttribute("id")==null) {
			return "redirect:loginBuyerPublisher";
		}
		Publisher publisher=(Publisher) session.getAttribute("publisher");
		Book result = service.registerBook(book,publisher);
		map.addAttribute("result", "book created with id "+result.getId());
		service.saveBook(file, result, publisher.getId());
		map.addAttribute("book",result);
		return "successBookRegistration";
	}
	
	@RequestMapping("pubHome")
	public String publisherHome(ModelMap map, HttpSession session) {
		if (session.getAttribute("id") == null || session.getAttribute("publisher")==null) {
			return "redirect:loginBuyerPublisher";
		} else {
			String temp_loc = System.getProperty("user.dir")+ "/src/main/resources/static/images/temp";
			File index = new File(temp_loc);
			String[]entries = index.list();
			for(String s: entries){
			    File currentFile = new File(index.getPath(),s);
			    currentFile.delete();
			}
			Publisher publisher =(Publisher) session.getAttribute("publisher");
			List<Book> publisherBooks = service.getPublisherBooks(publisher);
			//System.out.println(publisherBooks.get(0).getBookName());
			map.addAttribute("publisherBooks", publisherBooks);
			return "publisherHome";
		}
		
		
	}
	@RequestMapping("confChapters")
	public String confChapters(@RequestParam("id") int id, ModelMap map, HttpSession session) {
		if (session.getAttribute("id") == null || session.getAttribute("publisher")==null) {
			return "redirect:loginBuyerPublisher";
		}
		else {
			Book book = service.getBookById(id);
			System.out.println(book);
			System.out.println(book.getBookName());
			map.addAttribute("book", book);
			return "configChapters";
		}
		
	}
	@RequestMapping("previewBuyerBook")
	public String previewBuyerBook(@RequestParam("id") int id, ModelMap map, HttpSession session) {
		if (session.getAttribute("buyer")==null) {
			return "redirect:searchResult";
		}
		else {
			Book book = service.getBookById(id);
			List<Chapter> chapters = chap_service.getChapterByBookId(book);
			map.addAttribute("book", book);
			map.addAttribute("chapters", chapters);
			return "previewBuyerBook";
		}
		
	}
	
	

}
