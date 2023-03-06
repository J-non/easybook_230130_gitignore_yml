package com.easybook.admin.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.admin.model.AdminSalesDetailView;
import com.easybook.admin.model.AdminSalesView;
import com.easybook.non_member.bo.NonMemberBO;
import com.easybook.non_member.model.NonMember;
import com.easybook.order.bo.OrderBO;
import com.easybook.order.bo.OrderGroupBO;
import com.easybook.order.model.Order;
import com.easybook.order.model.OrderGroup;
import com.easybook.product.bo.ProductBO;
import com.easybook.product.model.Product;
import com.easybook.user.bo.UserBO;
import com.easybook.user.model.User;

@Service
public class AdminServiceBO {
	
	@Autowired
	private OrderGroupBO orderGroupBO;
	@Autowired
	private OrderBO orderBO;
	@Autowired
	private ProductBO productBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private NonMemberBO nonMemberBO;
	
	public List<AdminSalesView> generateAdminSalesView() {
		List<AdminSalesView> adminSalesViewList = new ArrayList<>();
		List<OrderGroup> orderGroupList = orderGroupBO.getOrderGroupList();
		
		for (OrderGroup orderGroup : orderGroupList) {
			AdminSalesView adminSalesView = new AdminSalesView();
			adminSalesView.setOrderGroup(orderGroup);
			
			if (orderGroup.getUserid() != null) {
				User user = userBO.getUserById(orderGroup.getUserid());
				adminSalesView.setUser(user);
			}
			if (orderGroup.getNonMemberId() != null) {
				NonMember nonMember = nonMemberBO.getNonMemberById(orderGroup.getNonMemberId());
				adminSalesView.setNonMember(nonMember);
			}
			
			List<Order> orderList = orderBO.getOrderListByOrderGroupId(orderGroup.getId());
			adminSalesView.setOrderList(orderList);
			
			List<Product> productList = new ArrayList<>();
			for (Order order : orderList) {
				Product product = productBO.getProductById(order.getProductId());
				productList.add(product);
			}
			adminSalesView.setProductList(productList);
			
			adminSalesViewList.add(adminSalesView);
		}
		return adminSalesViewList;
	}
	
	public AdminSalesDetailView  generateAdminSalesDetailView(int orderGroupId, int orderId) {
		AdminSalesDetailView adminSalesDetailView = new AdminSalesDetailView();
		OrderGroup orderGroup = orderGroupBO.getOrderGroupById(orderGroupId);
		adminSalesDetailView.setOrderGroup(orderGroup);
		Order order = orderBO.getOrderById(orderId);
		adminSalesDetailView.setOrder(order);
		Product product = productBO.getProductById(order.getProductId());
		adminSalesDetailView.setProduct(product);
		if (orderGroup.getUserid() != null) {
			User user = userBO.getUserById(orderGroup.getUserid());
			adminSalesDetailView.setUser(user);
		}
		if (orderGroup.getNonMemberId() != null) {
			NonMember nonMember = nonMemberBO.getNonMemberById(orderGroup.getNonMemberId());
			adminSalesDetailView.setNonMember(nonMember);
		}
		return adminSalesDetailView;
	}
	
}
