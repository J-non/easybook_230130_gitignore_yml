package com.easybook.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.easybook.order.bo.OrderBO;
import com.easybook.order.bo.OrderServiceBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/order")
@RestController
public class OrderRestController {
	
	@Autowired
	private OrderServiceBO orderServiceBO;
	@Autowired
	private OrderBO orderBO;
	
	@PostMapping("/create")
	public Map<String, Object> createOrder(
			@RequestParam("productIdList[]") List<Integer> productIdList
			, @RequestParam("productCountList[]") List<Integer> productCountList
			, @RequestParam("productTotalPriceList[]") List<Integer> productTotalPriceList
			, @RequestParam("consigneeName") String consigneeName
			, @RequestParam("consigneePhoneNumber") String consigneePhoneNumber
			, @RequestParam("postCode") String postCode
			, @RequestParam("address") String address
			, @RequestParam("totalPrice") int totalPrice
			, HttpSession session) {
		Integer userId = null;
		Integer nonMemberId = null;
		if ((Integer)session.getAttribute("userId") != null) {
			userId = (Integer)session.getAttribute("userId");
		}
		if ((Integer)session.getAttribute("nonMemberId") != null) {
			nonMemberId = (Integer)session.getAttribute("nonMemberId");
		}
		
		Map<String, Object> result = new HashMap<>();
		int check = orderServiceBO.insertOrderGroupOrders(userId, nonMemberId, productIdList, productCountList, productTotalPriceList, consigneeName, consigneePhoneNumber, postCode, address, totalPrice);
		if (check == 1) {
			result.put("code", 1);
		} else if (check == 501) {
			result.put("code", 500);
			result.put("errorMessage", "주문 생성 실패.");
		} else if (check == 502) {
			result.put("code", 500);
			result.put("errorMessage", "주문 그룹 생성 실패.");
		}
		return result;
	}
	
	@PostMapping("/update")
	public Map<String, Object> updateOrder(
			@RequestParam("orderId") int orderId
			, @RequestParam("deliveryStatus") String deliveryStatus) {
		Map<String, Object> result = new HashMap<>();
		
		int row = orderServiceBO.updateOrderOrderGroupById(orderId, deliveryStatus);
		if (row == 1) {
			result.put("code", 1);
		} else if (row == 500){
			result.put("code", 500);
			result.put("errorMessage", deliveryStatus + "요청에 실패했습니다.");
		}
		return result;
	}
	
}
