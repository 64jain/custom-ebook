package com.example.demo.ebook.controller.publisher;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.ebook.model.publisher.Publisher;
import com.example.demo.ebook.service.book.BookService;
import com.example.demo.ebook.service.publisher.PublisherService;

@Controller
public class PublisherController {
	
	@Autowired
	PublisherService service;
	
	@RequestMapping(value = "/registerPublisher", method = RequestMethod.POST)
	public String registerPublisher(@ModelAttribute("buyer") Publisher publisher, ModelMap map) {
		int result = service.registerPublisher(publisher);
		map.addAttribute("result", "user created with id "+result);
		return "successRegistration";
	}
	
	@RequestMapping(value = "/validatePublisherLogin", method = RequestMethod.POST)
	public String publisherLogin(@RequestParam("loginId") String loginId, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null) {
			return "redirect:pubHome";
		}
		Publisher publisher = service.validatePublisher(loginId,password);
		if(publisher==null) {
			map.addAttribute("error", "username or password invalid");
			return "Login";
		}
		else {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", publisher.getId());
			session.setAttribute("publisher", publisher);
			return "redirect:pubHome";
		}
	}
	@RequestMapping("/logoutPublisher")
	public String logoutPublisher(HttpSession session) {
		String temp_loc = System.getProperty("user.dir")+ "/src/main/resources/static/images/temp";
		File index = new File(temp_loc);
		String[]entries = index.list();
		for(String s: entries){
		    File currentFile = new File(index.getPath(),s);
		    currentFile.delete();
		}
		session.invalidate();
		return "redirect:/";
	}
	
}
