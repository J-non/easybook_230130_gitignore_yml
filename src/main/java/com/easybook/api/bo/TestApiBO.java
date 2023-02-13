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

import com.easybook.api.model.Book;

@Service
public class TestApiBO {

	public List<Book> testAip() {
		
		
		List<Book> bookList = new ArrayList<>();
		String result = "";
		
		try {
			URL searchUrl = new URL("http://www.aladdin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbwhdtjr36950249002&Query=a&QueryType=title&Version=20131101&Output=JS");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(searchUrl.openStream(), "UTF-8"));
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
