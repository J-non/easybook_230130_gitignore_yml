<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<!-- 카테고리 메뉴 -->
	<div class="category-menu col-2 border form-control">
		<div class="my-3">
			<a href="/account/order_history_view" class="category-btn">주문내역</a>
		</div>
		<div>
			<a href="/account/password_confirm_view" class="category-btn">회원정보 관리</a>
		</div>
	</div>
	<!-- 비밀번호 재확인 -->
	<div class="col-10 m-4">
		<h4>비밀번호 재확인</h4>
		<div class="ml-3">-개인정보 보호를 위해 비밀번호를 다시 확인합니다.</div>
		<div class="bg-light border">
			<div class="d-flex align-items-center my-3">
				<div class="col-2 ml-3">아이디</div>
				<div class="col-9 p-0">${loginId}</div>
			</div>
			<div class="d-flex align-items-center mb-3">
				<div class="col-2 ml-3">비밀번호</div>
				<div class="col-3 p-0"><input type="password" id="password" class="form-control"></div>
				<button type="button" id="checkBtn" class="btn btn-dark ml-2" data-login-id="${loginId}">확인</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#checkBtn').on('click', function() {
			let loginId = $(this).data('login-id');
			let password = $('#password').val().trim();
			
			if (password == "") {
				alert("비밀번호를 입력해 주세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/password_check"
				, data:{"loginId":loginId, "password":password}
			
				, success:function(data) {
					if (data.code == 1) {
						location.href = "/account/customer_info_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("실패");
				}
			});
		});
	});
</script>