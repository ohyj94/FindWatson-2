<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	alert("비밀번호가 변경되지 않았습니다. 정확한 비밀번호를 입력해주세요.")
	location.href = '${pageContext.request.contextPath}/toMain.main';
	</script>
</body>
</html> 