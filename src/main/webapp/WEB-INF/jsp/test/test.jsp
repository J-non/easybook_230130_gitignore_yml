<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testApi</title>
</head>
<body>
	<div>
		<c:forEach var="book" items="${bookList}">
			${book.itemId}
			${book.author}
			<img src="${book.coverImgUrl}">
		</c:forEach>
	</div>
	
</body>
</html>

