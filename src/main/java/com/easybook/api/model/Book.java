package com.easybook.api.model;

public class Book {
	
	private int itemId;
	private String title;
	private String author;
	private String publisher;
	private int priceStandard;
	private int priceSales;
	private String pubDate;
	private String coverImgUrl;
	
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPriceStandard() {
		return priceStandard;
	}
	public void setPriceStandard(int priceStandard) {
		this.priceStandard = priceStandard;
	}
	public int getPriceSales() {
		return priceSales;
	}
	public void setPriceSales(int priceSales) {
		this.priceSales = priceSales;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getCoverImgUrl() {
		return coverImgUrl;
	}
	public void setCoverImgUrl(String coverImgUrl) {
		this.coverImgUrl = coverImgUrl;
	}
	
	
	
}
