<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- 개인정보 -->
	<div class="col-10">
		<h4>회원정보</h4>
		<div class="border">
			<div class="d-flex align-items-start m-3">
				<div class="ml-3 col-2">아이디</div>
				<div class="">${user.loginId}</div>
			</div>
			<div class="d-flex align-items-start m-3">
				<div class="ml-3 col-2">이름</div>
				<div class="">${user.name}</div>
			</div>
			<div class="d-flex align-items-start m-3">
				<div class="ml-3 col-2">닉네임</div>
				<div class="">${user.nickname}</div>
				<input type="text" id="nickname" class="form-control col-3 d-none">
				<button type="button" class="toggleBtn btn btn-dark ml-3">변경하기</button>
				<button type="button" id="nicknameSaveBtn" class="saveBtn btn btn-dark ml-3 d-none">저장</button>
				<button type="button" class="cancelBtn btn btn-secondary ml-1 d-none">취소</button>
			</div>
			<div class="d-flex align-items-start m-3">
				<div class="ml-3 col-2">이메일 주소</div>
				<div class="">${user.email}</div>
			</div>
			<div class="d-flex align-items-start m-3">
				<div class="ml-3 col-2">기본 배송지</div>
				<c:choose>
					<c:when test="${user.postCode eq ''}">
						<div>기본 배송지 없음</div>
					</c:when>
					<c:otherwise>
						<div>
							<div>${user.postCode}</div>
							<div>${user.address}</div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- 주소검색 -->
				<div id="newAddress" class="d-none col-6">
					<input type="text" id="postCode" class="form-control col-4 ml-3 mt-2" placeholder="우편번호" readonly>
					<input type="text" id="address" class="form-control ml-3 mt-2" placeholder="주소" readonly>
					<input type="text" id="detailAddress" class="form-control ml-3 mt-2" placeholder="상세주소">
				</div>
				<button type="button" class="toggleBtn btn btn-dark ml-3">변경하기</button>
				<button type="button" id="addressSaveBtn" class="saveBtn btn btn-dark ml-3 d-none">저장</button>
				<button type="button" id="addressCancelBtn" class="cancelBtn btn btn-secondary ml-1 d-none">취소</button>
			</div>
			<div class="d-flex align-items-start m-3">
				<div class="ml-3 col-2">전화번호</div>
				<div class="">${user.phoneNumber}</div>
				<input type="text" id="phoneNumber" class="form-control col-3 d-none">
				<button type="button" class="toggleBtn btn btn-dark ml-3">변경하기</button>
				<button type="button" id="phoneNumberSaveBtn" class="saveBtn btn btn-dark ml-3 d-none">저장</button>
				<button type="button" class="cancelBtn btn btn-secondary ml-1 d-none">취소</button>
			</div>
			<div class="d-flex align-items-start m-3">
				<div class="ml-3 col-2">비밀번호</div>
				<div class="d-none"></div>
				<!-- 비밀번호 변경하기  -->
				<div id="" class="d-none col-4">
					<div>
						<input type="password" id="passwordCheck" class="form-control ml-3 mt-2" placeholder="기존 비밀번호">
					</div>
					<div>
						<input type="password" id="newPassword" class="form-control ml-3 mt-2" placeholder="새 비밀번호">
					</div>
					<div>
						<input type="password" id="newPasswordCheck" class="form-control ml-3 mt-2" placeholder="비밀번호 확인">
					</div>
				</div>
				<button type="button" class="toggleBtn btn btn-dark">비밀번호 변경하기</button>
				<button type="button" id="passwordSaveBtn" class="btn btn-dark ml-3 d-none">저장</button>
				<button type="button" id="passwordCancelBtn" class="cancelBtn btn btn-secondary ml-1 d-none">취소</button>
			</div>
		</div>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		// 변경하기 클릭 시 토글
		$('.toggleBtn').on('click', function() {
			$(this).prev().prev().addClass('d-none');
			$(this).prev().removeClass('d-none');
			$(this).addClass('d-none');
			$(this).next().removeClass('d-none');
			$(this).next().next().removeClass('d-none');
		});	// 변경하기 클릭 시 토글 끝
		
		// 취소 버튼 클릭 시 토글
		$('.cancelBtn').on('click', function() {
			$(this).addClass('d-none');
			$(this).prev().addClass('d-none');
			$(this).prev().prev().removeClass('d-none');
			$(this).prev().prev().prev().addClass('d-none');
			$(this).prev().prev().prev().val("");
			$(this).prev().prev().prev().prev().removeClass('d-none');
		}); // 취소 버튼 클릭 시 토글 끝
		
		// 주소, 비밀번호 초기화
		$('#addressCancelBtn').on('click', function() {
			$('#postCode').val("");
			$('#address').val("");
			$('#detailAddress').val("");
		});
		
		$('#passwordCancelBtn').on('click', function() {
			$('#passwordCheck').val("");
			$('#newPassword').val("");
			$('#newPasswordCheck').val("");
		});	// 주소, 비밀번호 초기화 끝
		
		
		// 카카오 주소찾기 API
		// 우편번호 클릭 시
		$('#postCode').on('click', function() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('#postCode').val(data.zonecode);
					$('#address').val(data.address);
					$('#detailAddress').focus();
				}
			}).open();
		});	// 우편번호 클릭 시 끝
		
		// 주소 클릭 시
		$('#address').on('click', function() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('#postCode').val(data.zonecode);
					$('#address').val(data.address);
					$('#detailAddress').focus();
				}
			}).open();
		});	// 주소 클릭 시 끝
		// 카카오 주소찾기 API 끝
		
		
		// 저장 버튼 클릭 시
		// 닉네임
		$('#nicknameSaveBtn').on('click', function() {
			let nickname = $('#nickname').val().trim();
			if (nickname == "") {
				alert("변경하실 닉네임을 입력해 주세요.");
				return;
			}
			$.ajax({
				type:"post"
				, url:"/user/update"
				, data:{"nickname":nickname}
				, success:function(data) {
					if (data.code == 1) {
						alert(data.result);
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("실패");
				}
			});
		});	// 닉네임 끝
		
		// 주소
		$('#addressSaveBtn').on('click', function() {
			let postCode = $('#postCode').val().trim();
			let address = $('#address').val().trim();
			let detailAddress = $('#detailAddress').val().trim();
			address = address + " " + detailAddress;
			if (postCode == "" || address == "") {
				alert("배송지 주소를 입력해 주세요");
				$('#postCode').val("");
				$('#address').val("");
				$('#detailAddress').val("");
				return;
			}
			if ($('#detailAddress').val() == "") {
				alert("상세주소를 입력해 주세요");
				return;
			}
			$.ajax({
				type:"post"
				, url:"/user/update"
				, data:{"postCode":postCode, "address":address}
				, success:function(data) {
					if (data.code == 1) {
						alert(data.result);
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("실패");
				}
			});
		});	// 주소 끝
		
		// 전화번호
		$('#phoneNumberSaveBtn').on('click', function() {
			const testPhoneNumber = /^[0-9]+$/;
			let phoneNumber = $('#phoneNumber').val().trim();
			if (phoneNumber == "") {
				alert("전화번호를 입력해 주세요");
				return;
			}
			if (testPhoneNumber.test(phoneNumber) == false) {
				alert("전화번호는 숫자만 입력 가능합니다.");
				return;
			}
			$.ajax({
				type:"post"
				, url:"/user/update"
				, data:{"phoneNumber":phoneNumber}
				, success:function(data) {
					if (data.code == 1) {
						alert(data.result);
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("실패");
				}
			});
		});	// 전화번호 끝
		
		// 비밀번호
		$('#passwordSaveBtn').on('click', function() {
			const testPassword = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			let passwordCheck = $('#passwordCheck').val().trim();
			let newPassword = $('#newPassword').val().trim();
			let newPasswordCheck = $('#newPasswordCheck').val().trim();
			if (passwordCheck == "") {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			if (newPassword == "") {
				alert("변경하실 비밀번호를 입력해주세요.");
				return;
			}
			if (newPasswordCheck == "") {
				alert("비밀번호 확인이 비어있습니다.");
				return;
			}
			if (testPassword.test(newPassword) == false) {
				alert("비밀번호는 특수문자/문자/숫자 포함 8~15자리로 구성되어야 합니다.");
				return;
			}
			if (newPassword != newPasswordCheck) {
				alert("비밀번호 확인이 일치하지 않습니다.");
				return;
			}
			$.ajax({
				type:"post"
				, url:"/user/update"
				, data:{"passwordCheck":passwordCheck, "newPassword":newPassword}
				, success:function(data) {
					if (data.code == 1) {
						alert(data.result);
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("실패");
				}
			});
		});	// 비밀번호 끝
		// 저장 버튼 클릭 시 끝
		
	});
</script>