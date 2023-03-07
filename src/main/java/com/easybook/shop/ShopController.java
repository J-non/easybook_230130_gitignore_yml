package com.easybook.shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.easybook.user.bo.UserBO;
import com.easybook.user.model.User;

@RequestMapping("/shop")
@Controller
public class ShopController {
	
	@Autowired
	private AladdinApiBO aladdinApiBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private ShopBO shopBO;
	
	/**
	 * 상품상세 화면
	 * @param model
	 * @param itemId
	 * @return
	 */
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
	
	/**
	 * 장바구니 화면
	 * @param model
	 * @param session
	 * @return
	 */
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
			nonMemberId = (Integer)session.getAttribute("nonMemberId");
		}
		List<CartView> cartViewList = shopBO.generateCartViewList(userId, nonMemberId);
		model.addAttribute("cartViewList", cartViewList);
		
		return "template/layout";
	}
	
	/**
	 * 구매 화면
	 * @param model
	 * @param cartIdList1
	 * @param cartIdList2
	 * @param session
	 * @return
	 */
	@GetMapping("/order_view")
	public String orderView(
			Model model
			, @RequestParam(value="cartIdList[]", required=false) List<Integer> cartIdList1
			, @RequestParam(value="cartIdList", required=false) List<Integer> cartIdList2
			, HttpSession session) {
		model.addAttribute("viewName", "shop/order");
		Integer userId = null;
		Integer nonMemberId = null;
		if ((Integer)session.getAttribute("userId") != null) {
			userId = (Integer)session.getAttribute("userId");
			User user = userBO.getUserById(userId);
			model.addAttribute("user", user);
		}
		if ((Integer)session.getAttribute("nonMemberId") != null) {
			nonMemberId = (Integer)session.getAttribute("nonMemberId");
		}
		List<Integer> cartIdList = new ArrayList<>();
		List<CartView> cartViewList = new ArrayList<>();
		if (cartIdList1 != null) {
			cartIdList = cartIdList1;
		} else if (cartIdList2 !=null) {
			cartIdList = cartIdList2;
		} else if (cartIdList1 == null && cartIdList2 == null) {
			cartViewList = shopBO.generateCartViewList(userId, nonMemberId);
			model.addAttribute("cartViewList", cartViewList);
			return "template/layout";
		}
		
		cartViewList = shopBO.generateCartViewListByCartId(cartIdList);
		model.addAttribute("cartViewList", cartViewList);
		return "template/layout";
	}
	
	/**
	 * 구매완료 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/complete_view")
	public String completeView(
			Model model) {
		model.addAttribute("viewName", "shop/orderComplete");
		
		return "template/layout";
	}
	
}
