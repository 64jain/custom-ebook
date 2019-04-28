package com.example.demo.ebook.service.customEBook;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.swing.table.TableStringConverter;
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
public class EbookServiceImpl implements EbookService {
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
	public List<CustomEBook> showContent(Buyer buyer) {
		List<CustomEBook> ebooks = repository.findByBuyerOrderBySequence(buyer);
		return ebooks;
	}

	@Override
	public void deleteChapter(int id) {
		List<CustomEBook> ebooks = repository.findById(id);
		CustomEBook ebook = ebooks.get(0);
		repository.delete(ebook);
	}

	@Override
	public int updateEbook(List<Integer> ebookid, List<Integer> sequence) {
		int i;
		for (i = 0; i < ebookid.size(); i++) {
			int id = ((Integer) ebookid.get(i)).intValue();
			int seq = ((Integer) sequence.get(i)).intValue();
			List<CustomEBook> ebooks = repository.findById(id);
			CustomEBook b = (CustomEBook) ebooks.get(0);
			b.setSequence(seq);
			repository.save(b);
		}
		if (i == ebookid.size())
			return 1;
		else
			return 0;
	}

	@Override
	public void deleteContentAfterSave(Buyer buyer) {
		List<CustomEBook> ebooks = repository.findByBuyerOrderBySequence(buyer);
		for (int i = 0; i < ebooks.size(); i++) {
			CustomEBook ebook = ebooks.get(i);
			repository.delete(ebook);
		}
	}

	@Override
	public void savePaymentContent(String name, String email, Buyer buyer, String price, String addr, String copy_type,
			String paymentMethod,String title) {
		Payment payment = new Payment();
		payment.setName(name);
		payment.setEmail(email);
		payment.setBuyer(buyer);
		payment.setBuyer_addr(addr);
		if (copy_type.equals("HardCopy"))
			payment.setHardCopy(true);
		else
			payment.setHardCopy(false);
		payment.setPrice(Double.parseDouble(price));
		payment.setPayment_method(paymentMethod);
		long millis=System.currentTimeMillis();  
		Date date=new Date(millis);  
		payment.setPurchaseDate(date);
		payment.setTitle(title);
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
		int sequence = (int) ebook_repository.countByBuyer(buyer);
		
		if (books_id != null) {
			List<Book> books = book_repository.findByIdIn(books_id);
			for (Book book : books) {
				CustomEBook eBook = new CustomEBook();
				eBook.setBuyer(buyer);
				eBook.setBook(book);
				sequence++;
				eBook.setSequence(sequence);
				ebook_repository.save(eBook);
			}
		}
		if (chapters_id != null) {
			List<Chapter> chapters = chap_repository.findByIdIn(chapters_id);
			for (Chapter chapter : chapters) {
				CustomEBook eBook = new CustomEBook();
				eBook.setBuyer(buyer);
				eBook.setChapter(chapter);
				sequence++;
				eBook.setSequence(sequence);
				
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
		// Load the PDF file
//        PdfDocument pdf = new PdfDocument();
//        pdf.loadFromFile(filename);
//        //Save to HTML format
//        pdf.saveToFile("/home/ankit/ToHTML.html", FileFormat.HTML);
	}

	@Override
	public void mergePdf(Buyer buyer, boolean preview, String title) {
		String homeDir = System.getProperty("user.home");
		System.out.println(homeDir);
		String buyerDir = null;
		if (preview)
			buyerDir = homeDir + "/ebooks/buyer_" + buyer.getId() + "/preview";
		else {
			buyerDir = homeDir + "/ebooks/buyer_" + buyer.getId() + "/Books";
		}
		int noOfFiles = 1;
		File buyerDirFile = new File(buyerDir);
		if (!buyerDirFile.getParentFile().isDirectory()) {
			buyerDirFile.getParentFile().mkdirs();
		}
		if (buyerDirFile.isDirectory()) {
			noOfFiles = buyerDirFile.listFiles().length + 1;
		} else {
			buyerDirFile.mkdirs();
		}
		// String destination = buyerDir +"/custom_book_"+noOfFiles+".pdf" ;
		if (title.equals("")) {
			title = "new_book_" + noOfFiles;
		}
		String destination = buyerDir + "/" + title + ".pdf";
		if (preview) {
			destination = buyerDir + "/custom_book_preview.pdf";
		}
		String customPagePath = null;
		List<CustomEBook> eBooks = ebook_repository.findByBuyerOrderBySequence(buyer);
		PDFMergerUtility merger = new PDFMergerUtility();
		merger.setDestinationFileName(destination);
		int i = 1;
		try {
			String coverPagePath = createCoverPage(eBooks, title);
			merger.addSource(coverPagePath);
			for (CustomEBook eBook : eBooks) {
				Chapter chapter = eBook.getChapter();
				Book book = eBook.getBook();
				String loc = null;

				customPagePath = createPage(chapter, book, i);
				merger.addSource(customPagePath);
				if (chapter != null) {
					if (preview) {
						String loc_temp = chapter.getLoc();
						loc = loc_temp.substring(0, loc_temp.length() - 4) + "_preview.pdf";
					} else {
						loc = chapter.getLoc();
					}
					merger.addSource(loc);
				} else {
					if (preview) {
						String loc_temp = book.getBookLoc();
						loc = loc_temp.substring(0, loc_temp.length() - 4) + "_preview.pdf";
					} else {
						loc = book.getBookLoc();
					}
					merger.addSource(loc);
				}

				i++;
			}
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

	public String createPage(Chapter chapter, Book book, int i) throws IOException {
		String pageContent1 = null, pageContent2 = null;
		PDFont font = PDType1Font.HELVETICA_BOLD;
		int fontSize = 25;
		int marginTop = 20;
		float titleWidth;
		float titleHeight = font.getFontDescriptor().getFontBoundingBox().getHeight() / 1000 * fontSize;
		if (chapter != null) {
			pageContent1 = "Book Name: " + chapter.getBook().getBookName();
			pageContent2 = "Description: " + chapter.getDescription();
		} else {
			pageContent1 = "Book Name:" + book.getBookName();
			pageContent2 = "Description:" + book.getDescription();
		}
		String filepath = System.getProperty("user.home") + "/ebooks/temp/custom_page_" + i + ".pdf";
		titleWidth = font.getStringWidth(pageContent1) / 1000 * fontSize;
		File file = new File(filepath).getParentFile();
		if (!file.isDirectory()) {
			file.mkdirs();
		}
		PDDocument doc = new PDDocument();
		try {
			PDPage page = new PDPage();
			float startX = page.getMediaBox().getUpperRightX();
			float startY = page.getMediaBox().getUpperRightY();
			System.out.println(startX + "-" + startY);
			doc.addPage(page);

			PDPageContentStream contents = new PDPageContentStream(doc, page);
			// contents.moveTo((page.getMediaBox().getWidth() - titleWidth) / 2,
			// page.getMediaBox().getHeight() - marginTop - titleHeight);
			contents.beginText();
			contents.setNonStrokingColor(Color.BLUE);
			contents.setFont(font, fontSize);
			contents.setLeading(25.5f);
			contents.newLineAtOffset((startX - titleWidth) / 2, (startY - marginTop - titleHeight) / 2);
			if (chapter != null) {
				contents.showText("Chapter Name: " + chapter.getName());
				contents.newLine();
			}
			// contents.moveTo((page.getMediaBox().getWidth() - titleWidth) / 2,
			// page.getMediaBox().getHeight() - marginTop - 3*titleHeight);
			contents.showText(pageContent1);
			contents.newLine();
			// contents.moveTo((page.getMediaBox().getWidth() - titleWidth) / 2,
			// page.getMediaBox().getHeight() - marginTop - 6*titleHeight);
			contents.showText(pageContent2);
			contents.endText();
			contents.close();

			doc.save(filepath);
		} finally {
			doc.close();
		}
		return filepath;
	}

	public String createCoverPage(List<CustomEBook> eBooks, String title) throws IOException {
		String filepath = System.getProperty("user.home") + "/ebooks/temp/cover_page.pdf";
		PDFont font = PDType1Font.HELVETICA_BOLD;
		int fontSize = 20;
		int marginTop = 20;
//		float titleWidth;
//		float titleHeight = font.getFontDescriptor().getFontBoundingBox().getHeight() / 1000 * fontSize;
//		titleWidth = font.getStringWidth(pageContent1) / 1000 * fontSize;
		PDDocument doc = new PDDocument();
		try {
			PDPage page = new PDPage();
			float startX = page.getMediaBox().getUpperRightX();
			float startY = page.getMediaBox().getUpperRightY();
			System.out.println(startX + "-" + startY);
			doc.addPage(page);

			PDPageContentStream contents = new PDPageContentStream(doc, page);
			// contents.moveTo((page.getMediaBox().getWidth() - titleWidth) / 2,
			// page.getMediaBox().getHeight() - marginTop - titleHeight);
			//contents.lineTo(25,700);
			contents.beginText();
			contents.setNonStrokingColor(Color.BLUE);
			contents.setFont(font, fontSize);
			contents.setLeading(22.5f);
			contents.newLineAtOffset(25, 650);
			contents.showText(title);
			contents.newLine();
			contents.showText("-------------------------------------------------------------------------");
			contents.newLine();
			for (CustomEBook eBook : eBooks) {
				Chapter chapter = eBook.getChapter();
				Book book = eBook.getBook();
				if (chapter != null) {
					contents.showText("Chapter Name:" + chapter.getName());
					contents.newLine();
					contents.showText("Referenced Book:" + chapter.getBook().getBookName());
					contents.newLine();
				} else {
					contents.showText("Book Name:" + book.getBookName());
					contents.newLine();
				}
				contents.showText("-------------------------------------------------------------------------");
				contents.newLine();
			}

			contents.endText();
			contents.close();

			doc.save(filepath);
		} finally {
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
