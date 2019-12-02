<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘! 왓슨</title>
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
	href="../resources/css/adminBoard.css">

</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.adminInfo == null}">
			<form action="${pageContext.request.contextPath}/login.admin"
				method="post">
				<div class="container">
					<div class="row mb-2">
						<div id="loginBtn" class="col-12 p-1 text-right"></div>
					</div>
					<div class="row">
						<div id="title" class="col-12 mb-3 p-1 text-center">
							<a id=home><img id="logo"
								src="${pageContext.request.contextPath}/imgs/logo.png"
								class="col-12"></a>
						</div>
					</div>
					<!--            -->
					<div class="row">
						<div class="col-12 mb-3 center" id="article">
							<input type=text placeholder="아이디를 입력해주세요" name=id><br>
							<input type=text placeholder="비밀번호를 입력해주세요" name=pw><br>
							<button>로그인</button>
						</div>
					</div>
					<!--            -->
					<jsp:include page="../standard/footer.jsp" />
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div class="container">
				<jsp:include page="../standard/headerAdmin.jsp" />
				<!--            -->
				<div class=row>
					<div class="col-12 center">
						<h1>
							<br> <br>
						</h1>
						<h1>관리자 계정입니다.</h1>
						<h3>어서오세요.</h3>
						<h1>
							<br> <br>
						</h1>
					</div>
				</div>
				<!--            -->
				<jsp:include page="../standard/footer.jsp" />
			</div>
		</c:otherwise>

	</c:choose>
</body>
</html>