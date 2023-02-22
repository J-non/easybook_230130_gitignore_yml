<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center mt-4">
	<table class="table text-center border-0">
		<thead class="bg-secondary text-white">
			<tr>
				<th class="col-1">
					<input type="checkbox">
				</th>
				<th class="col-4">상품명</th>
				<th class="col-2">가격</th>
				<th class="col-2">수량</th>
				<th class="col-2">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="totalCount" value="0" />
			<c:set var="totalPrice" value="0" />
			<c:forEach var="cartView" items="${cartViewList}">
				<c:set var="totalCount" value="${totalCount + cartView.cart.productCount}" />
				<c:set var="totalPrice" value="${totalPrice + (cartView.product.priceSales * cartView.cart.productCount)}" />
				<tr>
					<td class="cart-box3 d-flex justify-content-center align-items-center border-0 p-0">
						<input type="checkbox">
					</td>
					<td class="border-0 p-0">
						<div class="d-flex justify-content-center align-items-center">
							<img src="${cartView.product.coverImgUrl}" alt="책 표지" height="81" class="col-3 p-0">
							<div class="col-9 p-0">
								${cartView.product.title}
							</div>
						</div>
					</td>
					<td class="cart-box3 d-flex justify-content-center align-items-center border-0 p-0">
						<div>
							<small class="text-decoration-line-through text-secondary">
								<del><fmt:formatNumber value="${cartView.product.priceStandard}" pattern="#,###" />원</del>
							</small>
							<div>
								<fmt:formatNumber value="${cartView.product.priceSales}" pattern="#,###" />원
							</div>
						</div>
					</td>
					<td class="border-0 p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center">
							<input type="number" class="form-control col-3 p-0" value="${cartView.cart.productCount}" min="1" max="50">
						</div>
					</td>
					<td class="cart-box3 d-flex justify-content-center align-items-center border-0 p-0">
						<button type="button" class="btn btn-danger">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-center bg-secondary cart-box">
		 <div class="cart-box2 font-weight-bold text-white">
		 	<div class="d-flex justify-content-between my-1">
		 		<div>주문한 상품 수</div>
		 		<span id="totalCount"><c:out value="${totalCount}" />개</span>
		 	</div>
		 	<div class="d-flex justify-content-between my-1">
		 		<div>총 가격</div>
		 		<span id="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</span>
		 	</div>
		 </div>
	</div>
</div>
<div class="d-flex justify-content-center mt-4">
	<button type="button" class="btn btn-dark">션택한 상품 주문하기</button>
</div>

<script>
	$(document).ready(function() {
		
	});
</script>