<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-up-box mt-5 ml-5 pl-5">
		<h3>아이디 찾기</h3>
		<div class="d-flex align-items-center mt-3">
			<div class="col-1 ml-5 p-0">이름</div>
			<input type="text" id="name" class="form-control col-4" placeholder="이름">
		</div>
		<div class="d-flex align-items-center mt-3">
			<div class="col-1 ml-5 p-0">이메일</div>
			<input type="text" id="email" class="form-control col-4" placeholder="이메일">
		</div>
		<div class="d-flex justify-content-center">
			<button type="button" id="findLoginIdBtn" class="btn btn-dark mt-3">찾기</button>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#findLoginIdBtn').on('click', function() {
			let name = $('#name').val().trim();
			let email = $('#email').val().trim();
			
			if (name == "") {
				alert("이름을 입력해 주세요.");
				return;
			}
			
			if (email == "") {
				alert("이메일을 입력해 주세요.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/find_login_id"
				, data:{"name":name, "email":email}
			
				, success:function(data) {
					if (data.code == 1) {
						alert("회워님의 로그인 아이디는 : " + data.loginId + "입니다.");
						location.href = "/user/sign_in_view";
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