<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 상품 목록 -->
<div class="d-flex justify-content-center">
	<div class="main-list form-control mt-3 mb-5">
		<!-- 신간 목록 -->
		<div class="d-flex category-title mb-2">
			<h4 class="mr-1">신간소개</h4>
			<div class="d-flex align-items-end">
				<small><a href="/main/new_books">더보기></a></small>
			</div>
		</div>
		<div class="d-flex justify-content-around">
			<c:forEach var="book" items="${newBookList}">
				<div class="content-box" data-item-id="${book.itemId}">
					<!-- 표지 -->
					<div class="">
						<img src="${book.coverImgUrl}" alt="책 표지" width="150" height="190">
					</div>
					<!-- 제목 -->
					<div class="t-form">
						<c:choose>
							<c:when test="${fn:length(book.title) > 22}">
								${fn:substring(book.title,0,21)}...
							</c:when>
							<c:otherwise>
								${book.title}
							</c:otherwise>
						</c:choose>
					</div>
					<div class="i-form">
						<c:choose>
							<c:when test="${fn:length(book.author) > 9}">
								${fn:substring(book.author,0,8)}...
							</c:when>
							<c:otherwise>
								${book.author}
							</c:otherwise>
						</c:choose>
					</div>
					<div class="i-form">${book.publisher}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>


<!-- 국내도서 -->
<div class="d-flex justify-content-center">
	<div class="main-list form-control mb-5">
		<div class="d-flex category-title mb-2">
			<h4 class="mr-1">국내도서</h4>
			<div class="d-flex align-items-end">
				<small><a href="#">더보기></a></small>
			</div>
		</div>
		<div class="d-flex justify-content-around">
			<c:forEach var="book" items="${korBookList}">
				<div class="content-box" data-item-id="${book.itemId}">
					<!-- 표지 -->
					<div class="">
						<img src="${book.coverImgUrl}" alt="책 표지" width="150" height="190">
					</div>
					<!-- 제목 -->
					<div class="t-form">
						<c:choose>
							<c:when test="${fn:length(book.title) > 22}">
								${fn:substring(book.title,0,21)}...
							</c:when>
							<c:otherwise>
								${book.title}
							</c:otherwise>
						</c:choose>
					</div>
					<div class="i-form">
						<c:choose>
							<c:when test="${fn:length(book.author) > 9}">
								${fn:substring(book.author,0,8)}...
							</c:when>
							<c:otherwise>
								${book.author}
							</c:otherwise>
						</c:choose>
					</div>
					<div class="i-form">${book.publisher}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- 외국도서 -->
<div class="d-flex justify-content-center">
	<div class="main-list form-control mb-5">
		<div class="d-flex category-title mb-2">
			<h4 class="mr-1">외국도서</h4>
			<div class="d-flex align-items-end">
				<small><a href="/main/foreign_books">더보기></a></small>
			</div>
		</div>
		<div class="d-flex justify-content-around">
			<c:forEach var="book" items="${foreginBookList}">
				<div class="content-box" data-item-id="${book.itemId}">
					<!-- 표지 -->
					<div class="">
						<img src="${book.coverImgUrl}" alt="책 표지" width="150" height="190">
					</div>
					<!-- 제목 -->
					<div class="t-form">
						<c:choose>
							<c:when test="${fn:length(book.title) > 22}">
								${fn:substring(book.title,0,21)}...
							</c:when>
							<c:otherwise>
								${book.title}
							</c:otherwise>
						</c:choose>
					</div>
					<div class="i-form">
						<c:choose>
							<c:when test="${fn:length(book.author) > 9}">
								${fn:substring(book.author,0,8)}...
							</c:when>
							<c:otherwise>
								${book.author}
							</c:otherwise>
						</c:choose>
					</div>
					<div class="i-form">${book.publisher}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 상품 클릭 시 상품상세 화면으로
		$('.content-box').on('click', function() {
			let itemId = $(this).data('item-id');

			$.ajax({
				type:"get"
				, url:"/shop/detail_view"
				, data:{"itemId":itemId}
			
				, success:function() {
					location.href = "/shop/detail_view?itemId=" + itemId
				}
				, error:function(e) {
					alert(e);
				}
			});
		});	// 상품 클릭 시 상품상세 화면으로 끝
	});
</script>
