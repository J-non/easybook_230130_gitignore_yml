<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="mt-5">
		<!-- 기본정보 입력 -->
		<form id="signUpForm" method="post" action="/user/sign_up">
			<div class="d-flex sign-up-box">
				<div class="sign-up-title-box col-3 p-0">기본 정보 입력</div>
				<div class="col-8">
					<!-- 이름 -->
					<div class="d-flex mt-3 p-0">
						<div class="d-flex align-items-center col-3">
							이름
						</div>
						<input type="text" name="name" class="form-control col-3">
					</div>
					
					<!-- 아이디 -->
					<div class="d-flex mt-3 p-0">
						<div class="d-flex align-items-center col-3">
							아이디
						</div>
						<div class="d-flex col-7 p-0">
							<input type="text" name="loginId" class="form-control col-6 mr-2">
							<button type="button" id="loginIdCheckBtn" class="btn btn-dark">중복확인</button>
						</div>
					</div>
					
					<%-- 아이디 체크 결과 --%>
					<div class="d-flex">
						<div class="col-3"></div>
						<div class="col-7 p-0">
							<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
							<div id="idCheckKorean" class="small text-danger d-none">영어, 숫자만 입력 가능합니다.</div>
							<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
							<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
						</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="d-flex mt-3 p-0">
						<div class="d-flex align-items-center col-3">
							비밀번호
						</div>
						<input type="password" name="password" class="form-control col-6">
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="d-flex mt-3 p-0">
						<div class="d-flex align-items-center col-3">
							비밀번호 확인
						</div>
						<input type="password" name="confirmPassword" class="form-control col-6">
					</div>
					
					<!-- 이메일 -->
					<div class="d-flex mt-3 p-0">
						<div class="d-flex">
							<div class="d-flex align-items-center col-3"><!-- mr-3 -->
								이메일
							</div>
							<input type="text" name="email" class="form-control col-3"><!-- ml-4 -->
							<div class="d-flex align-items-center">
								<div>@</div>
							</div>
							<input type="text" class="form-control col-3" name="domain">
							<select id="domain" class="form-control col-3 ml-1 mr-5">
								<option value="direct" selected>직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>
						</div>
					<!-- <button type="button" id="emailCheckBtn" class="btn btn-dark">중복확인</button> -->
					</div>
					
					<%-- 이메일 체크 결과 --%>
					<!-- <div class="d-flex">
						<div class="col-3"></div>
						<div class="col-7 p-0">
							<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 이메일 입니다.</div>
							<div id="idCheckOk" class="small text-success d-none">사용이 가능합니다.</div>
						</div>
					</div> -->
					
					<!-- 전화번호 -->
					<div class="d-flex mt-3 p-0">
						<div class="d-flex align-items-center col-3">
							전화번호
						</div>
						<input type="text" name="phoneNumber" class="form-control col-6" placeholder="숫자만 입력해 주세요">
					</div>
				</div>
			</div>
			<hr>
			<!-- 부가 정보 입력 -->
			<div class="d-flex sign-up-box mt-3">
				<div class="sign-up-title-box col-3 p-0">
					<div>부가 정보 입력</div>
					<div>
						<small><small>(생략이 가능합니다)</small></small>
					</div>
				</div>
				<div class="col-8 mt-1">
					<div class="d-flex align-items-center col-3">
						배송지 주소
					</div>
					<div class="d-flex">
						<input type="text" name="postCode" class="form-control col-3 ml-3 mt-2" placeholder="우편번호" readonly>
					</div>
					<div>
						<input type="text" name="address" class="form-control col-8 ml-3 mt-2" placeholder="주소" readonly>
					</div>
					<div>
						<input type="text" name="detailAddress" class="form-control col-8 ml-3 mt-2" placeholder="상세주소">
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center mt-4">
				<button type="submit" id="signUpBtn" class="btn btn-dark">회원가입</button>
			</div>
		</form>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		// 카카오 주소찾기 API
		// 우편번호 클릭 시
		$('input[name=postCode]').on('click', function() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('input[name=postCode]').val(data.zonecode);
					$('input[name=address]').val(data.address);
					$('input[name=detailAddress]').focus();
				}
			}).open();
		});	// 우편번호 클릭 시 끝
		
		// 주소 클릭 시
		$('input[name=address]').on('click', function() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('input[name=postCode]').val(data.zonecode);
					$('input[name=address]').val(data.address);
					$('input[name=detailAddress]').focus();
				}
			}).open();
		});	// 주소 클릭 시 끝
		// 카카오 주소찾기 API 끝
		
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
				, url:"/user/is_duplicated_id"
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
					alert("중복 확인에 실패했습니다.");
				}
			});
		});	// 아이디 중복체크 끝
		
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
			const testPhoneNumber = /^[0-9]$/;
			
			let name = $('input[name=name]').val().trim();
			let loginId = $('input[name=loginId]').val().trim();
			let password = $('input[name=password]').val().trim();
			let confirmPassword = $('input[name=confirmPassword]').val().trim();
			let email = $('input[name=email]').val().trim();
			let domain = $('input[name=domain]').val().trim();
			let phoneNumber = $('input[name=phoneNumber]').val().trim();
			let emailAddress = email + "@" + domain;
			
			
			let postCode = $('input[name=postCode]').val();
			let address = $('input[name=address]').val().trim();
			let detailAddress = $('input[name=detailAddress]').val().trim();
			
			
			if (name == "") {
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
			
			if (phoneNumber == "") {
				alert("전화번호를 입력해주세요.");
				return false;
			}
			
			if (testPhoneNumber.test(phoneNumber) == false) {
				alert("전화번호는 숫자만 입력 가능합니다.");
				return false;
			}
			
			if ($('#idCheckOk').hasClass('d-none')) {
				alert("아이디 중복확인을 다시 해주세요.");
				return false;
			}
			
			if (postCode == "") {
				$('input[name=postCode]').val("");
				$('input[name=address]').val("");
				$('input[name=detailAddress]').val("");
			}
			
			let url = $(this).attr('action');
			let params = $(this).serialize();
			
			
			$.post(url, params)
			.done(function(data) {
				if (data.code == 1) {
					alert("가입을 환영합니다! 로그인 해주세요.");
					location.href = "/user/sign_in_view";
				} else {
					alert(data.errorMessage);
				}
			});
		});	// 회원가입 및 유효성 검사 끝
		
	})
</script>