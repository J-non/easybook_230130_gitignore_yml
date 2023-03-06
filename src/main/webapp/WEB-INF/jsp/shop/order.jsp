<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center mt-4">
	<table class="table text-center border-0">
		<thead class="bg-dark text-white">
			<tr>
				<th class="col-1 p-0">No.</th>
				<th class="col-4 p-0">상품명</th>
				<th class="col-2 p-0">가격</th>
				<th class="col-2 p-0">수량</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="totalCount" value="0" />
			<c:set var="totalPrice" value="0" />
			<c:forEach var="cartView" items="${cartViewList}" varStatus="status">
				<c:set var="totalCount" value="${totalCount + cartView.cart.productCount}" />
				<c:set var="totalPrice" value="${totalPrice + (cartView.product.priceSales * cartView.cart.productCount)}" />
				<div class="cartData d-none"
				data-product-id="${cartView.product.id}"
				data-product-count="${cartView.cart.productCount}"
				data-total-price="${cartView.product.priceSales * cartView.cart.productCount}"></div>
				<tr>
					<td class="border-0 p-2">
						${status.count}
					</td>
					<td class="border-0 p-2">
						<a href="/shop/detail_view?itemId=${cartView.product.itemId}">${cartView.product.title}</a>
					</td>
					<td class="border-0 p-2">
						<div><fmt:formatNumber value="${cartView.product.priceSales * cartView.cart.productCount}" pattern="#,###" /></div>
					</td>
					<td class="border-0 p-2">
						<div class="">
							${cartView.cart.productCount}권
						</div>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="4" class="border-0 p-0 bg-dark text-white font-weight-bold">
		 		총 :
		 		<span id="totalCount"><c:out value="${totalCount}" />권,</span>
		 		가격 :
		 		<span id="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</span>
		 		<div id="totalPriceData" class="d-none" data-total-price="${totalPrice}"></div>
		 	</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-end cart-box">
		<a href="/shop/cart_view"><button id="returnCartBtn" type="button" class="btn btn-dark text-white py-1">장바구니로 돌아가기</button></a>
	</div>
</div>
<div class="d-flex justify-content-center mt-4 ml-5">
	<div class="cart-box">
		<h5>배송지 정보 입력</h5>
		<!-- 받으시는 분 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-center col-2">
				받으시는 분
			</div>
			<input type="text" id="consigneeName" class="form-control col-3"  placeholder="받으시는 분 성함">
		</div>
		<!-- 전화번호 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-start col-2">
				수취인 전화번호
			</div>
			<div>
				<input type="text" id="consigneePhoneNumber" class="form-control mb-1" placeholder="숫자만 입력해 주세요">
				<div>주문/배송 관련 문자가 전송됩니다.</div>
			</div>
		</div>
		<!-- 배송지 선택 (회원만 보여짐)-->
		<c:if test="${!empty user}">
			<div class="d-flex align-items-center mt-3 p-0">
				<div class="d-flex align-items-center col-2">
					배송지 선택
				</div>
				<input type="radio" name="address" id="default" value="default" checked>
				<label for="default" class="mr-4 mb-0">기본 배송지 주소</label>
				<input type="radio" name="address" id="new" value="new">
				<label for="new" class="m-0">새 주소 입력</label>
			</div>
		
		<!-- 배송지 주소 입력 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-start col-2">
				주소
			</div>
			<c:choose>
				<c:when test="${!empty user.postCode}">
					<div id="defaultAddress" class="defaultAddress" data-post-code="${user.postCode}" data-address="${user.address}">
						<div>${user.postCode}</div>
						<div>${user.address}</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="defaultAddress">
						<div>기본 배송지가 없습니다.</div>
						<div>새 주소 입력을 이용해 주세요.</div>
					</div>
				</c:otherwise>
			</c:choose>
			
			<!-- 새 주소 입력 시 보여짐 -->
			<div id="newAddress" class="d-none col-10">
				<div>
					<input type="text" id="postCode" class="form-control col-2 ml-3 mt-2" placeholder="우편번호" readonly>
				</div>
				<div>
					<input type="text" id="address" class="form-control col-8 ml-3 mt-2" placeholder="주소" readonly>
				</div>
				<div>
					<input type="text" id="detailAddress" class="form-control col-8 ml-3 mt-2" placeholder="상세주소">
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${empty user}">
			<div class="d-flex mt-3 p-0">
				<div class="d-flex align-items-start col-2">
					주소
				</div>
				<div id="newAddress" class="col-10">
					<div>
						<input type="text" id="postCode" class="form-control col-2 ml-3 mt-2" placeholder="우편번호" readonly>
					</div>
					<div>
						<input type="text" id="address" class="form-control col-8 ml-3 mt-2" placeholder="주소" readonly>
					</div>
					<div>
						<input type="text" id="detailAddress" class="form-control col-8 ml-3 mt-2" placeholder="상세주소">
					</div>
				</div>
			</div>
		</c:if>
		<!-- 구매 버튼 -->
		<div class="d-flex justify-content-center mt-4 mb-5">
			<button type="button" id="orderBtn" class="btn btn-dark col-3">주문하기</button>
		</div>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		// 카카오 주소찾기 API
		// 우편번호 클릭 시
		$('#postCode').on('click', function() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('#postCode').val(data.zonecode);
					$('#address').val(data.address);
					$('#detailAddress').focus();
				}
			}).open();
		});	// 우편번호 클릭 시 끝
		
		// 주소 클릭 시
		$('#address').on('click', function() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('#postCode').val(data.zonecode);
					$('#address').val(data.address);
					$('#detailAddress').focus();
				}
			}).open();
		});	// 주소 클릭 시 끝
		// 카카오 주소찾기 API 끝
		
		// 라디오 버튼 클릭 시
		$('input[name=address]').on('click', function() {
			let check = $(this).val();
			if (check == "new") {
				$('#newAddress').removeClass('d-none');
				$('.defaultAddress').addClass('d-none');
			} else {
				$('#newAddress').addClass('d-none');
				$('.defaultAddress').removeClass('d-none');
			}
		});	// 라디오 버튼 클릭 시 끝
		
		// 주문하기
		$('#orderBtn').on('click', function() {
			const testPhoneNumber = /^[0-9]+$/;
			
			let productIdList = [];
			let productCountList = [];
			let productTotalPriceList = [];
			$('.cartData').each(function() {
				productIdList.push($(this).data('product-id'));
				productCountList.push($(this).data('product-count'));
				productTotalPriceList.push($(this).data('total-price'));
			});
			
			let consigneeName = $('#consigneeName').val().trim();
			let consigneePhoneNumber = $('#consigneePhoneNumber').val().trim();
			let totalPrice = $('#totalPriceData').data('total-price');
			
			let postCode = "";
			let address = "";
			if ($('#newAddress').hasClass('d-none')) {
				postCode = $('#defaultAddress').data('post-code');
				address = $('#defaultAddress').data('address');
			} else {
				postCode = $('#postCode').val();
				address = $('#address').val().trim() + $('#detailAddress').val().trim();
			}
			
			if (consigneeName == "") {
				alert("받으시는 분 이름을 입력해 주세요.");
				return;
			}
			
			if (consigneePhoneNumber == "") {
				alert("전화번호를 입력해 주세요");
				return;
			}
			
			if (testPhoneNumber.test(consigneePhoneNumber) == false) {
				alert("전화번호는 숫자만 입력 가능합니다.");
				return;
			}
			
			if (postCode == "" || postCode == null) {
				alert("배송지 주소를 입력해 주세요");
				$('#postCode').val("");
				$('#address').val("");
				$('#detailAddress').val("");
				return;
			}
			
			if ($('#newAddress').hasClass('d-none') == false && $('#detailAddress').val() == "") {
				alert("상세주소를 입력해 주세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/order/create"
				, data:{"productIdList":productIdList, "productCountList":productCountList, "productTotalPriceList":productTotalPriceList
					, "consigneeName":consigneeName, "consigneePhoneNumber":consigneePhoneNumber, "totalPrice":totalPrice
					, "postCode":postCode, "address":address}
			
				, success:function(data) {
					if (data.code == 1) {
						location.href = "/shop/complete_view";
					} else {
						alert(data.erropMessage);
					}
				}
				, error:function(e) {
					alert("실패");
				}
			});
		});	// 주문하기 끝
	});
</script>
