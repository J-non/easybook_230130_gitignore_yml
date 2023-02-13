<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="d-flex justify-content-center">
	<div class="main-list form-control mb-5">
		<!-- 검색 카테고리명 -->
		<div class="d-flex category-title mb-2">
			<c:choose>
				<c:when test="${searchTarget eq 'All'}">
					<h4 class="mr-1">검색결과</h4>
					<div class="d-flex align-items-end">
						<small>통합검색</small>
					</div>
				</c:when>
				<c:when test="${searchTarget eq 'Book'}">
					<h4 class="mr-1">검색결과</h4>
					<div class="d-flex align-items-end">
						<small>국내도서</small>
					</div>
				</c:when>
				<c:when test="${searchTarget eq 'Foregin'}">
					<h4 class="mr-1">검색결과</h4>
					<div class="d-flex align-items-end">
						<small>외국도서</small>
					</div>
				</c:when>
			</c:choose>
		</div>
		<!-- 검색 결과 목록 -->
		<c:if test="${empty searchResultList}">
			<h3 class="text-dark font-weight-bold">검색 결과가 없습니다.</h3>
			<div class="text-dark font-weight-bold">입력한 검색어의 철자 또는 띄어쓰기가 정확한지 다시 한번 확인해 주세요.</div>
			<div class="text-dark font-weight-bold">검색어의 단어 수를 줄이거나, 보다 일반적인 검색어를 사용하여 검색해 보세요.</div>
		</c:if>
		<div class="box-gap d-flex flex-wrap">
			<c:forEach var="book" items="${searchResultList}">
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