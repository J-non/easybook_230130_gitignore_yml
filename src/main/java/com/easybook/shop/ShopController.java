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
import com.easybook.shop.bo.ShopBO;
import com.easybook.shop.model.CartView;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/shop")
@Controller
public class ShopController {
	
	@Autowired
	private AladdinApiBO aladdinApiBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private ShopBO shopBO;
	
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
			Model model
			, HttpSession session) {
		model.addAttribute("viewName", "shop/cart");
		Integer userId = null;
		Integer nonMemberId = null;
		if ((Integer)session.getAttribute("userId") != null) {
			userId = (Integer)session.getAttribute("userId");
		}
		if ((Integer)session.getAttribute("nonMemberId") != null) {
			userId = (Integer)session.getAttribute("usernonMemberIdId");
		}
		
		List<CartView> cartViewList = shopBO.generateCartViewList(userId, nonMemberId);
		model.addAttribute("cartViewList", cartViewList);
		
		return "template/layout";
	}
	
	@GetMapping("/order_view")
	public String orderView(
			Model model) {
		model.addAttribute("viewName", "shop/order");
		
		return "template/layout";
	}
}
