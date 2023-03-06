package com.easybook.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easybook.account.bo.OrderHistoryBO;
import com.easybook.account.model.OrderHistoryView;
import com.easybook.user.bo.UserBO;
import com.easybook.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/account")
@Controller
public class AccountController {
	
	@Autowired
	private UserBO userBO;
	@Autowired
	private OrderHistoryBO orderHistoryBO;
	
	@GetMapping("/order_history_view")
	public String orderHistoryView(
			Model model
			, HttpSession session) {
		model.addAttribute("viewName", "account/orderHistory");
		Integer userId = null;
		Integer nonMemberId = null;
		if ((Integer)session.getAttribute("userId") != null) {
			userId = (Integer)session.getAttribute("userId");
		}
		if ((Integer)session.getAttribute("nonMemberId") != null) {
			nonMemberId = (Integer)session.getAttribute("nonMemberId");
		}
		
		List<OrderHistoryView> orderHistoryViewList = orderHistoryBO.generateOrderHistoryView(userId, nonMemberId);
		model.addAttribute("orderHistoryViewList", orderHistoryViewList);
		
		return "template/layout";
	}
	
	@GetMapping("/password_confirm_view")
	public String passwordConfirmView(
			Model model
			, HttpSession session) {
		model.addAttribute("viewName", "account/passwordConfirm");
		String loginId = (String)session.getAttribute("userLoginId");
		model.addAttribute("loginId", loginId);
		return "template/layout";
	}
	
	@GetMapping("/customer_info_view")
	public String customerInfoView(
			Model model
			, HttpSession session) {
		model.addAttribute("viewName", "account/customerInfo");
		int userId = (Integer)session.getAttribute("userId");
		User user = userBO.getUserById(userId);
		model.addAttribute("user", user);
		
		return "template/layout";
	}
}
