<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
</head>
<body>
	<div class="container col-12">
	<jsp:include page="../standard/headerAdmin.jsp" />   
	<div class="row mt-2">	        
	        <!-- 중심내용 -->
		
		
		
		
		
			 <!-- 중심내용 -->	        
	</div>
	<jsp:include page="../standard/footer.jsp" />
	</div>
		
	<script>
//글쓰기 버튼
	$("#writeBtn").on("click",function(){
		location.href="${pageContext.request.contextPath}/admin/adminBoardExpertWrite.jsp";
	})
	</script>
</body>
</html>