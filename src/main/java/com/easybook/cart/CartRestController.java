package com.easybook.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.easybook.cart.bo.CartBO;
import com.easybook.cart.bo.CartServiceBO;
import com.easybook.product.bo.ProductBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/cart")
@RestController
public class CartRestController {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private CartBO cartBO;
	
	@Autowired
	private CartServiceBO cartServiceBO;
	
	@PostMapping("/create")
	public Map<String, Object> createCart(
			@RequestParam("itemId") int itemId
			, @RequestParam("title") String title
			, @RequestParam("author") String author
			, @RequestParam("publisher") String publisher
			, @RequestParam("priceStandard") int priceStandard
			, @RequestParam("priceSales") int priceSales
			, @RequestParam("pubDate") String pubDate
			, @RequestParam("coverImgUrl") String coverImgUrl
			, @RequestParam("productCount") int productCount
			, HttpSession session) {
		Integer userId = null;
		if ((Integer)session.getAttribute("userId") != null) {
			userId = (Integer)session.getAttribute("userId");
		}
		Integer nonMemberId = null;
		if ((Integer)session.getAttribute("nonMemberId") != null) {
			nonMemberId = (Integer)session.getAttribute("nonMemberId");
		}
		
		Map<String, Object> result = new HashMap<>();
		int check = cartServiceBO.insertCart(userId, nonMemberId, itemId, title, author, publisher, priceStandard, priceSales, pubDate, coverImgUrl, productCount);
		if (check == 1) {
			result.put("code", 1);
		} else if (check == 500) {
			result.put("code", 500);
			result.put("errorMessage", "상품을 장바구니에 담는데 실패했습니다.");
		}
		
		return result;
	}
	
	@PostMapping("/update")
	public Map<String, Object> updateCart(
			@RequestParam("productIdList[]") List<Integer> productIdList
			, @RequestParam("productCountList[]") List<Integer> productCountList
			, HttpSession session) {
		Integer userId = null;
		if ((Integer)session.getAttribute("userId") != null) {
			userId = (Integer)session.getAttribute("userId");
		}
		Integer nonMemberId = null;
		if ((Integer)session.getAttribute("nonMemberId") != null) {
			nonMemberId = (Integer)session.getAttribute("nonMemberId");
		}
		
		Map<String, Object> result = new HashMap<>();
		boolean updateResult = cartServiceBO.updateCart(userId, nonMemberId, productIdList, productCountList);
		if (updateResult) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "업데이트 실패. 관리자에게 문의하세요.");
		}
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> deleteCart(
			@RequestParam(value="cartId", required=false) Integer cartId
			, HttpSession session) {
		Integer userId = null;
		if ((Integer)session.getAttribute("userId") != null) {
			userId = (Integer)session.getAttribute("userId");
		}
		Integer nonMemberId = null;
		if ((Integer)session.getAttribute("nonMemberId") != null) {
			nonMemberId = (Integer)session.getAttribute("nonMemberId");
		}
		
		Map<String, Object> result = new HashMap<>();
		if (cartId == null) {
			int row = cartBO.deleteCartByUserIdNonMemberId(userId, nonMemberId);
			if (row > 0) {
				result.put("code", 1);
			} else {
				result.put("code", 500);
				result.put("errorMessage", "장바구니 비우기 실패. 관리자에게 문하세요.");
			}
		} else {
			int row = cartBO.deleteCartById(cartId);
			if (row > 0) {
				result.put("code", 1);
			} else {
				result.put("code", 500);
				result.put("errorMessage", "삭제 실패. 관리자에게 문하세요.");
			}
		}
		return result;
	}
}
