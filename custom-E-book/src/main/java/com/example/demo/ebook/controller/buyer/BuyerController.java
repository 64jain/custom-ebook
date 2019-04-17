package com.example.demo.ebook.controller.buyer;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.service.buyer.BuyerService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class BuyerController {
	
	@Autowired
	BuyerService service;
	
	@RequestMapping(value = "/registerBuyer", method = RequestMethod.POST)
	public String registerBuyer(@ModelAttribute("buyer") Buyer buyer, ModelMap map) {
		int result = service.registerBuyer(buyer);
		map.addAttribute("result", "user created with id "+result);
		return "successRegistration";
	}
	
	@RequestMapping(value = "/validateBuyerLogin", method = RequestMethod.POST)
	public String buyerLogin(@RequestParam("loginId") String loginId, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null) {
			return "redirect:buyHome";
		}
		Buyer buyer = service.validateBuyer(loginId,password);
		if(buyer==null) {
			map.addAttribute("error", "username or password invalid");
			return "Login";
		}
		else {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", buyer.getId());
			session.setAttribute("buyer", buyer);
			return "redirect:buyHome";
		}
	}
	@RequestMapping("/logoutBuyer")
	public String logoutPublisher(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/myOrders")
	public String myOrders(ModelMap map,HttpSession session) {
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		List<File> files_list = service.buyerMyOrders(buyer);
		if(files_list!=null)
			map.addAttribute("files_list", files_list);
		return "myOrders";
	}
	
}
