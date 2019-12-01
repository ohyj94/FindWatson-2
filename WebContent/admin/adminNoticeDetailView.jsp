<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
</head>
<body>
	<div class=container>
		<jsp:include page="../standard/headerAdmin.jsp"/>
		<!--  -->
		<div class=row>
			<div class=col-12>
				<h3>공지사항</h3>
				<h4>${dto.title}</h4>
				<h5 class=right>${dto.getDate()} &emsp; view.${dto.viewCount}</h5>
				<hr>
			</div>
		</div>
		<div class=row>
			<div class=col-12 id=boardContent>${dto.content}</div>
		</div>
		<!--  -->
		<jsp:include page="../standard/footer.jsp" />
	</div>
</body>
</html>