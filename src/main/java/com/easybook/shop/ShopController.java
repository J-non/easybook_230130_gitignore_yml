package com.easybook.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybook.api.bo.AladdinApiBO;
import com.easybook.api.model.Book;
import com.easybook.comment.bo.CommentBO;
import com.easybook.comment.model.CommentView;

@RequestMapping("/shop")
@Controller
public class ShopController {
	
	@Autowired
	private AladdinApiBO aladdinApiBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@GetMapping("/detail_view")
	public String detailView(
			Model model
			, @RequestParam("itemId") int itemId) {
		model.addAttribute("viewName", "shop/detail");
		
		Book book = aladdinApiBO.detailBook(itemId);
		model.addAttribute("book", book);
		
		List<CommentView> commentViewList = commentBO.generateCommentViewByItemId(itemId);
		model.addAttribute("commentViewList", commentViewList);
		
		return "template/layout";
	}
	
	@GetMapping("/cart_view")
	public String cartView(
			Model model) {
		model.addAttribute("viewName", "shop/cart");
		
		return "template/layout";
	}
	
}
