<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<!-- 계정 목록 -->
	<div class="col-10">
	<table class="table text-center border-0">
		<thead class="bg-warning text-dark">
			<tr>
				<th class="col-2">아이디</th>
				<th class="col-2">이름</th>
				<th class="col-4">권한</th>
				<th class="col-2">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="admin" items="${adminList}">
			<tr>
				<td class="p-0">
					<div class="admin-box d-flex justify-content-center align-items-center">
						${admin.loginId}
					</div>
				</td>
				<td class="p-0">
					<div class="admin-box d-flex justify-content-center align-items-center">
						${admin.managerName}
					</div>
				</td>
				<td class="p-0">
					<div class="admin-box d-flex justify-content-center align-items-center">
						<a href="#" class="toggleBtn">${admin.authority}</a>
						<select class="d-none form-control col-5">
							<option value="선택" selected>--선택--</option>
							<option value="all">all</option>
							<option value="t2">t2</option>
						</select>
						<button type="button" class="submitBtn btn btn-dark d-none ml-1" data-admin-id="${admin.id}">적용</button>
						<button type="button" class="cancelBtn btn btn-secondary d-none ml-1">취소</button>
					</div>
				</td>
				<td class="admin-box d-flex justify-content-center align-items-center p-0">
					<c:choose>
						<c:when test="${admin.id eq 1}">
							삭제불가
						</c:when>
						<c:otherwise>
							<button type="button" class="deleteBtn btn btn-sm btn-danger" data-admin-id="${admin.id}">삭제</button>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.toggleBtn').on('click', function(e) {
			e.preventDefault;
			$(this).addClass('d-none');
			$(this).next().removeClass('d-none');
			$(this).next().next().removeClass('d-none');
			$(this).next().next().next().removeClass('d-none');
		});
		
		$('.cancelBtn').on('click', function() {
			$(this).addClass('d-none');
			$(this).prev().addClass('d-none');
			$(this).prev().prev().addClass('d-none');
			$(this).prev().prev().prev().removeClass('d-none');
		});
		
		$('.submitBtn').on('click', function() {
			let adminId = $(this).data('admin-id');
			let authority = $(this).prev().val();
			if (authority == "선택") {
				alert("권한을 선택해 주세요.");
				return;
			}
			$.ajax({
				type:"post"
				, url:"/admin/update"
				, data:{"adminId":adminId, "authority":authority}
			
				, success:function(data) {
					if (data.code == 1) {
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("실패");
				}
			});
		});
		
		$('.deleteBtn').on('click', function() {
			let adminId = $(this).data('admin-id');
			
			$.ajax({
				type:"delete"
				, url:"/admin/delete"
				, data:{"adminId":adminId}
			
				, success:function(data) {
					if (data.code == 1) {
						location.reload();
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