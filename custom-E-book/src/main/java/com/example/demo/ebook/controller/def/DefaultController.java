package com.example.demo.ebook.controller.def;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.service.customEBook.EbookService;

@Controller
public class DefaultController {
	
	@Autowired
	EbookService service;

	@RequestMapping("/")
	public String test(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session==null) {
			return "index";
		}
		if (session.getAttribute("id") != null) {
			if(session.getAttribute("publisher")!=null) {
				return "redirect:pubHome";
			}
			else if (session.getAttribute("buyer")!=null) {
				return "redirect:buyHome";
			}
		}
		return "index";
	}
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
//	@RequestMapping("regBuyer")
//	public String regBuyer() {
//		return "regBuyer";
//	}
//	
//	@RequestMapping("regPublisher")
//	public String regPublisher() {
//		return "regPublisher";
//	}

	@RequestMapping("regBuyerPublisher")
	public String regBuyerPublisher() {
		return "Register";
	}

	@RequestMapping("loginBuyerPublisher")
	public String loginBuyerPublisher(ModelMap map, HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			if (session.getAttribute("id") != null) {
				if(session.getAttribute("publisher")!=null) {
					return "redirect:pubHome";
				}
				else if (session.getAttribute("buyer")!=null) {
					return "redirect:buyHome";
				}
			}
			
		}
		
		map.addAttribute("error", "");
		return "Login";
	}

//	@RequestMapping("loginPub")
//	public String LoginPublisher(ModelMap map, HttpSession session) {
//		if(session.getAttribute("id")!=null) {
//			return "redirect:pubHome";
//		}
//		map.addAttribute("error","");
//		return "Login";
//	}

	

//	@RequestMapping("loginBuy")
//	public String LoginBuyer(ModelMap map, HttpSession session) {
//		if(session.getAttribute("id")!=null) {
//			return "redirect:buyHome";
//		}
//		map.addAttribute("error","");
//		return "buyerLogin";
//	}

	@RequestMapping("buyHome")
	public String buyerHome(ModelMap map, HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:loginBuy";
		} else {
			Buyer buyer=(Buyer)session.getAttribute("buyer");
			List<Book> books= service.findRecommendedBooks(buyer);
			map.addAttribute("books",books);
			return "buyerHome";
		}
	}

	@RequestMapping("regBook")
	public String regBook(ModelMap map, HttpSession session) {
		if (session.getAttribute("publisher") == null) {
			return "redirect:pubHome";
		} else {
			return "regBook";
		}
	}
	@RequestMapping("search")
	public String search() {
		return "search";
	}

}
