package com.example.demo.ebook.controller.def;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping("/")
	public String test() {
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
		if (session.getAttribute("id") != null) {
			if(session.getAttribute("publisher")!=null) {
				return "redirect:pubHome";
			}
			else if (session.getAttribute("buyer")!=null) {
				return "redirect:buyHome";
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
