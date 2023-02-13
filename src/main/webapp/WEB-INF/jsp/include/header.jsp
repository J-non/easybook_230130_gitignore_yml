<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header d-flex bg-secondary justify-content-between">
	<!-- 메인 로고 -->
	<div class="d-flex align-items-center ml-3 font-weight-bold">
		<h3>
			<a href="/main/home" class="text-white">EasyBook</a>
		</h3>
		<!-- 카테고리 -->
		<nav class="ml-3">
			<ul class="nav">
				<li class="nav-item"><a href="/main/new_books"
					class="nav-link category text-white">신간도서</a></li>
				<li class="nav-item"><a href="/main/kor_books"
					class="nav-link category text-white">국내도서</a></li>
				<li class="nav-item"><a href="/main/foreign_books"
					class="nav-link category text-white">외국도서</a></li>
			</ul>
		</nav>
	</div>
	<div class="d-flex align-items-center">
		<nav class="mr-2">
			<ul class="nav">
				<li class="nav-item"><a href="/user/sign_in_view"
					class="nav-link px-1 menu2 text-white">로그인</a></li>
				<li class="nav-item"><a href="/user/sign_up_view"
					class="nav-link px-1 menu2 text-white">회원가입</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-1 menu2 text-white">마이페이지</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-1 menu2 text-white">장바구니</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-1 menu2 text-white">고객센터</a></li>
			</ul>
		</nav>
	</div>
</div>