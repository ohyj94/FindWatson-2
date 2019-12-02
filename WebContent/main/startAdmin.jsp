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
<link rel="stylesheet" href="../resources/css/adminBoard.css">
</head>
<body>

				<div class="container">			
					<!--            -->
					<div class="row">관리자 로그인</div>
					<form action="${pageContext.request.contextPath}/login.admin" method="post">
					<div class="row">
						<div class="col-12 mb-3 center" id="article">
							<input type=text placeholder="아이디를 입력해주세요" name=id><br>
							<input type=text placeholder="비밀번호를 입력해주세요" name=pw><br>
							<button>로그인</button>
						</div>
					</div>
					</form>
					<!--            -->
				</div>

</body>
</html>