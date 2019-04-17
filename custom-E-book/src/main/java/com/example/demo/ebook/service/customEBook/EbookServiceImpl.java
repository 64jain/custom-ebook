package com.example.demo.ebook.service.customEBook;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.swing.text.DefaultEditorKit.CutAction;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.FileUtils;
import org.apache.pdfbox.multipdf.PDFMergerUtility;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.fit.pdfdom.PDFDomTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.buyer.Buyer;
import com.example.demo.ebook.model.chapter.Chapter;
import com.example.demo.ebook.model.customEBook.CustomEBook;
import com.example.demo.ebook.model.payment.Payment;
import com.example.demo.ebook.repository.book.BookRepository;
import com.example.demo.ebook.repository.chapter.ChapterRepository;
import com.example.demo.ebook.repository.customEBook.EbookRepository;
import com.example.demo.ebook.repository.payment.paymentRepository;

@Service
public class EbookServiceImpl implements EbookService{
	@Autowired
	EbookRepository repository;
	@Autowired
	BookRepository book_repository;
	@Autowired
	ChapterRepository chap_repository;
	@Autowired
	EbookRepository ebook_repository;
	@Autowired
	paymentRepository payment_repository;
	// CustomEBook ebook;
	// Chapter chapter;

	@Override
	public List<CustomEBook> showContent(Buyer buyer)
	{
		List<CustomEBook> ebooks=repository.findByBuyerOrderBySequence(buyer);
		return ebooks;	
	}
	@Override
	public void deleteChapter(int id)
	{
		List<CustomEBook> ebooks=repository.findById(id);
		CustomEBook ebook=ebooks.get(0);
		repository.delete(ebook);
	}
	@Override
	public int updateEbook(List<Integer>ebookid,List<Integer>sequence)
	{ 	int i;
		for( i=0;i<ebookid.size();i++)
		{
			int id=((Integer)ebookid.get(i)).intValue();
			int seq=((Integer)sequence.get(i)).intValue();
			List<CustomEBook> ebooks=repository.findById(id);
			CustomEBook b=(CustomEBook)ebooks.get(0);
			b.setSequence(seq);
			repository.save(b);
		}
		if(i==ebookid.size())
			return 1;
		else return 0;
	}
	@Override
	public void deleteContentAfterSave(Buyer buyer)
	{
		List<CustomEBook> ebooks=repository.findByBuyerOrderBySequence(buyer);
		for(int i=0;i<ebooks.size();i++)
		{
			CustomEBook ebook=ebooks.get(i);
			repository.delete(ebook);
		}
	}
	
	@Override
	public void savePaymentContent(String name,String email,Buyer buyer,String price,String addr,String copy_type,String paymentMethod)
	{
		Payment payment=new Payment();
		payment.setName(name);
		payment.setEmail(email);
		payment.setBuyer(buyer);
		payment.setBuyer_addr(addr);
		if(copy_type.equals("HardCopy"))
			payment.setHardCopy(true);
		else
			payment.setHardCopy(false);
		payment.setPrice(Double.parseDouble(price));
		payment.setPayment_method(paymentMethod);
		payment_repository.save(payment);
	}
	
	public List<Book> getBooks(String keywords) {
		String[] keywordList = keywords.split(" ");
		List<Book> books = new ArrayList<>();
		Set<Book> books_set = new LinkedHashSet<>();
		for (String keyword : keywordList) {
			List<Book> books_temp = book_repository.findByKeywordsContaining(keyword);
			if (books_temp != null)
				books_set.addAll(books_temp);
		}
		books.addAll(books_set);
		if (books.size() == 0)
			return null;
		else
			return books;
	}

	@Override
	public List<Chapter> getChapters(String keywords) {
		String[] keywordList = keywords.split(" ");
		List<Chapter> chapters = new ArrayList<>();
		Set<Chapter> chapters_set = new LinkedHashSet<>();
		for (String keyword : keywordList) {
			List<Chapter> chapters_temp = chap_repository.findByKeywordsContaining(keyword);
			if (chapters_temp != null)
				chapters_set.addAll(chapters_temp);
		}
		chapters.addAll(chapters_set);
		if (chapters.size() == 0)
			return null;
		else
			return chapters;
	}

	@Override
	public int saveEBook(List<Integer> books_id, List<Integer> chapters_id, Buyer buyer) {
		int sequence = 1;
		if (books_id != null) {
			List<Book> books = book_repository.findByIdIn(books_id);
			for (Book book : books) {
				CustomEBook eBook = new CustomEBook();
				eBook.setBuyer(buyer);
				eBook.setBook(book);
				eBook.setSequence(sequence);
				sequence++;
				ebook_repository.save(eBook);
			}
		}
		if (chapters_id != null) {
			List<Chapter> chapters = chap_repository.findByIdIn(chapters_id);
			for (Chapter chapter : chapters) {
				CustomEBook eBook = new CustomEBook();
				eBook.setBuyer(buyer);
				eBook.setChapter(chapter);
				eBook.setSequence(sequence);
				sequence++;
				ebook_repository.save(eBook);
			}
		}
		return 0;
	}
	@Override
	public void generateHTMLFromPDF(String filename) throws IOException {
//		PDDocument pdf = PDDocument.load(new File(filename));
//	    Writer output = new PrintWriter("/home/ankit/pdf.html", "utf-8");
//	    try {
//			new PDFDomTree().writeText(pdf, output);
//		} catch (ParserConfigurationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	     
//	    output.close();
//		
		 //Load the PDF file
//        PdfDocument pdf = new PdfDocument();
//        pdf.loadFromFile(filename);
//        //Save to HTML format
//        pdf.saveToFile("/home/ankit/ToHTML.html", FileFormat.HTML);
	}
	@Override
	public void mergePdf(Buyer buyer,boolean preview) {
		// TODO Auto-generated method stub
		String homeDir = System.getProperty("user.home");
		System.out.println(homeDir);
		String buyerDir = null;
		if(preview)
			buyerDir = homeDir+"/ebooks/buyer_"+buyer.getId()+"/preview";
		else {
			buyerDir=homeDir+"/ebooks/buyer_"+buyer.getId()+"/Books";
		}
		int noOfFiles=1;
		File buyerDirFile = new File(buyerDir);
		if(!buyerDirFile.getParentFile().isDirectory())
		{
			buyerDirFile.getParentFile().mkdirs();
		}
		if(buyerDirFile.isDirectory())
		{
			noOfFiles = buyerDirFile.listFiles().length + 1;
		}
		else
		{
			buyerDirFile.mkdirs();
		}
		String destination = buyerDir +"/custom_book_"+noOfFiles+".pdf" ;
		if(preview) {
			destination = buyerDir +"/custom_book_preview.pdf";
		}
		String customPagePath=null;
		List<CustomEBook> eBooks = ebook_repository.findByBuyerOrderBySequence(buyer);
		PDFMergerUtility merger = new PDFMergerUtility();
		merger.setDestinationFileName(destination);
		int i=1;
		for(CustomEBook eBook:eBooks)
		{
			Chapter chapter = eBook.getChapter();
			Book book = eBook.getBook();
			String loc=null;
			try {
				customPagePath = createPage(chapter,book,i);
				merger.addSource(customPagePath);
				if(chapter!=null)
				{
					if(preview)
					{
						String loc_temp = chapter.getLoc();
						loc=loc_temp.substring(0, loc_temp.length()-4)+"_preview.pdf";
					}
					else
					{
						loc=chapter.getLoc();
					}
					merger.addSource(loc);
				}
				else
				{
					if(preview)
					{
						String loc_temp = book.getBookLoc();
						loc=loc_temp.substring(0, loc_temp.length()-4)+"_preview.pdf";
					}
					else
					{
						loc=book.getBookLoc();
					}
					merger.addSource(loc);
				}
				
			} catch (IOException e) {
				// TODO: handle exception
			}
			i++;
		}
		try {
			merger.mergeDocuments(null);
			FileUtils.cleanDirectory(new File(customPagePath).getParentFile());
//			File[] files = new File(customPagePath).getParentFile().listFiles();
//			if(files!=null)
//			{
//				
//				for(File file:files)
//				{
//					file.delete();
//				}
//			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String createPage(Chapter chapter,Book book,int i) throws IOException
	{
		String pageContent=null;
		if(chapter!=null) {
			pageContent = "Book Name:"+chapter.getBook().getBookName()+"Description:"+
								chapter.getDescription();
		}
		else {
			pageContent = "Book Name:"+book.getBookName()+"Description:"+book.getDescription();
		}
		String filepath = System.getProperty("user.home")+"/ebooks/temp/custom_page_"+i+".pdf";
		File file = new File(filepath).getParentFile();
		if(!file.isDirectory())
		{
			file.mkdirs();
		}
		PDDocument doc = new PDDocument();
        try {
            PDPage page = new PDPage();
            doc.addPage(page);
            
            PDFont font = PDType1Font.HELVETICA_BOLD;
 
            PDPageContentStream contents = new PDPageContentStream(doc, page);
            contents.beginText();
            contents.setFont(font, 10);
            contents.newLine();
            contents.showText(pageContent);
            contents.newLine();
            contents.setFont(font, 10);
            contents.showText("This is demo text");
            contents.endText();
            contents.close();
            
            doc.save(filepath);
        }
        finally {
            doc.close();
        } 
		return filepath;
	}
 
	/*
	 * @Override public String customizeContent(Buyer
	 * buyer,List<Chapter>chapters,int ebookid) {
	 * 
	 * 
	 * return "ebook content updated"; }
	 */

}
