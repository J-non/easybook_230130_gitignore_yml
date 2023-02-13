<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="d-flex justify-content-center">
	<!-- 카테고리 메뉴 -->
	<div class="category-menu col-2 border form-control">
		<div><a href="#" class="category-btn" data-category-id="90831" data-category-name="가정/원예/인테리어">가정/원예/인테리어</a></div>
		<div><a href="#" class="category-btn" data-category-id="90833" data-category-name="건강/스포츠">건강/스포츠</a></div>
		<div><a href="#" class="category-btn" data-category-id="90835" data-category-name="경제경영">경제경영</a></div>
		<div><a href="#" class="category-btn" data-category-id="90837" data-category-name="교육/자료">교육/자료</a></div>
		<div><a href="#" class="category-btn" data-category-id="90838" data-category-name="기술공학">기술공학</a></div>
		<div><a href="#" class="category-btn" data-category-id="90845" data-category-name="에세이">에세이</a></div>
		<div><a href="#" class="category-btn" data-category-id="90846" data-category-name="여행">여행</a></div>
		<div><a href="#" class="category-btn" data-category-id="90847" data-category-name="역사">역사</a></div>
		<div><a href="#" class="category-btn" data-category-id="90848" data-category-name="예술/대중문화">예술/대중문화</a></div>
		<div><a href="#" class="category-btn" data-category-id="90855" data-category-name="자연과학">자연과학</a></div>
	</div>
	<!-- 상품 리스트 -->
	<div class="col-10">
		<div class="d-flex justify-content-center">
			<div class="main-list form-control mb-5">
				<div class="d-flex category-title mb-2">
					<h4 class="mr-1">외국도서</h4>
					<div class="d-flex align-items-end">
						<small>${categoryName}</small>
					</div>
				</div>
				<div class="box-gap d-flex flex-wrap">
					<c:forEach var="book" items="${foreignBookList}">
						<a href="#"><div class="content-box">
							<!-- 표지 -->
							<div class="">
								<img src="${book.coverImgUrl}" alt="책 표지" width="150"
									height="190">
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
						</div></a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 카테고리 버튼
		$('.category-btn').on('click', function(e) {
			e.preventDefault();
			let categoryId = $(this).data('category-id');
			let categoryName = $(this).data('category-name');
			
			location.href = "/main/foreign_books?categoryId=" + categoryId + "&categoryName=" + categoryName
		});	// 카테고리 버튼 끝
		
	});
</script>