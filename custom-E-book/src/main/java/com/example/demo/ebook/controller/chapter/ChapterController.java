package com.example.demo.ebook.controller.chapter;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.service.book.BookService;
import com.example.demo.ebook.service.chapter.ChapterService;

@Controller
public class ChapterController {

	@Autowired
	ChapterService service;
	@Autowired
	BookService bookService;

//	@RequestMapping("/configureChapters")
//	String configureChapters(ModelMap map,HttpSession session) {
//		Book book = (Book)session.getAttribute("book");
//		session.removeAttribute("book");
//		map.addAttribute("book", book);
//		return "configChapters";
//	}
//	
	@RequestMapping("preview")
	public @ResponseBody String preview(@RequestParam("id") int id, @RequestParam("startPage") int startPage,
			@RequestParam("endPage") int endPage, @RequestParam("totalPages") int totalPages, @RequestParam("source") String source) throws IOException {
		System.out.println(startPage);
		System.out.println(endPage);
		System.out.println(totalPages);
		System.out.println(source);
		if(startPage > totalPages || endPage > totalPages) {
			return "pages entered are more than total pages of the book";
		}
		else {
			String loc_start = System.getProperty("user.dir")+ "/src/main/resources/static/images/temp/start_preview_"+id;
			String loc_end = System.getProperty("user.dir")+ "/src/main/resources/static/images/temp/end_preview_"+id;
			service.cutPdf(startPage, startPage, source, loc_start, true,false);
			service.cutPdf(endPage, endPage, source, loc_end, true,false);
			return "";
		}
		
	}
	@RequestMapping("reConfChapters")
	public String reConfChapters(@RequestParam("id") int id, ModelMap map, HttpSession session) {
		if (session.getAttribute("id") == null || session.getAttribute("publisher")==null) {
			return "redirect:loginBuyerPublisher";
		}
		else {
			Book book = bookService.getBookById(id);
			List<Chapter> chaptersByBook = service.getChaptersByBook(book);
			map.addAttribute("book", book);
			map.addAttribute("listOfChapters", chaptersByBook);
			return "reConfigChapters";
		}
	}
	
	@RequestMapping(value="/reSaveChapters", method = RequestMethod.POST)
	public String reSaveChapters(@RequestParam Map<String, String> params, ModelMap map, HttpSession session) {
		int id = Integer.parseInt(params.get("bookId"));
		Book book = bookService.getBookById(id);
		List<Chapter> chapters = service.getChaptersByBook(book);
		for(Chapter chapter : chapters) {
			int chapId = chapter.getId();
			chapter.setName(params.get("name_"+chapId));
			chapter.setPrice(Integer.parseInt(params.get("price_"+chapId)));
			chapter.setDescription(params.get("description_"+chapId));
			chapter.setKeywords(params.get("keywords_"+chapId));
			service.saveChapter(chapter);
		}
		return "redirect:pubHome";
	}

	@RequestMapping(value="/saveChapters", method = RequestMethod.POST)
	public String saveChapters(@RequestParam Map<String, String> params, ModelMap map, HttpSession session)
			throws IOException {
		// System.out.println(params.get("name_1"));
		String temp_loc = System.getProperty("user.dir")+ "/src/main/resources/static/images/temp";
		File index = new File(temp_loc);
		String[]entries = index.list();
		for(String s: entries){
		    File currentFile = new File(index.getPath(),s);
		    currentFile.delete();
		}
		
		int id = Integer.parseInt(params.get("bookId"));
		Book book = bookService.getBookById(id);
		
		bookService.update(book);
		// System.out.println(book);
		ArrayList<String> chapNames = new ArrayList<String>();
		ArrayList<String> chapKeywords = new ArrayList<String>();
		ArrayList<String> chapDescription = new ArrayList<String>();
		ArrayList<Integer> chapPrice = new ArrayList<Integer>();
		ArrayList<Integer> chapStartPage = new ArrayList<Integer>();
		ArrayList<Integer> chapEndPage = new ArrayList<Integer>();
		for (int i = 1; i <= book.getNoOfChapters(); i++) {
			chapNames.add(params.get("name_" + i));
			chapKeywords.add(params.get("keywords_" + i));
			chapDescription.add(params.get("description_" + i));
			chapPrice.add(Integer.parseInt(params.get("price_" + i)));
			chapStartPage.add(Integer.parseInt(params.get("start_page_" + i)));
			chapEndPage.add(Integer.parseInt(params.get("end_page_" + i)));
		}
		System.out.println(params.size());
		System.out.println(chapNames);
		System.out.println(chapDescription);
		System.out.println(chapKeywords);
		System.out.println(chapPrice);
		System.out.println(chapStartPage);
		System.out.println(chapEndPage);
		service.saveChapters(chapNames, chapKeywords, chapDescription, chapPrice, chapStartPage, chapEndPage, book);
		book.setChaptersAdded(true);
		return "redirect:pubHome";
	}
	
	@RequestMapping(value="/getpdf1", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getPDF1(@RequestParam("id") int id ) throws IOException {

		Chapter chapter = service.getChapterById(id);
	    HttpHeaders headers = new HttpHeaders();

	    headers.setContentType(MediaType.parseMediaType("application/pdf"));
	    String filename = chapter.getLoc().substring(0, chapter.getLoc().length()-4)+"_preview.pdf";
	    File file = new File(filename);
	    byte[] pdf1Bytes = Files.readAllBytes(file.toPath());
	    headers.add("content-disposition", "inline;filename=" + filename);

	    headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	    ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(pdf1Bytes, headers, HttpStatus.OK);
	    return response;
	}
	
	@RequestMapping("previewBuyerChapter")
	public String previewBuyerBook(@RequestParam("id") int id, ModelMap map, HttpSession session) {
		if (session.getAttribute("buyer")==null) {
			return "redirect:searchResult";
		}
		else {
			Chapter chapter = service.getChapterById(id);
			
			map.addAttribute("chapter", chapter);
			return "previewBuyerChapter";
		}
		
	}
	
}
