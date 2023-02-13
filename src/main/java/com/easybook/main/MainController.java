package com.easybook.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybook.api.bo.AladdinApiBO;
import com.easybook.api.model.Book;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@Autowired
	private AladdinApiBO aladdinApiBO;
	
	@GetMapping("/home")
	public String mainView(
			Model model
			) {
		model.addAttribute("viewName", "main/home");
		
		List<Book> newBookList = aladdinApiBO.getItemNewAll("5", "1");
		model.addAttribute("newBookList", newBookList);
		
		List<Book> korBookList = aladdinApiBO.getKorBook("5", "1", "0");
		model.addAttribute("korBookList", korBookList);
		
		List<Book> foreginBookList = aladdinApiBO.getForeignBook("5", "1", "0");
		model.addAttribute("foreginBookList", foreginBookList);
		
		return "template/layout";
	}
	
	@GetMapping("/kor_books")
	public String korBooks(
			Model model
			, String start
			, @RequestParam(value="categoryId", required=false) String categoryId
			, @RequestParam(value="categoryName", required=false) String categoryName) {
		model.addAttribute("viewName", "main/korBooks");
		
		List<Book> korBookList = aladdinApiBO.getKorBook("8", "1", categoryId);
		model.addAttribute("korBookList", korBookList);
		
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("categoryName", categoryName);
		
		return "template/layout";
	}
	
	@GetMapping("/new_books")
	public String newBooks(Model model) {
		model.addAttribute("viewName", "main/newBooks");
		
		List<Book> newBookList = aladdinApiBO.getItemNewAll("8", "1");
		model.addAttribute("newBookList", newBookList);
		
		return "template/layout";
	}
	
	@GetMapping("/foreign_books")
	public String foreignBooks(
			Model model
			, @RequestParam(value="categoryId", required=false) String categoryId
			, @RequestParam(value="categoryName", required=false) String categoryName) {
		model.addAttribute("viewName", "main/foreignBooks");
		
		List<Book> foreignBookList = aladdinApiBO.getForeignBook("8", "1", categoryId);
		model.addAttribute("foreignBookList", foreignBookList);
		
		model.addAttribute("categoryName", categoryName);
		
		return "template/layout";
	}
}
