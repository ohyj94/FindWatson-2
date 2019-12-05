<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
<style>
#board-top {
text-align: left !important;
}
div input{
width:220px;
height:40px;
border:none;
border-bottom: 1px solid gray;
}
input::placeholder{
color: #a6a6a680;
}
#article{
min-height: 720px;
}
</style>
</head>
<body>
	<div class="container col-12">	
	<jsp:include page="../standard/headerAdmin.jsp" />   	     
	<div class="row mt-2">	        
	        <!--  -->
	        
	  <div class=container>
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<div id="board-top" class="col-12 m-0"><strong>비밀번호 변경</strong></div>							
						</div>
						<hr>
						<div class="row">
							<div class="col-12 m-1 text-center"><input type=password id=oriPw name=oriPw placeholder="기존 비밀번호"></div>
							<div class="col-12 m-1 text-center"><input type=password id=newPw name=newPw placeholder="새 비밀번호"></div>
							<div class="col-12 mt-4 p-0 text-center"><button id= mdf class="btn btn-outline-secondary">변경</button></div>
						</div>																
					</div>
				</div>
			</div>
		</div>
		</div>
		
		 <!--  -->	        
	</div>
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
					}).fail(function(){
						console.log("fail");
					});
				});
			</script>
</body>
</html>