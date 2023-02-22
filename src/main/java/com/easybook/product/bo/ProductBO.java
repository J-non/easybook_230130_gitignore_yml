package com.easybook.product.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.product.dao.ProductDAO;
import com.easybook.product.model.Product;

@Service
public class ProductBO {

	@Autowired
	private ProductDAO productDAO;

	public boolean existProduct(int itemId) {
		return productDAO.existProduct(itemId);
	}

	/*
	 * public int addProduct(int itemId, String title, String author, String
	 * publisher, int priceStandard, int priceSales, String pubDate, String
	 * coverImgUrl) { return productDAO.insertProduct(itemId, title, author,
	 * publisher, priceStandard, priceSales, pubDate, coverImgUrl); }
	 */
	
	public void addProduct(int itemId, String title, String author, String publisher, int priceStandard, int priceSales,
			String pubDate, String coverImgUrl) {
		productDAO.insertProduct(itemId, title, author, publisher, priceStandard, priceSales, pubDate, coverImgUrl);
	}
	
	public Product getProductById(int productId) {
		return productDAO.selectProductById(productId);
	}

	public Product getProductByItemId(int itemId) {
		return productDAO.selectProductByItemId(itemId);
	}
}
