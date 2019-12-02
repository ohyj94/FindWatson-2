<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘! 왓슨</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<c:choose>
		<c:when test="${result > 0 }">
			<script>
			alert("탈퇴완료");
			</script>
		</c:when>
		<c:otherwise>
			<script>
			alert("탈퇴실패. 관리자에게 문의하세요.")
			</script>
		</c:otherwise>
	</c:choose>
	<script>
	location.href = "${pageContext.request.contextPath }/main/index.jsp";
	</script>
</body>
</html>