<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="d-flex justify-content-center mt-5">
	<!-- 카테고리 메뉴 -->
	<div class="category-menu col-2 border form-control">
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=배송 준비중">신규 주문</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=취소요청">취소요청</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=교환요청">교환요청</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=환불요청">환불요청</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=배송중">배송중</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=취소완료">취소완료</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=교환완료">교환완료</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=환불완료">환불완료</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=배송완료">배송완료</a>
		</div>
		<div class="my-2">
			<a href="/admin/order_management_view?deliveryStatus=구매확정">구매확정</a>
		</div>
	</div>
	<!-- 목록 -->
	<div class="col-10">
		<c:choose>
			<c:when test="${deliveryStatus eq '배송 준비중'}">
				<h4>신규주문</h4>
			</c:when>
			<c:otherwise>
				<h4>${deliveryStatus}</h4>
			</c:otherwise>
		</c:choose>
		<!-- 배송 상품 -->
		<table class="table text-center border-0">
		<thead class="bg-warning text-dark">
			<tr>
				<th class="col-2">주문번호(주문일)</th>
				<th class="col-4">주문상품</th>
				<th class="col-2">주문금액</th>
				<th class="col-2">배송상태/요청</th>
				<th class="col-2">배송정보</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="adminSalesView" items="${adminSalesViewList}">
			<c:forEach var="order" items="${adminSalesView.orderList}" varStatus="status">
			<c:if test="${deliveryStatus eq order.deliveryStatus}">
				<tr>
					<td class="p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center ">
							${adminSalesView.orderGroup.id}
							(
							<fmt:formatDate value="${adminSalesView.orderGroup.createdAt}" pattern="yyyy-MM-dd" />
							)
						</div>
					</td>
					<td class="p-0">
						<div class="d-flex justify-content-center align-items-center">
							<a href="/admin/order_detail_view?orderGroupId=${adminSalesView.orderGroup.id}&orderId=${order.id}" class="col-3 p-0"><img src="${adminSalesView.productList[status.index].coverImgUrl}" alt="책 표지" height="81" class="col-12 p-0"></a>
							<div class="col-9 p-0">
								<a href="/admin/order_detail_view?orderGroupId=${adminSalesView.orderGroup.id}&orderId=${order.id}">${adminSalesView.productList[status.index].title}</a>
							</div>
						</div>
					</td>
					<td class="p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center">
							<div>
								<div><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" />원</div>
								<div><small class="text-secondary"><fmt:formatNumber value="${adminSalesView.productList[status.index].priceSales}" pattern="#,###" />원 / ${order.amount}권</small></div>
							</div>
						</div>
					</td>
					<td class="p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center">
						<c:choose>
							<c:when test="${order.deliveryStatus eq '배송 준비중'}">
								<span class="text-warning">${order.deliveryStatus}</span>
							</c:when>
							<c:when test="${order.deliveryStatus eq '배송중'}">
								<span class="text-success">${order.deliveryStatus}</span>
							</c:when>
							<c:when test="${order.deliveryStatus eq '배송완료'}">
								<span class="text-success">${order.deliveryStatus}</span>
							</c:when>
							<c:when test="${fn:contains(order.deliveryStatus, '완료')}">
								<span class="text-danger">${order.deliveryStatus}</span>
							</c:when>
							<c:when test="${fn:contains(order.deliveryStatus, '요청')}">
								<span class="text-danger">${order.deliveryStatus}</span>
							</c:when>
							<c:when test="${fn:contains(order.deliveryStatus, '구매확정')}">
								<span class="text-secondary">${order.deliveryStatus}</span>
							</c:when>
						</c:choose>
						</div>
					</td>
					<td class="cart-box3 p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center">
						<a href="/admin/order_detail_view?orderGroupId=${adminSalesView.orderGroup.id}&orderId=${order.id}" class="btn btn-sm btn-dark">목록</a>
						</div>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<script>
$(document).ready(function() {
	$('.requestBtn').on('click', function() {
		let orderGroupId = $(this).data('order-group-id');
		let orderId = $(this).data('order-id');
		let checkDS = $(this).data('delivery-status');
		let deliveryStatus = $(this).prev().val();
		
		if (deliveryStatus == "선택") {
			alert("요청사항을 선택해 주세요");
			return false;
		}
		if (checkDS == deliveryStatus) {
			alert("이미 " + deliveryStatus + "된 상품입니다.");
			return;
		}
		
		$.ajax({
			type:"post"
			, url:"/order/update"
			, data:{"orderId":orderId, "deliveryStatus":deliveryStatus}
		
			,success:function(data) {
				if (data.code == 1) {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(e) {
				alert("실패");
			}
		});
	});
});
</script>
		
		
