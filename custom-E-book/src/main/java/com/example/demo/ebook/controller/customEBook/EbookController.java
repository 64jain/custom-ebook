package com.example.demo.ebook.controller.customEBook;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.customEBook.CustomEBook;
import com.example.demo.ebook.service.customEBook.EbookService;
import com.example.demo.ebook.service.customEBook.SendEmail;


@Controller
public class EbookController {
	
	@Autowired
	EbookService service;

	@RequestMapping(value = "/showEbookContent")
	public String ShowContent(ModelMap map,HttpSession session)
	{
		if(session.getAttribute("id")==null) {
			return "redirect:loginBuyerPublisher";
		}
		Buyer buyer = (Buyer)session.getAttribute("buyer");
		if(buyer==null)
			return "redirect:loginBuyerPublisher";
		List<CustomEBook> list = service.showContent(buyer);
		map.addAttribute("ebooks", list);
		map.addAttribute("error", "");
		map.addAttribute("size", list.size());
		return "Cart";
	}
	/*
	 * @RequestMapping(value = "/showEbookContent", method = RequestMethod.POST)
	 * public String ShowContent(ModelMap map,HttpSession
	 * session,@RequestParam("chapters")List<Chapter>chapters,@RequestParam(
	 * "ebookid")ebookid) { if(session.getAttribute("id")==null) { return
	 * "redirect:loginBuyerPublisher"; } Buyer buyer=(Buyer)
	 * session.getAttribute("buyer"); CustomEbook
	 * result=service.customizeContent(buyer,chapters,ebookid);
	 * map.addAttribute("result","custom ebook created with id "+result.getEbookId()
	 * ); return "successRegistration"; }
	 */
	@RequestMapping(value = "/searchResult")
	public String searchResult(@RequestParam("keywords") String keywords, ModelMap map) {
		if(keywords=="")
			return "buyHome";
		List<Book> books = service.getBooks(keywords);
		List<Chapter> chapters = service.getChapters(keywords);
		if (books != null)
			map.addAttribute("books", books);
		if (chapters != null)
			map.addAttribute("chapters", chapters);
		map.addAttribute("keywords", keywords);
		return "searchResult";
	}

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public String addToCart(@RequestParam(value = "bookIdList", required = false) List<Integer> bookIdList,
			@RequestParam(value = "chapterIdList",required=false) List<Integer> chapterIdList, ModelMap map, HttpSession session) {
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		if(buyer==null)
			return "redirect:loginBuyerPublisher";
		int save = service.saveEBook(bookIdList, chapterIdList, buyer);
		return "redirect:showEbookContent";
	}
	@RequestMapping(value = "/deletechapter/{id}")
	public String DeleteContent(@PathVariable(value="id") int id,HttpSession session)
	{if(session.getAttribute("id")==null) {
		return "redirect:loginBuyerPublisher";
	}
	Buyer buyer=(Buyer) session.getAttribute("buyer");
	if(buyer==null)
		return "redirect:loginBuyerPublisher";
		service.deleteChapter(id);
		return "Cart";
	}
	
	
	@RequestMapping(value = "/saveEbookContent")
	public String SaveContent(ModelMap map,HttpSession session,@RequestParam("ebookid")List<Integer>ebookid,@RequestParam("sequence")List<Integer>sequence)
	{
		if (session.getAttribute("id") == null) {
			return "redirect:loginBuyerPublisher";
		}
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		if (buyer == null)
			return "redirect:loginBuyerPublisher";
			//to check whether dropdown contains duplicate values
			List<Integer>duplicate=new ArrayList<Integer>();
			for(int i=0;i<sequence.size();i++)
			{
				duplicate.add(sequence.get(i));
			}
			Collections.sort(duplicate);
			for (int i = 0; i < duplicate.size()-1; i++) {
			   if(duplicate.get(i).equals(duplicate.get(i+1)))
			   {map.addAttribute("error", "Selected particular sequence more than once");
		      return "redirect:showEbookContent";
		    }
			}
		int i=service.updateEbook(ebookid,sequence);
		if(i==1)
			map.addAttribute("result", "successfully added");
		else
			map.addAttribute("result", "failed");
		return "redirect:showEbookContent";
		
		
	}
	@RequestMapping(value ="/payment")
	public String Payment(HttpSession session,ModelMap map)
	{
		if (session.getAttribute("id") == null) {
			return "redirect:loginBuyerPublisher";
		}
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		if (buyer == null)
			return "redirect:loginBuyerPublisher";
		List<CustomEBook> list=service.showContent(buyer);
		double total=0;
		@SuppressWarnings("unused")
		int totalPages=0;
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getChapter()==null)
			{
				total+=list.get(i).getBook().getPrice();
				totalPages+=list.get(i).getBook().getTotalNoOfPages();
			}
			else
			{
				total+=list.get(i).getChapter().getPrice();
				totalPages+=(list.get(i).getChapter().getEndPage()-list.get(i).getChapter().getStartPage() +1);
			}
		}
		double hardCopyPrice = total+totalPages*0.5 +30;
		service.mergePdf(buyer, true);    //for creating ebook preview
		map.addAttribute("price", total);
		map.addAttribute("hardCopyPrice", hardCopyPrice);
		return "Payment";
	}
	@RequestMapping("/paymentPage")
	public String paymentPage(ModelMap map,HttpSession session,@RequestParam( value="price",required=false) String price,
								@RequestParam(value="hardCopyPrice",required=false) String hardCopyPrice)
	{
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		if(buyer==null)
			return "redirect:loginBuyerPublisher";
		if(price!=null)
		{
			map.addAttribute("price",price);
			map.addAttribute("hardCopyPrice",hardCopyPrice);
			System.out.println(hardCopyPrice);	
			System.out.println(price);
		}
		map.addAttribute(buyer);
		//map.addAttribute("hardCopyPrice",hardCopyPrice);
		return "paymentPage";
	}
	
	@RequestMapping("/successPayment")
	public String successPayment(ModelMap map,HttpSession session,@RequestParam("name") String name,@RequestParam("email")String email,@RequestParam("price")String price,@RequestParam("addr")String addr,@RequestParam(value="copy_type",required=false)String copy_type,@RequestParam("paymentMethod")String paymentMethod)
	{
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		if(buyer==null)
			return "redirect:loginBuyerPublisher";
		
		System.out.println("********************************************************");
		System.out.println(email);
		System.out.println(name);
		System.out.println(price);
		System.out.println(addr);
		System.out.println(copy_type);
		System.out.println(paymentMethod);
		System.out.println("********************************************************");
		service.savePaymentContent(name,email,buyer,price,addr,copy_type,paymentMethod);
		service.mergePdf(buyer,false);
		//String filename="/home/samridhi/mid.pdf";
		//SendEmail s=new SendEmail(price,filename);
		service.deleteContentAfterSave(buyer);
		map.addAttribute("result", "Email has been sent to the recipient email address!");
		return "successPayment";
	}
//	@RequestMapping(value ="/buy")
//	public String Buy(ModelMap map,HttpSession session,@RequestParam("price")String price)
//	{
//		if (session.getAttribute("id") == null) {
//			return "redirect:loginBuyerPublisher";
//		}
//		Buyer buyer = (Buyer) session.getAttribute("buyer");
//		if (buyer == null)
//			return "redirect:loginBuyerPublisher";
//		String filename="/home/samridhi/mid.pdf";
//		//List<CustomEBook> list=service.showContent(buyer);
//		SendEmail s=new SendEmail(price,filename);
//		service.deleteContentAfterSave(buyer);
//		map.addAttribute("result", "Email has been sent to the recipient email address!");
//		return "successRegistration";
//	}


	@RequestMapping("/combinePdf")
	public String combinePdf(HttpSession session)
	{
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		service.mergePdf(buyer,true);
		return "redirect:buyHome";
	}
}
