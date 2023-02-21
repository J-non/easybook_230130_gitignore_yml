package com.easybook.cart.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.cart.dao.CartDAO;
import com.easybook.cart.model.Cart;

@Service
public class CartBO {
	
	@Autowired
	private CartDAO cartDAO;
	
	public int addCart(Integer userId, Integer nonMemberId, int productId, int productCount) {
		return cartDAO.insertCart(userId, nonMemberId, productId, productCount);
	}
	
	public boolean existCartByUserIDNonMemberIDProductId(Integer userId, Integer nonMemberId, int productId) {
		return cartDAO.existCartByUserIDNonMemberIDProductId(userId, nonMemberId, productId);
	}
	
	public Cart getCartByUserIDNonMemberIDProductId(Integer userId, Integer nonMemberId, int productId) {
		return cartDAO.selectCartByUserIDNonMemberIDProductId(userId, nonMemberId, productId);
	}
	
	public int updateCartByUserIDNonMemberIDProductId(Integer userId, Integer nonMemberId, int productId, int productCount) {
		return cartDAO.updateCartByUserIDNonMemberIDProductId(userId, nonMemberId, productId, productCount);
	}
	
}
