package com.example.demo.ebook.service.chapter;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.ebook.model.book.Book;
public class ChapterFileUpload {
	@Autowired
	ChapterService service;
	public void parseCsv(String csvFile,Book book) throws IOException{
	ArrayList<String> names = new ArrayList<>(); 
	ArrayList<String> keywords = new ArrayList<>();
	ArrayList<String> Description = new ArrayList<>();
	ArrayList<Double> price = new ArrayList<>();
	ArrayList<Integer> startPage = new ArrayList<>(); 
	ArrayList<Integer> endPage = new ArrayList<>();
	try (
            Reader reader = Files.newBufferedReader(Paths.get(csvFile));
            CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT
                    .withFirstRecordAsHeader()
                    .withIgnoreHeaderCase()
                    .withTrim());
        )
	{
        for (CSVRecord csvRecord : csvParser) {
            // Accessing values by Header names
            String name = csvRecord.get("Name");
            String keyword = csvRecord.get("keywords");
            String description = csvRecord.get("description");
            String Price = csvRecord.get("price");
            String start_page = csvRecord.get("startPage");
            String end_page = csvRecord.get("endPage");
            
            names.add(name);
            keywords.add(keyword);
            Description.add(description);
            price.add(Double.parseDouble(Price));
            startPage.add(Integer.parseInt(start_page));
            endPage.add(Integer.parseInt(end_page));
            
            System.out.println("Record No - " + csvRecord.getRecordNumber());
            System.out.println("---------------");
            System.out.println("Name : " + name);
            System.out.println("keywords : " + keyword);
            System.out.println("Desc : " + description);
            System.out.println("Price : " + Price);
            System.out.println("---------------\n\n");
        }
       }
	//ChapterServiceImpl service = new ChapterServiceImpl();
	int x= service.saveChapters(names, keywords, Description, price, startPage, endPage, book);
    System.out.println(x);
	}
}
