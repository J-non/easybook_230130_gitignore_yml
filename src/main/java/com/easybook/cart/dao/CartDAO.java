package com.easybook.cart.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.cart.model.Cart;

@Repository
public interface CartDAO {
	
	public int insertCart(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("productId") int productId,
			@Param("productCount") int productCount);
	
	public boolean existCartByUserIDNonMemberIDProductId(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("productId") int productId);
	
	public Cart selectCartByUserIDNonMemberIDProductId(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("productId") int productId);
	
	public int updateCartByUserIDNonMemberIDProductId(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("productId") int productId,
			@Param("productCount") int productCount);
	
}
