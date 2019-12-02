<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘! 왓슨</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div id="loginBox" class="col-12 col-md-4">
			<form action="${pageContext.request.contextPath}/login.admin" method="post">
				<div class="inputs col-12">
					<input type="text" name="id" placeholder="아이디를 입력하세요">
					<input type="password" name="pw" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="btnArea col-12">
					<button>로그인</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>