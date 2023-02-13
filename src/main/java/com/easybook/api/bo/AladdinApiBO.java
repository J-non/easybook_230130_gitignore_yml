package com.easybook.api.bo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybook.api.model.Book;

@Service
public class AladdinApiBO {
	
	private String TTBKEY = "ttbwhdtjr36950249002";
	private String result = "";
	
	public List<Book> getItemNewAll(
			String maxResult
			, String start) {
		List<Book> bookList = new ArrayList<>();
			
		try {
			URL itemListUrl = new URL("http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=" + TTBKEY
					+ "&QueryType=ItemNewAll&MaxResults=" + maxResult + "&Start=" + start + "&SearchTarget=Book&output=JS&Version=20131101");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(itemListUrl.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONArray items = (JSONArray)jsonObject.get("item");
			
			for(int i = 0; i < items.size(); i++) {
				Book book = new Book();
				JSONObject item = (JSONObject)items.get(i);
				book.setItemId(Integer.parseInt(item.get("itemId") + ""));
				book.setTitle((String)item.get("title"));
				book.setAuthor((String)item.get("author"));
				book.setPublisher((String)item.get("publisher"));
				book.setPriceStandard(Integer.parseInt(item.get("priceStandard") + ""));
				book.setPriceSales(Integer.parseInt(item.get("priceSales") + ""));
				book.setPubDate((String)item.get("pubDate"));
				book.setCoverImgUrl((String)item.get("cover"));
				bookList.add(book);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}
	
	public List<Book> getKorBook(
			String maxResult
			, String start
			, String categoryId) {
		List<Book> bookList = new ArrayList<>();
		String query = "이";
		String cId = "0";
		
		if (categoryId != null) {
			cId = categoryId;
		}
		
		try {
			URL itemListUrl = new URL("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" + TTBKEY
					+ "&Query="+ query + "&MaxResults=" + maxResult + "&QueryType=Keyword&Start=" + start
					+ "&CategoryId=" + cId + "&SearchTarget=Book&output=JS&Version=20131101");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(itemListUrl.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONArray items = (JSONArray)jsonObject.get("item");
			
			for(int i = 0; i < items.size(); i++) {
				Book book = new Book();
				JSONObject item = (JSONObject)items.get(i);
				book.setItemId(Integer.parseInt(item.get("itemId") + ""));
				book.setTitle((String)item.get("title"));
				book.setAuthor((String)item.get("author"));
				book.setPublisher((String)item.get("publisher"));
				book.setPriceStandard(Integer.parseInt(item.get("priceStandard") + ""));
				book.setPriceSales(Integer.parseInt(item.get("priceSales") + ""));
				book.setPubDate((String)item.get("pubDate"));
				book.setCoverImgUrl((String)item.get("cover"));
				bookList.add(book);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}
	
	public List<Book> getForeignBook(
			String maxResult
			, String start
			, String categoryId) {
		List<Book> bookList = new ArrayList<>();
		String query = "A";
		String cId = "0";
		
		if (categoryId != null) {
			cId = categoryId;
		}
		
		try {
			URL itemListUrl = new URL("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" + TTBKEY
					+ "&Query="+ query + "&MaxResults=" + maxResult + "&QueryType=Keyword&Start=" + start
					+ "&CategoryId=" + cId + "&SearchTarget=Foreign&output=JS&Version=20131101");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(itemListUrl.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONArray items = (JSONArray)jsonObject.get("item");
			
			for(int i = 0; i < items.size(); i++) {
				Book book = new Book();
				JSONObject item = (JSONObject)items.get(i);
				book.setItemId(Integer.parseInt(item.get("itemId") + ""));
				book.setTitle((String)item.get("title"));
				book.setAuthor((String)item.get("author"));
				book.setPublisher((String)item.get("publisher"));
				book.setPriceStandard(Integer.parseInt(item.get("priceStandard") + ""));
				book.setPriceSales(Integer.parseInt(item.get("priceSales") + ""));
				book.setPubDate((String)item.get("pubDate"));
				book.setCoverImgUrl((String)item.get("cover"));
				bookList.add(book);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}
	
	public List<Book> searchBook(
			String maxResult
			, String start
			, String searchTarget
			, String query) {
		List<Book> bookList = new ArrayList<>();
		
		try {
			URL itemListUrl = new URL("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" + TTBKEY
					+ "&Query="+ query + "&MaxResults=" + maxResult + "&QueryType=Keyword&Start=" + start
					+ "&SearchTarget=" + searchTarget + "&output=JS&Version=20131101");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(itemListUrl.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONArray items = (JSONArray)jsonObject.get("item");
			
			for(int i = 0; i < items.size(); i++) {
				Book book = new Book();
				JSONObject item = (JSONObject)items.get(i);
				book.setItemId(Integer.parseInt(item.get("itemId") + ""));
				book.setTitle((String)item.get("title"));
				book.setAuthor((String)item.get("author"));
				book.setPublisher((String)item.get("publisher"));
				book.setPriceStandard(Integer.parseInt(item.get("priceStandard") + ""));
				book.setPriceSales(Integer.parseInt(item.get("priceSales") + ""));
				book.setPubDate((String)item.get("pubDate"));
				book.setCoverImgUrl((String)item.get("cover"));
				bookList.add(book);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}
	
}

