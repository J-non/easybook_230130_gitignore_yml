package com.easybook.cart.dao;

import java.util.List;

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
	
	public List<Cart> selectCartListByUserIDNonMemberID(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId);
	
	public List<Cart> selectCartListById(
			@Param("cartIdList") List<Integer> cartIdList);
	
	public List<Cart> selectCartListByIdUserIDNonMemberID(
			@Param("cartId") Integer cartId,
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId);
	
	public Cart selectCartByUserIDNonMemberIDProductId(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("productId") int productId);
	
	public int updateCartByUserIDNonMemberIDProductId(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("productId") int productId,
			@Param("productCount") int productCount);
	
	public void updateCartByIdUserIDNonMemberID(
			@Param("cartId") Integer cartId,
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId,
			@Param("productCount") int productCount);
	
	public int deleteCartById(int id);
	
	public int deleteCartByUserIdNonMemberId(
			@Param("userId") Integer userId,
			@Param("nonMemberId") Integer nonMemberId);
}
