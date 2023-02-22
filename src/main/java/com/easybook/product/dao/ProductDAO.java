package com.easybook.product.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.product.model.Product;

@Repository
public interface ProductDAO {
	
	public boolean existProduct(int itemId);
	
	public void insertProduct(
			@Param("itemId") int itemId,
			@Param("title") String title,
			@Param("author") String author,
			@Param("publisher") String publisher,
			@Param("priceStandard") int priceStandard,
			@Param("priceSales") int priceSales,
			@Param("pubDate") String pubDate,
			@Param("coverImgUrl") String coverImgUrl);
	
	public Product selectProductById(int productId);
	
	public Product selectProductByItemId(int itemId);
	
}
