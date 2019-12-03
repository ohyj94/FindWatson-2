<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
</head>
<body>
			
				<div class="container">
					<jsp:include page="../standard/headerAdmin.jsp" />
					<!--            -->
					<div class="row">
						<div class="col-12 mb-3 center" id="article">
							<h1>비밀번호 변경</h1>
							<input type=password id=oriPw name=oriPw placeholder="기존 비밀번호"><br>
							<input type=password id=newPw name=newPw placeholder="새 비밀번호"><br>
							<button id= mdf>변경</button>
						</div>
					</div>
					<!--            -->
					<jsp:include page="../standard/footer.jsp" />
				</div>
			<script>
				$("#mdf").on("click",function(){
					$.ajax({
						url : "${pageContext.request.contextPath}/adminPwModify.admin",
						type:"post",
						data:{
							oriPw : $("#oriPw").val(),
							newPw : $("#newPw").val()
						},
						dataType:"Json"
					}).done(function(resp){
						if(resp.result){
							alert("비밀번호 변경이 완료되었습니다.");
							location.href = '${pageContext.request.contextPath}/main/indexAdmin.jsp';
						}else{
							alert("기존 비밀번호와 불일치합니다. 다시 시도해주십시오.")
						}
						console.log(resp.result);
					}).fail(function(){
						console.log("fail");
					});
				});
			</script>
</body>
</html>