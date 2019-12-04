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
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700,900&display=swap&subset=korean" rel="stylesheet">
		<link rel="stylesheet" href="resources/css/mainStyle.css">
		
</head>
<style>
div{
text-align: center;
}
</style>
<body>
	<div class="container col-12">
		<jsp:include page="../standard/headerMember.jsp" />
		<div class="row mt-2">
	    <div class="col d-none d-sm-block"></div>
		<!--            -->
		<div class="row line">
			<div class="col-md d-none d-md-block">후원고유번호</div>
			<div class="col-md d-none d-md-block">이름</div>
			<div class="col-md d-none d-md-block">결제금액</div>
			<div class="col-md d-none d-md-block">결제방법</div>
		</div>
		<div class="row line">
			<c:forEach items="${result}" var="dto">
				<div class="col-md d-none d-md-block">${dto.donateId }</div>
				<div class="col-md d-none d-md-block">${dto.name }</div>
				<div class="col-md d-none d-md-block">${dto.support }</div>
				<div class="col-md d-none d-md-block">${dto.payMethod }</div>
			</c:forEach>
		</div>


		<!--            -->
		     
	    <div class="col d-none d-sm-block"></div>
	</div>
		<jsp:include page="../standard/footer.jsp" />
	</div>
</body>
</html>