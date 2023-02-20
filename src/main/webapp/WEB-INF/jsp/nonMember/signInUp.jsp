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
						<input type="text" id="loginId" class="form-control" placeholder="아이디를 입력하세요">
					</div>
					<div class="ml-3 pb-3">
						<input type="password" id="mPassword" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<button type="button" id="loginBtn" class="btn btn-dark text-white font-weight-bold ml-2" >로그인</button>
			</div>
			<div class="d-flex justify-content-center pb-3">
				<a href="#">아이디 찾기</a>
				<span class="mx-3">l</span>
				<a href="#">비밀번호 찾기</a>
			</div>
		</div>
	</div>
	<!-- 비회원 회원가입 -->
	<div class="non-box d-flex justify-content-start">
		<div>
		<h5>비회원 신규 주문</h5>
			
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
			<div class="d-flex justify-content-center mt-4">
				<button type="submit" id="signUpBtn" class="btn btn-dark">비회원 주문하기</button>
			</div>
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
	});
</script>