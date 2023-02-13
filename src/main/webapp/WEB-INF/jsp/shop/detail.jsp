<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center my-4">
	<!-- 책 표지 -->
	<div class="d-flex justify-content-center col-4 p-0 detail-box">
		<img src="${book.coverImgUrl}" alt="책 표지" width="200" height="300">
	</div>
	<!-- 책 정보 -->
	<div id="itemId" class="d-none" data-item-id="${book.itemId}"></div>
	<div class="col-6 p-0 detail-box">
		<div>
			<h3 class="m-0">${book.title}</h3>
		</div>
		<div>
			<small>${book.author}</small> <small>${book.publisher}</small> <small>${book.pubDate}</small>
		</div>
		<div class="d-flex mt-2">
			<div class="col-2 p-0">정가</div>
			<div><fmt:formatNumber value="${book.priceStandard}" pattern="#,###" />원</div>
		</div>
		<div class="d-flex">
			<div class="col-2 p-0">판매가</div>
			<h5><fmt:formatNumber value="${book.priceSales}" pattern="#,###" />원</h5>
		</div>
		<div class="d-flex">
			<div class="col-2 p-0">평점</div>
			<div class="d-flex align-items-center">
				<c:forEach begin="1" end="5">
					<img src="/static/img/star_empty.png" width="20" alt="star">
				</c:forEach>
			</div>
			<div class="ml-2">3.4</div>
			<div class="ml-5">평균 판매량</div>
			<div class="ml-2"><fmt:formatNumber value="${book.salesPoint}" pattern="#,###" />권</div>
		</div>
		<div>
			<div class="font-weight-bold mt-2">책 소개</div>
			<c:choose>
				<c:when test="${empty book.description}">
					<div>(내용없음)</div>
				</c:when>
				<c:otherwise>
				<div>${book.description}</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<div class="d-flex justify-content-end my-3">
	<button type="button" id="cartBtn" class="btn btn-secondary mr-2">장바구니
		담기</button>
	<button type="button" id="buyBtn" class="btn btn-dark">바로구매</button>
	<div class="d-flex align-items-center ml-4">
		<span class="col-2 p-0">수량</span>
		<div class="input-group">
			<button id="productCountDownBtn" class="btn btn-secondary p-0 col-2" type="button">-</button>
			<input type="text" id="productCount" class="form-control col-3" value="1">
			<button id="productCountUpBtn" class="btn btn-secondary p-0 col-2" type="button">+</button>
		</div>
	</div>
</div>
<!-- 댓글 -->
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-start detail-box">
		<h5>댓글 및 평점</h5>
	</div>
</div>
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-center align-items-center detail-box">
		<div class="d-flex p-0">
			<div class="input-group">
				<button class="btn btn-secondary p-0 col-2" type="button">-</button>
				<input type="text" class="form-control col-4" value="0.0">
				<button class="btn btn-secondary p-0 col-2" type="button">+</button>
			</div>
		</div>
		<textarea class="form-control" rows="2" cols="90"></textarea>
		<button class="btn btn-dark">입력</button>
	</div>
</div>
<div class="d-flex justify-content-center mt-3 mb-5">
	<div class="bg-light comment-box">
		<div class="d-flex align-items-center mt-2">
			<div class="col-2 ml-4 p-0">닉네임1</div>
			<div class="col-1 mx-2 p-0">4.0</div>
			<div class="col-4 mx-2 p-0">좋은 책입니다. 강력추천!!!</div>
			<div class="col-2 mx-2 p-0">yyyy-mm-dd</div>
			<button type="button" id="commentUpdateBtn" class="btn btn-dark comment-btn ml-3 d-none">수정</button>
			<button type="button" id="commentDeleteBtn" class="btn btn-danger comment-btn ml-1 d-none">삭제</button>
		</div>
		
	</div>
</div>

<script>
$(document).ready(function() {
	// 상품 수량 감소
	$('#productCountDownBtn').on('click', function(e) {
		e.preventDefault;
		let productCount = $('#productCount').val().trim();
		if (productCount == "") {
			$('#productCount').val("1");
		}
		$('#productCount').val(productCount - 1);
		if (productCount - 1 < 1) {
			$('#productCount').val("1");
		}
	});	// 상품 수량 감소 끝
	
	// 상품 수량 증가
	$('#productCountUpBtn').on('click', function(e) {
		e.preventDefault;
		let productCount =  $('#productCount').val().trim();
		if (productCount == "") {
			$('#productCount').val("0");
		}
		productCount =  parseInt($('#productCount').val().trim());
		$('#productCount').val(productCount + 1);
		if (productCount >= 50) {
			$('#productCount').val("50");
			alert("상품의 최대수량은 50 입니다.");
		}
	});	// 상품 수량 증가 끝
	
	// 상품 수량 50 제한
	$('#productCount').on('keyup', function() {
		let productCount = $('#productCount').val().trim();
		if (productCount == "0") {
			alert("상품의 최소수량은 1 입니다.")
			$('#productCount').val("1");
		}
		if (productCount > 50) {
			alert("상품의 최대수량은 50 입니다.");
			$('#productCount').val("50");
		}
	});	// 상품 수량 50 제한 끝
	
	
});
</script>