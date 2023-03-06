<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="margin-box">
		<!-- 회원 로그인, 비회원 주문조회 토글상자 -->
		<div class="d-flex">
			<div class="login-select-box d-flex justify-content-center align-items-center" value="y">회원 로그인</div>
			<div class="login-select-box d-flex justify-content-center align-items-center border-left border-bottom" value="n">비회원 주문조회</div>
		</div>
		<!-- 회원 로그인 -->
		<div id="member" class="login-box">
			<div class="d-flex">
				<div class="col-9">
					<div class="ml-3 py-4">
						<input type="text" id="loginId" class="form-control" placeholder="아이디를 입력하세요">
					</div>
					<div class="ml-3 pb-3">
						<input type="password" id="mPassword" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<button type="submit" id="loginBtn" class="btn btn-dark text-white font-weight-bold ml-2" >로그인</button>
			</div>
			<div class="d-flex justify-content-center">
				<a href="/user/find_login_id_view">아이디 찾기</a>
				<span class="mx-3">l</span>
				<a href="/user/find_password_view">비밀번호 찾기</a>
			</div>
			<div class="d-flex justify-content-center my-3 pb-3">
				<a href="/user/sign_up_view"><button type="button" id="signUpBtn" class="btn btn-dark text-white">회원가입</button></a>
			</div>
		</div>
		<!-- 비회원 주문조회 -->
		<div id="nonMember" class="login-box d-none">
			<div class="d-flex">
				<div class="col-9">
					<div class="ml-3 py-4">
						<input type="text" id="email" class="form-control" placeholder="이메일 주소를 입력하세요">
					</div>
					<div class="ml-3 pb-3">
						<input type="password" id="nMPassword" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<button type="button" id="nMLoginBtn" class="btn btn-dark text-white font-weight-bold ml-2" >조회하기</button>
			</div>
			<div class="d-flex justify-content-center my-3 pb-3">
				<a href="/non_member/sign_up_view"><button type="button" id="nMSignUpBtn" class="btn btn-dark text-white">비회원 주문하기</button></a>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 회원 로그인, 비회원 주문조회 토글
		$('.login-select-box').on('click', function() {
			$(this).removeClass('border-bottom');
			$(this).next().addClass('border-bottom');
			$(this).prev().addClass('border-bottom');
			let aaa = $(this).attr('value');
			
			if (aaa == 'y') {
				$('#nonMember').addClass('d-none');
				$('#member').removeClass('d-none');
			} else {
				$('#nonMember').removeClass('d-none');
				$('#member').addClass('d-none');
			}
		});	// 회원 로그인, 비회원 주문조회 끝
		
		// 엔터키 -> loginBtn
		$('#loginId').on('keyup', function(e) {
			if (e.keyCode == 13) {
				$('#loginBtn').trigger('click');
			}
		});
		
		$('#mPassword').on('keyup', function(e) {
			if (e.keyCode == 13) {
				$('#loginBtn').trigger('click');
			}
		});	// 엔터키 -> loginBtn 끝
		
		// loginBtn 로그인
		$('#loginBtn').on('click', function(e) {
			let loginId = $('#loginId').val().trim();
			let password = $('#mPassword').val().trim();
			
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
				, url:"/user/sign_in"
				, data:{"loginId":loginId, "password":password}
			
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
		}); // 로그인 끝
		
		// 비회원 주문조회
		$('#nMLoginBtn').on('click', function() {
			let email = $('#email').val().trim();
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
						location.href = "/account/order_history_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("로그인 실패");
				}
			});
		});	// 비회원 주문조회 끝
		
	});
</script>