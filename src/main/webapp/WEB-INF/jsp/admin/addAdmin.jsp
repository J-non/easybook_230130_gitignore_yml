<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center mt-5">
<!-- 카테고리 메뉴 -->
	<div class="category-menu col-2 border form-control">
		<div class="my-2">
			<a href="/admin/account_manage_view">계정 관리</a>
		</div>
		<div class="my-2">
			<a href="/admin/add_admin_view">신규 등록</a>
		</div>
	</div>
	<div class="mt-5">
		<!-- 기본정보 입력 -->
		<form id="signUpForm" method="post" action="/admin/add_admin">
			<div class="sign-up-box">
				<!-- 이름 -->
				<div class="d-flex mt-3 p-0">
					<div class="d-flex align-items-center col-3">이름</div>
					<input type="text" name="managerName" class="form-control col-3">
				</div>

				<!-- 아이디 -->
				<div class="d-flex mt-3 p-0">
					<div class="d-flex align-items-center col-3">아이디</div>
					<div class="d-flex col-7 p-0">
						<input type="text" name="loginId" class="form-control col-6 mr-2">
						<button type="button" id="loginIdCheckBtn" class="btn btn-dark">중복확인</button>
					</div>
				</div>

				<%-- 아이디 체크 결과 --%>
				<div class="d-flex">
					<div class="col-3"></div>
					<div class="col-7 p-0">
						<div id="idCheckLength" class="small text-danger d-none">ID를
							4자 이상 입력해주세요.</div>
						<div id="idCheckKorean" class="small text-danger d-none">영어,
							숫자만 입력 가능합니다.</div>
						<div id="idCheckDuplicated" class="small text-danger d-none">이미
							사용중인 ID입니다.</div>
						<div id="idCheckOk" class="small text-success d-none">사용
							가능한 ID 입니다.</div>
					</div>
				</div>

				<!-- 비밀번호 -->
				<div class="d-flex mt-3 p-0">
					<div class="d-flex align-items-center col-3">비밀번호</div>
					<input type="password" name="password" class="form-control col-6">
				</div>

				<!-- 비밀번호 확인 -->
				<div class="d-flex mt-3 p-0">
					<div class="d-flex align-items-center col-3">비밀번호 확인</div>
					<input type="password" name="confirmPassword"
						class="form-control col-6">
				</div>

				<div class="d-flex justify-content-center mt-4">
					<button type="submit" id="signUpBtn" class="btn btn-dark">관리자 계정 추가</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 로그인 id 중복체크
		$('#loginIdCheckBtn').on('click', function(e) {
			e.preventDefault();
			let loginId = $('input[name=loginId]').val().trim();
			
			const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			
			$('#idCheckLength').addClass('d-none');
			$('#idCheckKorean').addClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			
			if (korean.test(loginId)) {
				$('#idCheckKorean').removeClass('d-none');
				return;
			}
			
			if (loginId.length < 4) {
				$('#idCheckLength').removeClass('d-none');
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/admin/is_duplicated_id"
				, data:{"loginId":loginId}
			
				, success:function(data) {
					if (data.code == 1) {
						if (data.result) {
							$('#idCheckDuplicated').removeClass('d-none');
						} else {
							$('#idCheckOk').removeClass('d-none');
						}
					}
				}
				, error:function(e) {
					alert("아이디 중복 확인에 실패했습니다.");
				}
			});
		});	// 아이디 중복체크 끝
		
		// 회원가입 및 유효성 검사
		$('#signUpForm').on('submit', function(e) {
			e.preventDefault();
			const testPassword = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			let managerName = $('input[name=managerName]').val().trim();
			let loginId = $('input[name=loginId]').val().trim();
			let password = $('input[name=password]').val().trim();
			let confirmPassword = $('input[name=confirmPassword]').val().trim();
			
			if (managerName == "") {
				alert("이름을 입력해주세요.");
				return false;
			}
			
			if (loginId == "") {
				alert("아이디를 입력해주세요.");
				return false;
			}
			
			if (password == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			if (testPassword.test(password) == false) {
				alert("비밀번호는 특수문자/문자/숫자 포함 8~15자리로 구성되어야 합니다.");
				return false;
			}
			
			if (confirmPassword == "") {
				alert("비밀번호 확인이 비어있습니다.");
				return false;
			}
			
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			if ($('#idCheckOk').hasClass('d-none')) {
				alert("아이디 중복확인을 다시 해주세요.");
				return false;
			}
			
			let url = $(this).attr('action');
			let params = $(this).serialize();
			
			$.post(url, params)
			.done(function(data) {
				if (data.code == 1) {
					alert("관리자 계정 추가 완료.");
					location.href = "/admin/account_manage_view";
				} else {
					alert(data.errorMessage);
				}
			});
		});	// 회원가입 및 유효성 검사 끝
		
	});
</script>