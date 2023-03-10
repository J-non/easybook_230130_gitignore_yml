<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="d-flex justify-content-center">
	<!-- 카테고리 메뉴 -->
	<c:if test="${empty nonMemberEmail}">
		<div class="category-menu col-2 border form-control">
			<div class="my-3">
				<a href="/account/order_history_view" class="category-btn">주문내역</a>
			</div>
			<div>
				<a href="/account/password_confirm_view" class="category-btn">회원정보 관리</a>
			</div>
		</div>
	</c:if>
	<!-- 주문내역 -->
	<div class="col-10">
		<h4>주문내역</h4>
		<div class="order-list-title d-flex align-items-center bg-dark text-white">
			<span class="ml-3">aaaa님의 주문내역 입니다.</span>
		</div>
		<div class="d-flex justify-content-end">
			<small class="text-danger font-weight-bold">※주문 취소는 배송시작 전에만 가능합니다.</small>
		</div>
		<!-- 표 -->
		<table class="table text-center border-0">
		<thead class="bg-dark text-white">
			<tr>
				<th class="col-2">주문번호(주문일)</th>
				<th class="col-4">주문상품</th>
				<th class="col-2">주문금액</th>
				<th class="col-2">배송상태</th>
				<th class="col-2">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderHistoryView" items="${orderHistoryViewList}">
				<c:forEach var="order" items="${orderHistoryView.orderList}" varStatus="status">
				<tr>
					<td class="p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center ">
							${orderHistoryView.orderGroup.id}
							(
							<fmt:formatDate value="${orderHistoryView.orderGroup.createdAt}" pattern="yyyy-MM-dd" />
							)
						</div>
					</td>
					<td class="p-0">
						<div class="d-flex justify-content-center align-items-center">
							<a href="/shop/detail_view?itemId=${orderHistoryView.productList[status.index].itemId}" class="col-3 p-0"><img src="${orderHistoryView.productList[status.index].coverImgUrl}" alt="책 표지" height="81" class="col-12 p-0"></a>
							<div class="col-9 p-0">
								<a href="/shop/detail_view?itemId=${orderHistoryView.productList[status.index].itemId}">${orderHistoryView.productList[status.index].title}</a>
							</div>
						</div>
					</td>
					<td class="p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center">
							<div>
								<div><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" />원</div>
								<div><small class="text-secondary"><fmt:formatNumber value="${orderHistoryView.productList[status.index].priceSales}" pattern="#,###" />원 / ${order.amount}권</small></div>
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
					<td class="cart-box3 d-flex justify-content-center align-items-center p-0">
					<c:choose>
						<c:when test="${order.deliveryStatus eq '구매확정'}">
							${order.deliveryStatus}
						</c:when>
						<c:when test="${order.deliveryStatus eq '배송중'}">
							${order.deliveryStatus}
						</c:when>
						<c:when test="${order.deliveryStatus eq '취소완료'}">
							${order.deliveryStatus}
						</c:when>
						<c:when test="${order.deliveryStatus eq '교환완료'}">
							${order.deliveryStatus}
						</c:when>
						<c:when test="${order.deliveryStatus eq '환불완료'}">
							${order.deliveryStatus}
						</c:when>
						<c:when test="${fn:contains(order.deliveryStatus, '요청')}">
							승인 대기중
						</c:when>
						<c:when test="${fn:contains(order.deliveryStatus, '요청') == false}">
								<select>
									<option value="선택" selected>--선택--</option>
									<c:if test="${order.deliveryStatus eq '배송 준비중'}">
										<option value="취소요청">주문취소</option>
									</c:if>
									<c:if test="${order.deliveryStatus eq '배송완료'}">
										<option value="교환요청">교환</option>
										<option value="환불요청">환불</option>
										<option value="구매확정">구매확정</option>
									</c:if>
								</select>
								<button type="button" class="requestBtn btn btn-sm btn-dark" data-order-group-id="${order.orderGroupId}" data-order-id="${order.id}" data-delivery-status="${order.deliveryStatus}">요청</button>
						</c:when>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.requestBtn').on('click', function() {
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
			
			if (deliveryStatus == "구매확정") {
				if(confirm("구매를 확정하시겠습니까?")) {
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
					return;
				} else {
					e.preventDefault();
				}
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