package com.example.demo.ebook.controller.buyer;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.orderedEbook.OrderedEbook;
import com.example.demo.ebook.model.payment.Payment;
import com.example.demo.ebook.repository.orderedEbook.OrderedEbookRepository;
import com.example.demo.ebook.service.buyer.BuyerService;
import com.example.demo.ebook.service.orderedEbook.OrderedEbookService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class BuyerController {
	
	@Autowired
	BuyerService service;
	@Autowired
	OrderedEbookService order_service;
	
	@RequestMapping(value = "/registerBuyer", method = RequestMethod.POST)
	public String registerBuyer(@ModelAttribute("buyer") Buyer buyer, ModelMap map) {
		int result = service.registerBuyer(buyer);
		map.addAttribute("result", "user created with id "+result);
		System.out.println(" INFO : Registering in buyer");
		return "index";
	}
	
	@RequestMapping(value = "/validateBuyerLogin", method = RequestMethod.POST)
	public String buyerLogin(@RequestParam("loginId") String loginId, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null) {
			return "redirect:buyHome";
		}
		Buyer buyer = service.validateBuyer(loginId,password);
		if(buyer==null) {
			map.addAttribute("error", "Invalid username or password");
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
		System.out.println(" INFO : logging out buyer");
		return "redirect:/";
	}
	@RequestMapping("/myOrders")
	public String myOrders(ModelMap map,HttpSession session) {
		Buyer buyer = (Buyer) session.getAttribute("buyer");
//		List<File> files_list = service.buyerMyOrders(buyer);
//		List<Payment> payments = service.buyerPayments(buyer);
		List<OrderedEbook> orderedEbooks = order_service.getOrderderedEbook(buyer);
		if(orderedEbooks!=null) {
			map.addAttribute("orderBooks", orderedEbooks);
		}
			return "myOrders";
		
	}
	@RequestMapping("/displayEbook")
	public String displayEbook(@RequestParam int index, ModelMap map,HttpSession session) {
		map.addAttribute("index", index);
		return "viewEbook";
	}
	
	@RequestMapping(value="/getEbook", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getEbook(@RequestParam("index") int index, HttpSession session ) throws IOException {
		
		Buyer buyer = (Buyer) session.getAttribute("buyer");
//		List<File> files_list = service.buyerMyOrders(buyer);
//		File ebook = files_list.get(index-1);
	    HttpHeaders headers = new HttpHeaders();

	    headers.setContentType(MediaType.parseMediaType("application/pdf"));
//	    String filename = ebook.getAbsolutePath();
//	    System.out.println(filename);
//	    File file = ebook;
	    OrderedEbook orderedEbook = order_service.getSingleEbook(index);
	    File file = new File(orderedEbook.getLocation());
	    byte[] pdf1Bytes = Files.readAllBytes(file.toPath());
	    headers.add("content-disposition", "inline;filename=" + orderedEbook.getLocation());

	    headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	    ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(pdf1Bytes, headers, HttpStatus.OK);
	    return response;
	}
	
	@RequestMapping("buyerLoginExist")
	public @ResponseBody boolean buyerLoginExist( @RequestParam("login") String login) {
		boolean loginExists = service.checkLoginExists(login);
		return loginExists;
	}
}
