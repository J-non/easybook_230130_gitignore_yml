<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyBook</title>

	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" type="text/css" href="/static/css/style.css">

</head>
<body>

	<div id="wrap" class="container">
		<header>
			<c:choose>
				<c:when test="${fn:contains(viewName, 'admin')}">
					<jsp:include page="../admin/adminHeader.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="../include/header.jsp" />
				</c:otherwise>
			</c:choose>
		</header>
		
		<section>
			<c:choose>
				<c:when test="${fn:contains(viewName, 'user') || fn:contains(viewName, 'non') || fn:contains(viewName, 'admin')}">
					<jsp:include page="../${viewName}.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="../include/searchBar.jsp" />			
					<jsp:include page="../${viewName}.jsp" />
				</c:otherwise>
			</c:choose>
		</section>
		
	</div>

</body>
</html>