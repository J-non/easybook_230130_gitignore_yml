package com.easybook.shop.model;

import com.easybook.cart.model.Cart;
import com.easybook.product.model.Product;

public class CartView {
	
	private Product product;
	private Cart cart;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
