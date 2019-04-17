package com.example.demo.ebook.service.chapter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.ebook.model.book.Book;
import com.example.demo.ebook.model.chapter.Chapter;

@Service
public interface ChapterService {
	int saveChapters(ArrayList<String> names, ArrayList<String> keywords, ArrayList<String> Description,
			ArrayList<Integer> price, ArrayList<Integer> startPage, ArrayList<Integer> endPage, Book book)
			throws IOException;

	String cutPdf(int startPage, int endPage, String source, String dest, boolean image_flag, boolean chapter_preview_flag) throws IOException;

	List<Chapter> getChaptersByBook(Book book);

	void saveChapter(Chapter chapter);
	Chapter getChapterById(int id);

	List<Chapter> getChapterByBookId(Book book);
	
	String previewChapter(String loc);
}
