package com.easybook.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybook.api.bo.AladdinApiBO;
import com.easybook.api.model.Book;

@RequestMapping("/shop")
@Controller
public class ShopController {
	
	@Autowired
	private AladdinApiBO aladdinApiBO;
	
	@GetMapping("detail_view")
	public String detailView(
			Model model
			, @RequestParam("itemId") String itemId) {
		model.addAttribute("viewName", "shop/detail");
		
		Book book = aladdinApiBO.detailBook(itemId);
		model.addAttribute("book", book);
		
		return "template/layout";
	}
	
}
