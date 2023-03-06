<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center mt-5 ml-1">
	<!-- 비회원 로그인 -->
	<div class="non-box d-flex justify-content-start">
		<div>
			<h5>비회원 재주문</h5>
			<div class="d-flex">
				<div class="col-9">
					<div class="ml-3 py-4">
						<input type="text" id="loginEmail" class="form-control" placeholder="이메일 주소를 입력하세요">
					</div>
					<div class="ml-3 pb-3">
						<input type="password" id="nMPassword" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<button type="button" id="loginBtn" class="btn btn-dark text-white font-weight-bold ml-2" >로그인</button>
			</div>
		</div>
	</div>
	<!-- 비회원 회원가입 -->
	<div class="non-box d-flex justify-content-start">
		<div>
		<h5>비회원 신규 주문</h5>
		<form id="signUpForm" method="post" action="/non_member/sign_up">
			<!-- 이름 -->
			<div class="d-flex mt-3 p-0">
				<div class="d-flex align-items-center col-3 p-0">
					이름
				</div>
				<input type="text" name="name" class="form-control col-7">
			</div>
			<!-- 비밀번호 -->
			<div class="d-flex mt-3 p-0">
				<div class="d-flex align-items-center col-3 p-0">
					비밀번호
				</div>
				<input type="password" name="password" class="form-control col-7">
			</div>
			<!-- 비밀번호 확인 -->
			<div class="d-flex mt-3 p-0">
				<div class="d-flex align-items-center col-3 p-0">
					비밀번호 확인
				</div>
				<input type="password" name="confirmPassword" class="form-control col-7">
			</div>
			<!-- 이메일 -->
			<div class="d-flex mt-3 p-0">
				<div class="d-flex">
					<div class="d-flex align-items-center col-3 p-0">
						이메일
					</div>
					<input type="text" name="email" class="form-control col-3">
					<div class="d-flex align-items-center">
						<div>@</div>
					</div>
					<input type="text" class="form-control col-3" name="domain">
					<select id="domain" class="form-control col-4 ml-1 mr-5">
						<option value="direct" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</div>
			</div>
			<%-- 이메일 체크 결과 --%>
			<div class="d-flex">
				<div class="col-3"></div>
				<div class="col-7 p-0">
					<div id="emailCheckDuplicated" class="small text-danger d-none">이전 비회원 주문시 등록된 이메일 주소입니다. 왼쪽의 '비회원 재주문하기'를 이용해주세요.</div>
					<div id="emailCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
				</div>
			</div>
			<div class="d-flex justify-content-center mt-4">
				<button type="submit" id="signUpBtn" class="btn btn-dark">비회원 주문하기</button>
			</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 도메인 value 변경
		$('#domain').on('change', function() {
			let domain = $(this).val();
			
			if (domain == "direct") {
				$('input[name=domain]').attr('readonly', false);
				$('input[name=domain]').val("");
			} else {
				$('input[name=domain]').val(domain);
				$('input[name=domain]').attr('readonly', true);
			}
		}); // 도메인 value 변경 끝
		
		
		// 회원가입 및 유효성 검사
		$('#signUpForm').on('submit', function(e) {
			e.preventDefault();
			
			const testEmail = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
			const testPassword = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			const testPhoneNumber = /^[0-9]+$/;
			
			let name = $('input[name=name]').val().trim();
			let password = $('input[name=password]').val().trim();
			let confirmPassword = $('input[name=confirmPassword]').val().trim();
			let email = $('input[name=email]').val().trim();
			let domain = $('input[name=domain]').val().trim();
			let emailAddress = email + "@" + domain;
			
			if (name == "") {
				alert("이름을 입력해주세요.");
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
			
			if (email == "") {
				alert("이메일 주소를 입력해주세요.");
				return false;
			}
			
			if (domain == "") {
				alert("이메일 주소를 입력해주세요.");
				return false;
			}
			
			if (testEmail.test(emailAddress) == false) {
				alert("올바르지 않은 이메일 주소 입니다.");
				//alert(emailAddress);
				return false;
			}
			
			$('#emailCheckOk').addClass('d-none');
			$('#emailCheckDuplicated').addClass('d-none');
			
			let url = $(this).attr('action');
			let params = $(this).serialize();
			
			$.post(url, params)
			.done(function(data) {
				if (data.result == true) {
					$('#emailCheckDuplicated').removeClass('d-none');
				} else if (data.code == 1){
					location.href = "/shop/cart_view";
				} else if (data.code == 500) {
					alert(data.errorMessage);
				}
			});
		});	// 회원가입 및 유효성 검사 끝
		
		// 비회원 재주문
		$('#loginBtn').on('click', function() {
			let email = $('#loginEmail').val().trim();
			let password = $('#nMPassword').val().trim();
			
			if (email == "") {
				alert("이메일 주소를 입력해주세요.");
				return;
			}
			if (password == "") {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/non_member/sign_in"
				, data:{"email":email, "password":password}
			
				, success:function(data) {
					if (data.code == 1) {
						location.href = "/main/home";
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("로그인 실패");
				}
			});
		}); // 비회원 재주문 끝
	});
</script>