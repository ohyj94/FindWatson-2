<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <title>찾아줘! 왓슨</title>

        <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
     
</head>
<body>
	<c:choose>
		<c:when test="${result > 0 }">
			<script>
		alert("회원가입 성공! 로그인 해주세요");
		location.href="${pageContext.request.contextPath}/member/login.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script>
		alert("회원가입 실패! 다시 해주세요.");
		location.href="${pageContext.request.contextPath}/member/signup.jsp";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>