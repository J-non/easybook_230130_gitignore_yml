<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="margin-box">
		<div class="d-flex">
			<div class="admin-select-box d-flex justify-content-center align-items-center bg-warning text-dark">관리자 로그인</div>
		</div>
		<!-- 회원 로그인 -->
		<div id="member" class="admin-login-box bg-warning">
			<div class="d-flex">
				<div class="col-9">
					<div class="ml-3 py-4">
						<input type="text" id="loginId" class="form-control" placeholder="아이디를 입력하세요">
					</div>
					<div class="ml-3 pb-3">
						<input type="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<button type="button" id="loginBtn" class="btn btn-dark text-white font-weight-bold ml-2" >로그인</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		// 엔터키 -> loginBtn
		$('#loginId').on('keyup', function(e) {
			if (e.keyCode == 13) {
				$('#loginBtn').trigger('click');
			}
		});
		
		$('#password').on('keyup', function(e) {
			if (e.keyCode == 13) {
				$('#loginBtn').trigger('click');
			}
		});	// 엔터키 -> loginBtn 끝
		
		$('#loginBtn').on('click', function() {
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val().trim();
			
			if (loginId == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			if (password == "") {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/admin/sign_in"
				, data:{"loginId":loginId, "password":password}
			
				, success:function(data) {
					if (data.code == 1) {
						location.href = "/admin/order_management_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("로그인 실패");
				}
			});
		});
	});
</script>