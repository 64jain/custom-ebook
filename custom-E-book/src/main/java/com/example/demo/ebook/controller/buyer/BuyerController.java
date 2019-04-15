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

import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.chapter.Chapter;
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
		if(files_list!=null) {
			map.addAttribute("files_list", files_list);
			return "myOrders";
		}
		else {
			
			return "noOrders";
		}
	}
	@RequestMapping("/displayEbook")
	public String displayEbook(@RequestParam int index, ModelMap map,HttpSession session) {
		map.addAttribute("index", index);
		return "viewEbook";
	}
	
	@RequestMapping(value="/getEbook", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getEbook(@RequestParam("index") int index, HttpSession session ) throws IOException {
		
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		List<File> files_list = service.buyerMyOrders(buyer);
		File ebook = files_list.get(index-1);
	    HttpHeaders headers = new HttpHeaders();

	    headers.setContentType(MediaType.parseMediaType("application/pdf"));
	    String filename = ebook.getAbsolutePath();
	    System.out.println(filename);
	    File file = ebook;
	    byte[] pdf1Bytes = Files.readAllBytes(file.toPath());
	    headers.add("content-disposition", "inline;filename=" + filename);

	    headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	    ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(pdf1Bytes, headers, HttpStatus.OK);
	    return response;
	}
	
	
}
