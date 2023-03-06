<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center mt-4">
	<table class="table text-center border-0">
		<thead class="bg-dark text-white">
			<tr>
				<th class="col-1">
					<input type="checkbox" id="checkAll" checked>
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
			<c:forEach var="cartView" items="${cartViewList}" varStatus="status">
				<c:set var="totalCount" value="${totalCount + cartView.cart.productCount}" />
				<c:set var="totalPrice" value="${totalPrice + (cartView.product.priceSales * cartView.cart.productCount)}" />
				<tr>
					<td class="cart-box3 d-flex justify-content-center align-items-center border-0 p-0">
						<input type="checkbox" id="${status.index}" class="cartId" value="${cartView.cart.id}" data-product-id="${cartView.product.id}" checked>
					</td>
					<td class="border-0 p-0">
						<div class="d-flex justify-content-center align-items-center">
							<a href="/shop/detail_view?itemId=${cartView.product.itemId}" class="col-3 p-0"><img src="${cartView.product.coverImgUrl}" alt="책 표지" height="81" class="col-12 p-0"></a>
							<div class="col-9 p-0">
								<a href="/shop/detail_view?itemId=${cartView.product.itemId}">${cartView.product.title}</a>
							</div>
						</div>
					</td>
					<td class="cart-box3 d-flex justify-content-center align-items-center border-0 p-0">
						<div>
							<small class="text-decoration-line-through text-secondary">
								<del><fmt:formatNumber value="${cartView.product.priceStandard}" pattern="#,###" />원</del>
							</small>
							<div>
								<span class="priceSales" data-price-sales="${cartView.product.priceSales}">
									<fmt:formatNumber value="${cartView.product.priceSales}" pattern="#,###" />
								</span>원
							</div>
						</div>
					</td>
					<td class="border-0 p-0">
						<div class="cart-box3 d-flex justify-content-center align-items-center">
							<input type="number" class="productCount form-control col-3 p-0" value="${cartView.cart.productCount}" min="1" max="50">
						</div>
					</td>
					<td class="cart-box3 d-flex justify-content-center align-items-center border-0 p-0">
						<button type="button" class="deleteBtn btn btn-danger" data-cart-id="${cartView.cart.id}">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-center bg-dark cart-box">
		 <div class="cart-box2 font-weight-bold text-white">
		 	<div class="d-flex justify-content-between my-1">
		 		<div>주문한 상품 수</div>
		 		<span id="totalCount"><c:out value="${totalCount}" />권</span>
		 	</div>
		 	<div class="d-flex justify-content-between my-1">
		 		<div>총 가격</div>
		 		<span id="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</span>
		 	</div>
		 </div>
	</div>
</div>
<div class="d-flex justify-content-center mt-4">
	<button type="button" id="deleteAllBtn" class="btn btn-danger">장바구니 비우기</button>
	<button type="button" id="orderPageBtn" class="btn btn-dark ml-3">션택한 상품 주문하기</button>
</div>

<script>
	$(document).ready(function() {
		
		// checkAll 클릭시 전체 선택 및 해제 및 체크된 상품 수량 및 가격 변경
		$('#checkAll').on('click', function() {
			if ($('#checkAll').is(':checked')) {
				$('.cartId').prop('checked', true);
			} else {
				$('.cartId').prop('checked', false);
			}
			
			let priceSalesList = [];
			$('.priceSales').each(function() {
				priceSalesList.push($(this).data('price-sales'));
			});
			
			let productCount = 0;
			let totalPrice = 0;
			let i = 0;
			$('.productCount').each(function() {
				if ($('input[id=' + i + ']').is(':checked')){
					productCount += parseInt($(this).val().trim());
					totalPrice += priceSalesList[i] * $(this).val().trim();
				}
				i += 1;
			});
			$('#totalCount').text(productCount + "권");
			$('#totalPrice').text(totalPrice.toLocaleString('en-US') + "원");
		});	// checkAll 클릭시 전체 선택 및 해제 및 체크된 상품 수량 및 가격 변경 끝
		
		// 모든 항목 체크 시 checkAll 제어 및 체크된 상품 수량 및 가격 변경
		$('.cartId').on('click', function() {
			let total = $('.cartId').length;
			let checked = $('input[class=cartId]:checked').length;
			if (total != checked) {
				$('#checkAll').prop('checked', false);
			} else {
				$('#checkAll').prop('checked', true);
			}
			
			let priceSalesList = [];
			$('.priceSales').each(function() {
				priceSalesList.push($(this).data('price-sales'));
			});
			
			let productCount = 0;
			let totalPrice = 0;
			let i = 0;
			$('.productCount').each(function() {
				if ($('input[id=' + i + ']').is(':checked')){
					productCount += parseInt($(this).val().trim());
					totalPrice += priceSalesList[i] * $(this).val().trim();
				}
				i += 1;
			});
			$('#totalCount').text(productCount + "권");
			$('#totalPrice').text(totalPrice.toLocaleString('en-US') + "원");
		});	// 모든 항목 체크 시 checkAll 제어 및 체크된 상품 수량 및 가격 변경 끝
		
		// 총 수량 및 가격 변경
		$('.productCount').on('change', function() {
			let priceSalesList = [];
			$('.priceSales').each(function() {
				priceSalesList.push($(this).data('price-sales'));
			});
			
			let productCount = 0;
			let totalPrice = 0;
			let i = 0;
			$('.productCount').each(function() {
				if ($('input[id=' + i + ']').is(':checked')){
					productCount += parseInt($(this).val().trim());
					totalPrice += priceSalesList[i] * $(this).val().trim();
				}
				i += 1;
			});
			$('#totalCount').text(productCount + "권");
			$('#totalPrice').text(totalPrice.toLocaleString('en-US') + "원");
			
		});
		
		// 상품 수량 최대 50 제한
		$('.productCount').on('keyup', function() {
			let onlyNum = /[0-9]/; 
			let productCount = $(this).val().trim();
			if (!onlyNum.test(productCount)) {
				alert("숫자만 입력 가능합니다.");
				$(this).val("1");
				return;
			}
			if (productCount == "0") {
				alert("상품의 최소수량은 1 입니다.")
				$(this).val("1");
				return;
			}
			if (productCount > 50) {
				alert("상품의 최대수량은 50 입니다.");
				$(this).val("50");
				return;
			}
		}); // 상품 수량 최대 50 제한 끝
		
		// 선택된 항목만 구매 페이지로 (DB update)
		$('#orderPageBtn').on('click', function() {
			let cartIdList = [];
			let i = 0;
			$('.cartId').each(function() {
				if($('input[id=' + i + ']').is(':checked')) {
					cartIdList.push($(this).val().trim());
				}
				i += 1;
			});
			
			let productIdList = [];
			i = 0;
			$('.cartId').each(function() {
				if ($('input[id=' + i + ']').is(':checked')){
					productIdList.push($(this).data('product-id'));
				}
				i += 1;
			});
			
			let productCountList = [];
			i = 0;
			$('.productCount').each(function() {
				if ($('input[id=' + i + ']').is(':checked')){
					productCountList.push($(this).val().trim());
				}
				i += 1;
			});
			
			if (cartIdList.length == 0) {
				alert("선택된 상품이 없습니다.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/cart/update"
				, data:{"cartIdList":cartIdList, "productIdList":productIdList, "productCountList":productCountList}
			
				, success:function(data) {
					if (data.code == 1) {
						$.ajax({
							type:"get"
							, url:"/shop/order_view"
							, data:{"cartIdList":cartIdList}
						
							, success:function() {
								location.href = "/shop/order_view?cartIdList=" + cartIdList;
							}
							, error: function(e) {
								alert("실패");
							}
						});
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("업데이트 실패");
				}
			});
			
		}); // 선택된 항목만 구매 페이지로 (DB update) 끝
		
		// 개별 항목 삭제
		$('.deleteBtn').on('click', function() {
			let cartId = $(this).data('cart-id');
			
			$.ajax({
				type:"delete"
				, url:"/cart/delete"
				, data:{"cartId":cartId}
			
				, success:function(data) {
					if (data.code == 1) {
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("삭제 실패");
				}
			});
		}); // 개별 항목 삭제 끝
		
		// 장바구니 비우기
		$('#deleteAllBtn').on('click', function() {
			$.ajax({
				type:"delete"
				, url:"/cart/delete"
			
				, success:function(data) {
					if (data.code == 1) {
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("삭제 실패");
				}
			});
		});
		
	});
</script>