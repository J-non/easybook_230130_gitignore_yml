package com.easybook.cart.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.cart.model.Cart;
import com.easybook.product.bo.ProductBO;
import com.easybook.product.model.Product;

@Service
public class CartServiceBO {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private CartBO cartBO;
	
	public int insertCart(Integer userId, Integer nonMemberId, int itemId, String title, String author, String publisher
			, int priceStandard, int priceSales, String pubDate, String coverImgUrl, int productCount) {
		int result = 0;
		boolean existProduct = productBO.existProduct(itemId);
		if (existProduct) {
			Product product = productBO.getProductByItemId(itemId);
			
			//장바구니에 이미 담겨있는 상품인지 확인
			boolean existCart = cartBO.existCartByUserIDNonMemberIDProductId(userId, nonMemberId, product.getId());
			if (existCart) {
				Cart cart = cartBO.getCartByUserIDNonMemberIDProductId(userId, nonMemberId, product.getId());
				productCount += cart.getProductCount();
				int row1 = cartBO.updateCartByUserIDNonMemberIDProductId(userId, nonMemberId, product.getId(), productCount);
				if (row1 > 0) {
					result = 1;
				} else {
					result = 500;
				}
				return result;
			} //장바구니에 이미 담겨있는 상품인지 확인 끝
			
			int row2 = cartBO.addCart(userId, nonMemberId, product.getId(), productCount);
			if (row2 > 0) {
				result = 1;
			} else {
				result = 500;
			}
			return result;
		} else {
			productBO.addProduct(itemId, title, author, publisher, priceStandard, priceSales, pubDate, coverImgUrl);
			Product product = productBO.getProductByItemId(itemId);
			int row2 = cartBO.addCart(userId, nonMemberId, product.getId(), productCount);
			if (row2 > 0) {
				result = 1;
			} else {
				result = 500;
			}
		}
		return result;
	}
	
	
	public boolean updateCart(Integer userId, Integer nonMemberId, List<Integer> productIdList, List<Integer> productCountList) {
		Boolean updateResult = null;
		int i = 0;
		for (Integer productCount : productCountList) {
			int row = cartBO.updateCartByUserIDNonMemberIDProductId(userId, nonMemberId, productIdList.get(i), productCount);
			if (row > 0) {
				updateResult = true;
			} else {
				updateResult = false;
			}
			i++;
		}
		if (updateResult) {
			return updateResult;
		} else {
			return updateResult;
		}
	}
	
}
