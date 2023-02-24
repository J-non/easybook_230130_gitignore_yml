package com.easybook.cart.bo;

import java.util.List;

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
	
	public List<Cart> getCartListByUserIDNonMemberID(Integer userId, Integer nonMemberId) {
		return cartDAO.selectCartListByUserIDNonMemberID(userId, nonMemberId);
	}
	
	public List<Cart> getCartListById(List<Integer> cartIdList) {
		return cartDAO.selectCartListById(cartIdList);
	}
	
	public List<Cart> getCartListByIdUserIDNonMemberID(Integer cartId, Integer userId, Integer nonMemberId) {
		return cartDAO.selectCartListByIdUserIDNonMemberID(cartId, userId, nonMemberId);
	}
	
	public Cart getCartByUserIDNonMemberIDProductId(Integer userId, Integer nonMemberId, int productId) {
		return cartDAO.selectCartByUserIDNonMemberIDProductId(userId, nonMemberId, productId);
	}
	
	public int updateCartByUserIDNonMemberIDProductId(Integer userId, Integer nonMemberId, int productId, int productCount) {
		return cartDAO.updateCartByUserIDNonMemberIDProductId(userId, nonMemberId, productId, productCount);
	}
	
	public void updateCartByIdUserIDNonMemberID(Integer cartId, Integer userId, Integer nonMemberId, int productCount) {
		cartDAO.updateCartByUserIDNonMemberIDProductId(cartId, userId, nonMemberId, productCount);
	}
	
	// 선택 삭제
	public int deleteCartById(int id) {
		return cartDAO.deleteCartById(id);
	}
	
	// 장바구니 비우기
	public int deleteCartByUserIdNonMemberId(Integer userId, Integer nonMemberId) {
		return cartDAO.deleteCartByUserIdNonMemberId(userId, nonMemberId);
	}
}
