package com.easybook.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybook.api.bo.AladdinApiBO;
import com.easybook.api.model.Book;

@RequestMapping("/search")
@Controller
public class SearchController {
	
	@Autowired
	private AladdinApiBO aladdinApiBO;
	
	/**
	 * 상품 검색 API
	 * @param model
	 * @param searchTarget
	 * @param query
	 * @return
	 */
	@GetMapping("/search_result")
	public String search(
			Model model
			, @RequestParam("searchTarget") String searchTarget
			, @RequestParam("query") String query) {
		model.addAttribute("viewName", "search/searchResult");
		
		List<Book> searchResultList = aladdinApiBO.searchBook("8", "1", searchTarget, query);
		model.addAttribute("searchResultList", searchResultList);
		model.addAttribute("searchTarget", searchTarget);
		
		return "template/layout";
	}
	
}
