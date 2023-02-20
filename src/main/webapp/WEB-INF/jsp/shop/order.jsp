<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center mt-4">
	<table class="table text-center border-0">
		<thead class="bg-secondary text-white">
			<tr>
				<th class="col-1 p-0">No.</th>
				<th class="col-4 p-0">상품명</th>
				<th class="col-2 p-0">가격</th>
				<th class="col-2 p-0">수량</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="border-0 p-2">
					1
				</td>
				<td class="border-0 p-2">
					상대적이며 절대적인 고양이 백과사전
				</td>
				<td class="border-0 p-2">
					<div>12,123원</div>
				</td>
				<td class="border-0 p-2">
					<div class="">
						1권
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-end cart-box">
		<button id="returnCartBtn" type="button" class="btn btn-dark text-white py-1">장바구니로 돌아가기</button>
	</div>
</div>
<div class="d-flex justify-content-center mt-4 ml-5">
	<div class="cart-box">
		<h5>배송지 정보 입력</h5>
		<!-- 주문인 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-center col-2">
				주문인
			</div>
			<input type="text" name="name" class="form-control col-3" placeholder="주문인 이름">
		</div>
		<!-- 전화번호 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-start col-2">
				전화번호
			</div>
			<div>
				<input type="text" name="phoneNumber" class="form-control mb-1" placeholder="숫자만 입력해 주세요">
				<div>주문/배송 관련 문자가 전송됩니다.</div>
			</div>
		</div>
		<!-- 받으시는 분 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-center col-2">
				받으시는 분
			</div>
			<input type="text" name="name" class="form-control col-3"  placeholder="받으시는 분 성함">
		</div>
		<!-- 배송지 선택 -->
		<div class="d-flex align-items-center mt-3 p-0">
			<div class="d-flex align-items-center col-2">
				배송지 선택
			</div>
			<input type="radio" name="address" id="default" checked>
			<label for="default" class="mr-4 mb-0">기본 배송지 주소</label>
			<input type="radio" name="address" id="new">
			<label for="new" class="m-0">새 주소 입력</label>
		</div>
		<!-- 배송지 주소 입력 -->
		<div class="d-flex mt-3 p-0">
			<div class="d-flex align-items-start col-2">
				주소
			</div>
			<div>
				<div>우편번호</div>
				<div>주소</div>
			</div>
			<!-- 새 주소 입력 시 보여짐 -->
			<div class="d-none">
				<div>
					<input type="text" name="postCode" class="form-control ml-3 mt-2" placeholder="우편번호" readonly>
				</div>
				<div>
					<input type="text" name="address" class="form-control ml-3 mt-2" placeholder="주소" readonly>
				</div>
				
				<div>
					<input type="text" name="detailAddress" class="form-control ml-3 mt-2" placeholder="상세주소">
				</div>
			</div>
		</div>
		<!-- 구매 버튼 -->
		<div class="d-flex justify-content-center mt-4">
			<button type="button" class="btn btn-dark col-3">결제하기</button>
		</div>
	</div>
</div>
