<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 검색창 -->
<div class="d-flex justify-content-center mt-4">
	<div class="search-box">
		<form action="/search/search_result" method="get">
			<div class="input-group mb-3">
				<div class="input-group-prepend col-2 p-0">
					<select class=" form-control search-category" name="searchTarget">
						<option selected value="All">통합검색</option>
						<option value="Book">국내도서</option>
						<option value="Foreign">외국도서</option>
					</select>
				</div>
				<input id="searchQuery" type="text" class="form-control col-9 border-start-0" name="query" placeholder="검색어는 띄어쓰기 없이 입력해 주세요">
				<div class="input-group-append">
					<button id="searchBtn" class="btn btn-secondary" type="submit">검색</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
	/* 	$('#searchBtn').on('click', function(e) {
			e.preventDefault();
			let searchTarget = $('.search-category').val();
			let query = $('#searchQuery').val().trim();
			
			location.href = "/search/search_result?searchTarget=" + searchTarget + "&query=" + query
			
		}) */
	});
</script>