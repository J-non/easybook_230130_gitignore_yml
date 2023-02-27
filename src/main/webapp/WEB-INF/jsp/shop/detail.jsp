<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="d-flex justify-content-center my-4">
	<!-- 책 표지 -->
	<div class="d-flex justify-content-center col-4 p-0 detail-box">
		<img src="${book.coverImgUrl}" alt="책 표지" width="200" height="300">
	</div>
	<!-- 책 정보 -->
	<div id="itemId" class="d-none" data-item-id="${book.itemId}"></div>
	<div id="productData" class="d-none"
		data-title="${book.title}"
		data-author="${book.author}"
		data-publisher="${book.publisher}"
		data-pub-date="${book.pubDate}"
		data-price-standard="${book.priceStandard}"
		data-price-sales="${book.priceSales}"
		data-cover-img-url="${book.coverImgUrl}"></div>
	<div class="col-6 p-0 detail-box">
		<div>
			<h3 class="m-0">${book.title}</h3>
		</div>
		<div>
			<small>${book.author}</small> <small>${book.publisher}</small> <small>${book.pubDate}</small>
		</div>
		<div class="d-flex mt-2">
			<div class="col-2 p-0">정가</div>
			<div>
				<fmt:formatNumber value="${book.priceStandard}" pattern="#,###" />
				원
			</div>
		</div>
		<div class="d-flex">
			<div class="col-2 p-0">판매가</div>
			<h5>
				<fmt:formatNumber value="${book.priceSales}" pattern="#,###" />
				원
			</h5>
		</div>
		<div class="d-flex">
			<div class="col-2 p-0">평점</div>
			<div class="d-flex align-items-center">
				<c:forEach var="commentView" items="${commentViewList}"
					varStatus="status">
					<c:if test="${status.last}">
						<c:set var="rating" value="${commentView.averageRating}" />
						<fmt:parseNumber value="${reating}" pattern=".00" />
					</c:if>
				</c:forEach>
				<c:forEach begin="1" end="5">
					<c:choose>
						<c:when test="${rating > 1}">
							<img src="/static/img/star_fill.png" width="20" alt="star">
							<c:set var="rating" value="${rating - 1}" />
						</c:when>
						<c:when test="${rating < 1 and rating > 0}">
							<img src="/static/img/star_half.png" width="20">
							<c:set var="rating" value="${rating - rating}" />
						</c:when>
						<c:when test="${rating == 0}">
							<img src="/static/img/star_empty.png" width="20">
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			<c:forEach var="commentView" items="${commentViewList}"
				varStatus="status">
				<c:if test="${status.last}">
					<c:set var="rating" value="${commentView.averageRating}" />
				</c:if>
			</c:forEach>
			<div class="ml-2">
				<fmt:formatNumber value="${rating}" pattern=".00" />
			</div>
			<div class="ml-5">평균 판매량</div>
			<div class="ml-2">
				<fmt:formatNumber value="${book.salesPoint}" pattern="#,###" />
				권
			</div>
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
			<button id="productCountDownBtn" class="btn btn-secondary p-0 col-2"
				type="button">-</button>
			<input type="text" id="productCount" class="form-control col-3"
				value="1">
			<button id="productCountUpBtn" class="btn btn-secondary p-0 col-2"
				type="button">+</button>
		</div>
	</div>
</div>
<!-- 댓글 -->
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-start detail-box">
		<h5>댓글 및 평점</h5>
	</div>
</div>
<c:if test="${not empty userId}">
	<div class="d-flex justify-content-center">
		<div
			class="d-flex justify-content-center align-items-center detail-box">
			<div class="d-flex p-0">
				<div class="input-group">
					<button id="ratingDownBtn" class="btn btn-secondary p-0 col-2"
						type="button">-</button>
					<input id="rating" type="text" class="form-control col-4"
						value="0.0">
					<button id="ratingUpBtn" class="btn btn-secondary p-0 col-2"
						type="button">+</button>
				</div>
			</div>
			<textarea id="comment" class="form-control" rows="2" cols="90"></textarea>
			<button id="commentBtn" class="btn btn-dark" type="button">입력</button>
		</div>
	</div>
</c:if>
<!-- 댓글 목록 -->
<div class="d-flex justify-content-center mt-3 mb-5">
	<div class="bg-light comment-box">
		<c:forEach var="commentView" items="${commentViewList}"
			varStatus="status">
			<div class="d-flex align-items-start mt-2">
				<div class="col-2 ml-4 p-0">${commentView.user.nickname}</div>

				<div id="${status.count}A" class="col-1 mx-2 p-0">${commentView.comment.rating}</div>

				<input id="${status.count}B" type="text"
					class="reRating form-control col-1 mx-2 p-0 d-none">

				<div id="${status.count}C" class="col-4 mx-2 p-0">${commentView.comment.comment}</div>

				<textarea id="${status.count}D"
					class="updateComment form-control col-4 mx-2 p-0 d-none" rows="2"></textarea>

				<div class="col-2 mx-2 p-0">
					<fmt:formatDate value="${commentView.comment.updatedAt}"
						pattern="yyyy-MM-dd" />
				</div>

				<div id="${status.count}F" class="d-none"
					data-comment-id="${commentView.comment.id}"></div>

				<c:if test="${userId eq commentView.user.id}">
					<button type="button"
						class="commentUpdateBtn btn btn-dark comment-btn ml-3"
						data-status-count-a="${status.count}A"
						data-status-count-b="${status.count}B"
						data-status-count-c="${status.count}C"
						data-status-count-d="${status.count}D"
						data-status-count-e="${status.count}E">수정</button>
					<button id="${status.count}E" type="button"
						class="commitBtn btn btn-dark comment-btn ml-3 d-none"
						data-status-count-a="${status.count}A"
						data-status-count-b="${status.count}B"
						data-status-count-c="${status.count}C"
						data-status-count-d="${status.count}D"
						data-status-count-f="${status.count}F">적용</button>
					<button type="button"
						class="commentDeleteBtn btn btn-danger comment-btn ml-1"
						data-status-count-f="${status.count}F">삭제</button>
				</c:if>
			</div>
		</c:forEach>

	</div>
</div>

<script>
	$(document).ready(
			function() {
				// 상품 수량 감소
				$('#productCountDownBtn').on('click', function() {
					let productCount = $('#productCount').val().trim();
					if (productCount == "") {
						$('#productCount').val("1");
					}
					$('#productCount').val(productCount - 1);
					if (productCount - 1 < 1) {
						$('#productCount').val("1");
					}
				}); // 상품 수량 감소 끝

				// 상품 수량 증가
				$('#productCountUpBtn').on('click', function() {
					let productCount = $('#productCount').val().trim();
					if (productCount == "") {
						$('#productCount').val("0");
					}
					productCount = parseInt($('#productCount').val().trim());
					$('#productCount').val(productCount + 1);
					if (productCount >= 50) {
						$('#productCount').val("50");
						alert("상품의 최대수량은 50 입니다.");
					}
				}); // 상품 수량 증가 끝

				// 상품 수량 1 ~ 50 제한
				$('#productCount').on('keyup', function() {
					let onlyNum = /[0-9]/; 
					let productCount = $('#productCount').val().trim();
					if (!onlyNum.test(productCount)) {
						alert("숫자만 입력 가능합니다.");
						$('#productCount').val("1");
						return;
					}
					if (productCount == "0") {
						alert("상품의 최소수량은 1 입니다.")
						$('#productCount').val("1");
						return;
					}
					if (productCount > 50) {
						alert("상품의 최대수량은 50 입니다.");
						$('#productCount').val("50");
						return;
					}
				}); // 상품 수량 1 ~ 50 제한 끝

				// 평점 감소 버튼
				$('#ratingDownBtn').on('click', function() {
					let rating = $('#rating').val().trim();
					if (rating == "") {
						$('#rating').val("0.0");
						return;
					}
					rating = parseFloat(rating - 0.5).toFixed(1);
					rating = parseFloat(Math.ceil(rating * 2) / 2).toFixed(1);
					$('#rating').val(rating);
					if (rating.length == 1) {
						$('#rating').val(rating + .0);
					}
					if (rating - 0.5 < 0) {
						$('#rating').val("0.0");
					}
				}); // 평점 감소 버튼 끝

				// 평점 증가 버튼
				$('#ratingUpBtn').on(
						'click',
						function() {
							let rating = $('#rating').val().trim();
							if (rating == "") {
								$('#rating').val("0.0");
								return;
							}
							rating = parseFloat($('#rating').val().trim());
							let checkrating1 = /[\-0-9]+\.[0-4]+/
							let checkrating2 = /[\-0-9]+\.[6-9]+/
							if (checkrating1.test(rating)
									|| checkrating2.test(rating)) {
								rating = parseFloat(Math.ceil(rating * 2) / 2)
										.toFixed(1);
							}
							rating = parseFloat(rating + 0.5).toFixed(1);
							$('#rating').val(rating);
							if (rating > 5) {
								$('#rating').val("5.0");
								alert("평점은 최대 5.0점 까지 입력할 수 있습니다.");
							}
						}); // 평점 증가 버튼 끝

				// 평점 0.0 ~ 5.0 제한
				$('#rating').on(
						'keyup',
						function() {
							let rating = $('#rating').val().trim();
							if (rating < 0) {
								alert("평점의 최소값은 0.0입니다.");
								$('#rating').val("");
								return;
							}
							if (rating.length > 3) {
								alert("소수점 첫째 자리까지만 입력 가능합니다.");
								$('#rating').val("");
								return;
							}
							let checkrating1 = /[\-0-9]+\.[0-4]+/
							let checkrating2 = /[\-0-9]+\.[6-9]+/
							if (checkrating1.test(rating)
									|| checkrating2.test(rating)) {
								rating = parseFloat(Math.ceil(rating * 2) / 2)
										.toFixed(1);
								$('#rating').val(rating);
								return;
							}
						});

				$('#rating').on(
						'change',
						function() {
							let rating = $('#rating').val().trim();
							if (rating == "") {
								$('#rating').val("");
								return;
							}
							let checkrating3 = /[\-0-9]+\.[0-9]+/
							if (rating <= 5) {
								if (!checkrating3.test(rating)) {
									$('#rating').val(
											parseFloat(
													$('#rating').val().trim())
													.toFixed(1));
									return;
								}
							} else {
								alert("평점은 최대 5.0점 까지 입력할 수 있습니다.");
								$('#rating').val("5.0");
								return;
							}
						}); // 평점 0.0 ~ 5.0 제한 끝

				// 댓글 글자 수 제한
				$('#comment').on('keyup', function() {
					let comment = $('#comment').val().trim();
					if (comment.length > 256) {
						alert("댓글은 최대 256자 까지 입력 가능합니다.");
						comment = comment.substring(0, 256);
						$('#comment').val(comment);
						return;
					}
				}); // 댓글 글자 수 제한 끝

				// 댓글 쓰기
				$('#commentBtn').on('click', function() {
					let itemId = $('#itemId').data('item-id');
					let rating = $('#rating').val().trim();
					let comment = $('#comment').val().trim();

					if (comment == "") {
						alert("댓글 내용을 입력해주세요");
						return;
					}

					$.ajax({
						type : "post",
						url : "/comment/create",
						data : {
							"itemId" : itemId,
							"rating" : rating,
							"comment" : comment
						}

						,
						success : function(data) {
							if (data.code == 1) {
								location.reload();
							} else {
								alert(data.errorMessage);
							}
						},
						error : function(e) {
							alert("댓글 작성 실패");
						}
					});
				}); // 댓글 쓰기 끝

				// 댓글 수정
				// 수정 버튼 클릭 시 d-none 추가 및 제거
				$('.commentUpdateBtn').on('click', function() {
					let countA = $(this).data('status-count-a');
					let countB = $(this).data('status-count-b');
					let countC = $(this).data('status-count-c');
					let countD = $(this).data('status-count-d');
					let countE = $(this).data('status-count-e');
					$('div[id=' + countA + ']').addClass('d-none');
					$('input[id=' + countB + ']').removeClass('d-none');
					$('div[id=' + countC + ']').addClass('d-none');
					$('textarea[id=' + countD + ']').removeClass('d-none');
					$(this).addClass('d-none');
					$('button[id=' + countE + ']').removeClass('d-none');
				}); // 수정 버튼 클릭 시 d-none 추가 및 제거 끝

				// 평점 수정 0.0 ~ 5.0 제한
				$('.reRating').on(
						'keyup',
						function() {
							let rating = $(this).val().trim();
							if (rating < 0) {
								alert("평점의 최소값은 0.0입니다.");
								$(this).val("");
								return;
							}
							if (rating.length > 3) {
								alert("소수점 첫째 자리까지만 입력 가능합니다.");
								$(this).val("");
								return;
							}
							let checkrating1 = /[\-0-9]+\.[0-4]+/
							let checkrating2 = /[\-0-9]+\.[6-9]+/
							if (checkrating1.test(rating)
									|| checkrating2.test(rating)) {
								rating = parseFloat(Math.ceil(rating * 2) / 2)
										.toFixed(1);
								$(this).val(rating);
								return;
							}
						});
				$('.reRating').on(
						'change',
						function() {
							let rating = $(this).val().trim();
							if (rating == "") {
								$(this).val("");
								return;
							}
							let checkrating3 = /[\-0-9]+\.[0-9]+/
							if (rating <= 5) {
								if (!checkrating3.test(rating)) {
									$(this).val(
											parseFloat($(this).val().trim())
													.toFixed(1));
									return;
								}
							} else {
								alert("평점은 최대 5.0점 까지 입력할 수 있습니다.");
								$(this).val("");
								return;
							}
						}); // 평점 수정 0.0 ~ 5.0 제한 끝

				// 댓글 수정 글자 수 제한
				$('.updateComment').on('keyup', function() {
					let comment = $(this).val().trim();
					if (comment.length > 256) {
						alert("댓글은 최대 256자 까지 입력 가능합니다.");
						comment = comment.substring(0, 256);
						$(this).val(comment);
						return;
					}
				}); // 댓글 수정 글자 수 제한 끝

				// 적용 버튼 클릭 시 댓글, 평점 수정
				$('.commitBtn').on(
						'click',
						function() {
							let countA = $(this).data('status-count-a');
							let countB = $(this).data('status-count-b');
							let countC = $(this).data('status-count-c');
							let countD = $(this).data('status-count-d');
							let countF = $(this).data('status-count-f');

							let commentId = $('div[id=' + countF + ']').data(
									'comment-id');
							let itemId = $('#itemId').data('item-id');
							let rating = $('input[id=' + countB + ']').val()
									.trim();
							let comment = $('textarea[id=' + countD + ']')
									.val().trim();

							$.ajax({
								type : "post",
								url : "/comment/update",
								data : {
									"commentId" : commentId,
									"itemId" : itemId,
									"rating" : rating,
									"comment" : comment
								}

								,
								success : function(data) {
									if (data.code == 1) {
										location.reload();
									} else {
										alert(data.errorMessage);
									}
								},
								error : function(e) {
									alert("댓글 및 평점 수정 실패");
								}
							});
						}); // 적용 버튼 클릭 시 댓글, 평점 수정 끝

				// 댓글 삭제
				$('.commentDeleteBtn').on(
						'click',
						function() {
							let countF = $(this).data('status-count-f');

							let commentId = $('div[id=' + countF + ']').data(
									'comment-id');
							let itemId = $('#itemId').data('item-id');

							$.ajax({
								type : "delete",
								url : "/comment/delete",
								data : {
									"commentId" : commentId,
									"itemId" : itemId
								}

								,
								success : function(data) {
									if (data.code == 1) {
										location.reload();
									} else {
										alert(data.errorMessage);
									}
								},
								error : function(e) {
									alert("댓글 삭제 실패");
								}
							});
						}); // 댓글 삭제 끝
						
				// 장바구니 버튼
				$('#cartBtn').on('click', function() {
					let itemId = $('#itemId').data('item-id');
					let title = $('#productData').data('title');
					let author = $('#productData').data('author');
					let publisher = $('#productData').data('publisher');
					let pubDate = $('#productData').data('pub-date');
					let priceStandard = $('#productData').data('price-standard');
					let priceSales = $('#productData').data('price-sales');
					let coverImgUrl = $('#productData').data('cover-img-url');
					
					let productCount = $('#productCount').val().trim();
					
					$.ajax({
						type:"post"
						, url:"/cart/create"
						, data:{"itemId":itemId, "title":title, "author":author, "publisher":publisher,
							"pubDate":pubDate, "priceStandard":priceStandard, "priceSales":priceSales,
							"coverImgUrl":coverImgUrl, "productCount":productCount}
					
						, success:function(data) {
							if (data.code == 1) {
								alert("상품이 장바구니에 담겼습니다.");
								location.reload();
							} else {
								alert(data.errorMessage);
							}
						}
						, error:function(e) {
							alert("장바구니 생성 실패.");
						}
					});
				}); // 장바구니 버튼 끝
				
				// 바로구매 버튼
				$('#buyBtn').on('click', function() {
					let itemId = $('#itemId').data('item-id');
					let title = $('#productData').data('title');
					let author = $('#productData').data('author');
					let publisher = $('#productData').data('publisher');
					let pubDate = $('#productData').data('pub-date');
					let priceStandard = $('#productData').data('price-standard');
					let priceSales = $('#productData').data('price-sales');
					let coverImgUrl = $('#productData').data('cover-img-url');
					
					let productCount = $('#productCount').val().trim();
					
					$.ajax({
						type:"post"
						, url:"/cart/create"
						, data:{"itemId":itemId, "title":title, "author":author, "publisher":publisher,
							"pubDate":pubDate, "priceStandard":priceStandard, "priceSales":priceSales,
							"coverImgUrl":coverImgUrl, "productCount":productCount}
					
						, success:function(data) {
							if (data.code == 1) {
								$.ajax({
									type:"get"
									, url:"/shop/order_view"
								
									, success:function() {
										location.href = "/shop/order_view";
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
							alert("장바구니 생성 실패.");
						}
					});
				}); // 바로구매 버튼 끝
						
			});
</script>