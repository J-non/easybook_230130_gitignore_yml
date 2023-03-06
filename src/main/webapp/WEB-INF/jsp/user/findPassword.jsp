<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-up-box mt-5">
		<h4>비밀번호 찾기</h4>
		<!-- 아이디 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-center col-2">아이디</div>
			<div class="d-flex col-10 p-0">
				<input type="text" id="loginId" class="form-control col-3 mr-2">
			</div>
		</div>

		<!-- 이름 -->
		<div class="d-flex mt-3 p-0 mb-3">
			<div class="d-flex align-items-center col-2">이름</div>
			<div class="d-flex col-10 p-0">
				<input type="text" id="name" class="form-control col-3">
			</div>
		</div>
		
		<!-- 전화번호 -->
		<div class="d-flex mt-3 p-0 mb-3">
			<div class="d-flex align-items-center col-2">전화번호</div>
			<div class="d-flex col-10 p-0">
				<input type="text" id="phoneNumber" class="form-control col-3">
			</div>
		</div>

	<button type="button" id="findPasswordBtn" class="btn btn-dark">비밀번호 찾기</button>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#findPasswordBtn').on('click', function() {
			let loginId = $('#loginId').val().trim();
			let name = $('#name').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			if (loginId == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			
			if (name == "") {
				alert("이름을 입력해주세요.");
				return;
			}
			
			if (phoneNumber == "") {
				alert("전화번호를 입력해주세요.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/find_password"
				, data:{"loginId":loginId, "name":name, "phoneNumber":phoneNumber}
			
				, success:function(data) {
					if (data.code == 1) {
						alert(data.userName + "님의 임시 비밀번호는 " + data.tempPassword + " 입니다");
						location.href = "/user/sign_in_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error(e) {
					alert("실패");
				}
			});
		});
	});
</script>