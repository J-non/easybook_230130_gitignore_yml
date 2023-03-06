package com.easybook.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybook.admin.bo.AdminBO;
import com.easybook.admin.bo.AdminServiceBO;
import com.easybook.admin.model.Admin;
import com.easybook.admin.model.AdminSalesDetailView;
import com.easybook.admin.model.AdminSalesView;
import com.easybook.order.bo.OrderBO;
import com.easybook.order.bo.OrderGroupBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private OrderBO orderBO;
	@Autowired
	private OrderGroupBO orderGroupBO;
	@Autowired
	private AdminServiceBO adminServiceBO;
	@Autowired
	private AdminBO adminBO;
	
	@GetMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "admin/adminSignIn");
		return "template/layout";
	}
	
	@GetMapping("/order_management_view")
	public String orderManagementView(
			Model model
			, @RequestParam(value="deliveryStatus", required=false) String deliveryStatus) {
		model.addAttribute("viewName", "admin/orderManagement");
		if (deliveryStatus == null) {
			deliveryStatus = "배송 준비중";
			model.addAttribute("deliveryStatus", deliveryStatus);
		}
//		Integer orderGroupId = null;
		List<AdminSalesView> adminSalesViewList = adminServiceBO.generateAdminSalesView();
		model.addAttribute("adminSalesViewList", adminSalesViewList);
		model.addAttribute("deliveryStatus", deliveryStatus);
		return "template/layout";
	}
	
	@GetMapping("/order_detail_view")
	public String orderDetailView(
			Model model
			, @RequestParam("orderGroupId") int orderGroupId
			, @RequestParam("orderId") int orderId) {
		model.addAttribute("viewName", "admin/orderDetail");
		AdminSalesDetailView adminSalesDetailView = adminServiceBO.generateAdminSalesDetailView(orderGroupId, orderId);
		model.addAttribute("adminSalesDetailView", adminSalesDetailView);
		return "template/layout";
	}
	
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("adminId");
		session.removeAttribute("adminLoginId");
		session.removeAttribute("adminManagerName");
		return "redirect:/admin/sign_in_view";
	}
	
	@GetMapping("/account_manage_view")
	public String accountManageView(Model model) {
		model.addAttribute("viewName", "admin/accountManage");
		List<Admin> adminList = adminBO.getAdminList();
		model.addAttribute("adminList", adminList);
		return "template/layout";
	}
	
	@GetMapping("/add_admin_view")
	public String addAdminView(Model model) {
		model.addAttribute("viewName", "admin/addAdmin");
		return "template/layout";
	}
}
