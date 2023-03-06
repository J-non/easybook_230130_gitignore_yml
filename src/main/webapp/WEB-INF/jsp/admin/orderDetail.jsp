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
		<h4>배송 정보</h4>
		<!-- 배송정보 -->
		<div class="mb-4">
			<div class="d-flex">
				<div>주문인 : </div>
				<div class="ml-2">${adminSalesDetailView.orderGroup.consigneeName}</div>
			</div>
			<div class="d-flex">
				<div>전화번호 : </div>
				<div class="ml-2">${adminSalesDetailView.orderGroup.consigneePhoneNumber}</div>
			</div>
			<div class="d-flex">
				<div>우편번호 : </div>
				<div class="ml-2">${adminSalesDetailView.orderGroup.postCode}</div>
			</div>
			<div class="d-flex">
				<div>주소 : </div>
				<div class="ml-2">${adminSalesDetailView.orderGroup.address}</div>
			</div>
		</div>
		<!-- 배송 상품 -->
		<table class="table text-center border-0">
		<thead class="bg-warning text-dark">
			<tr>
				<th class="col-4">주문상품</th>
				<th class="col-1">수량</th>
				<th class="col-3">글쓴이/출판사</th>
				<th class="col-2">배송상태/요청</th>
				<th class="col-2">비고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="p-0">
					<div class="d-flex justify-content-center align-items-center">
						<img src="${adminSalesDetailView.product.coverImgUrl}" alt="책 표지" width="81" height="81" class="p-0">
						<div class="col-9 p-0">
							${adminSalesDetailView.product.title}
						</div>
					</div>
				</td>
				<td class="p-0">
					<div class="cart-box3 d-flex justify-content-center align-items-center">
						<div>
							${adminSalesDetailView.order.amount}
						</div>
					</div>
				</td>
				<td class="p-0">
					<div class="cart-box3 d-flex justify-content-center align-items-center ">
						${adminSalesDetailView.product.author} / ${adminSalesDetailView.product.publisher}
					</div>
				</td>
				<td class="p-0">
					<div class="cart-box3 d-flex justify-content-center align-items-center">
					<c:choose>
						<c:when test="${adminSalesDetailView.order.deliveryStatus eq '배송 준비중'}">
							<span class="text-warning">${adminSalesDetailView.order.deliveryStatus}</span>
						</c:when>
						<c:when test="${adminSalesDetailView.order.deliveryStatus eq '배송중'}">
							<span class="text-success">${adminSalesDetailView.order.deliveryStatus}</span>
						</c:when>
						<c:when test="${adminSalesDetailView.order.deliveryStatus eq '배송완료'}">
							<span class="text-success">${adminSalesDetailView.order.deliveryStatus}</span>
						</c:when>
						<c:when test="${fn:contains(adminSalesDetailView.order.deliveryStatus, '완료')}">
							<span class="text-danger">${adminSalesDetailView.order.deliveryStatus}</span>
						</c:when>
						<c:when test="${fn:contains(adminSalesDetailView.order.deliveryStatus, '요청')}">
							<span class="text-danger">${adminSalesDetailView.order.deliveryStatus}</span>
						</c:when>
						<c:when test="${fn:contains(adminSalesDetailView.order.deliveryStatus, '구매확정')}">
							<span class="text-secondary">${adminSalesDetailView.order.deliveryStatus}</span>
						</c:when>
					</c:choose>
					</div>
				</td>
				<td class="cart-box3 d-flex justify-content-center align-items-center p-0">
					<c:if test="${order.deliveryStatus ne '구매확정'}">
					<select>
						<option value="선택" selected>--선택--</option>
							<option value="취소완료">취소완료</option>
							<option value="교환완료">교환완료</option>
							<option value="환불완료">환불완료</option>
							<option value="배송중">배송중</option>
							<option value="배송완료">배송완료</option>
							<option value="구매확정">구매확정</option>
					</select>
					<button type="button" class="requestBtn btn btn-sm btn-dark" data-order-group-id="${adminSalesDetailView.order.orderGroupId}" data-order-id="${adminSalesDetailView.order.id}">요청</button>
					</c:if>
					<c:if test="${order.deliveryStatus eq '구매확정'}">
						<span class="text-secondary">구매확정</span>
					</c:if>
				</td>
			</tr>
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
			, data:{"orderId":orderId, "deliveryStatus":deliveryStatus, "orderGroupId":orderGroupId}
		
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