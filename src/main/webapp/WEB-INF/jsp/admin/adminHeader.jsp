<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header d-flex bg-warning justify-content-between">
	<!-- 메인 로고 -->
	<div class="d-flex align-items-center ml-3 font-weight-bold">
		<h3 class="text-dark">
			EasyBook admin
<!-- 			<a href="#" class="text-white">EasyBook admin</a> -->
		</h3>
		<!-- 카테고리 -->
		<c:if test="${not empty adminId}">
			<nav class="ml-3">
				<ul class="nav">
					<li class="nav-item"><a href="/admin/order_management_view"
						class="nav-link admin-category text-dark">주문관리</a></li>
<!-- 					<li class="nav-item"><a href="#" -->
<!-- 						class="nav-link admin-category text-dark">리뷰관리</a></li> -->
					<c:if test="${adminAuthority eq 'all'}">
						<li class="nav-item"><a href="/admin/account_manage_view"
							class="nav-link admin-category text-dark">관리자 계정 관리</a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>
	</div>
	<div class="d-flex align-items-center">
		<nav class="mr-2">
			<ul class="nav">
				<c:choose>
					<c:when test="${not empty adminId}">
						<li class="nav-item"><a href="/admin/sign_out"
							class="nav-link px-1 menu2 text-dark">접속해지</a></li>
						<li class="nav-item px-1 menu2 text-dark"><a href="#"
							class="nav-link px-1 menu2 text-dark">${adminManagerName}</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item px-1 menu2 text-dark font-weight-bold"><a href="#"
							class="nav-link px-1 menu2 text-dark">관리자 페이지</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</div>