package com.easybook.shop.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.cart.bo.CartBO;
import com.easybook.cart.model.Cart;
import com.easybook.product.bo.ProductBO;
import com.easybook.product.model.Product;
import com.easybook.shop.model.CartView;

@Service
public class ShopBO {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private CartBO cartBO;
	
	public List<CartView> generateCartViewList(Integer UserId, Integer nonMemberId) {
		List<CartView> cartViewList = new ArrayList<>();
		List<Cart> cartList = cartBO.getCartListByUserIDNonMemberID(UserId, nonMemberId);
		
		for (Cart cart : cartList) {
			CartView cartView = new CartView();
			
			Product product = productBO.getProductById(cart.getProductId());
			
			cartView.setCart(cart);
			cartView.setProduct(product);
			
			cartViewList.add(cartView);
		}
		
		return cartViewList;
	}
	
}
