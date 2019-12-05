<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
<%--부트 스트랩 --%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="resources/css/mainStyle.css">

<style>
div{
text-align: center;
}
#tmpId{
display: none;
}
</style>
</head>
<body>

<!-- container -->
	<div class="container col-12">
	
	<!-- 헤더 -->
	<jsp:include page="../standard/header.jsp" />   
	     
	<div class="row mt-2">
	    <div class="col d-none d-sm-block"></div>
	        
	        <!-- 중심내용 -->
	       
<form action="${pageContext.request.contextPath}/viewPwFind.member?id=${id}"
	method="post" id=frm>
	<div class=row>
		<div class=col-12>
			<h5>비밀번호 변경</h5>
		</div>
	</div>
	<input type=text id=tmpId name=id value=${id}>
	<div class=row>
		<div class=col-12>
			<h5>비밀번호</h5>
			<input type="password" id=pw name=pw required>
			<div id=pwCheck></div>
		</div>
		<div class=col-12>
			<h5>비밀번호 확인</h5>
			<input type="password" id=pwRe required>
			<div id=pwReCheck></div>
		</div>
	</div>

	<div class=row>
		<div class=col-12>
			<button type=button id=change class="btn btn-outline-secondary"> 비밀번호 변경</button>
		
		</div>
	</div>
</form>



	        <!-- 중심내용 -->
	    <div class="col d-none d-sm-block"></div>
	</div>
	
	<!-- 푸터-->
	<jsp:include page="../standard/footer.jsp" />
	
	</div>
<!-- container --> 



<script type="text/javascript">

//비밀번호 확인
$("#pw").on("keyup", function() {
	
	if($("#pwRe").val() != ""){
	var regex = /^[a-zA-Z0-9]{8,14}$/;
    var data = $('#pw').val();
    var result = regex.exec(data);
    if (result != null){
		$("#pwCheck").html("");
		if (pw == pwRe) {
			$("#pwCheck").html("");
		} else {
			$("#pwCheck").html("<div id=red>비밀번호 불일치</div>");
		}

})
$("#pwRe").on("keyup", function() {
	
	if($("#pw").val() != ""){
	var regex = /^[a-zA-Z0-9]{8,14}$/;
    var data = $('#pwRe').val();
    var result = regex.exec(data);
    if (result != null){
    	var pw = $("#pw").val();
		var pwRe = $("#pwRe").val();

		if (pw == pwRe) {
			$("#pwReCheck").html("");
		} else {
			$("#pwReCheck").html("<div id=red>비밀번호 불일치</div>");
		}
    }
    else if(result == null){
    	$("#pwReCheck").html("<div id=red>비밀번호는 숫자,영어를 이용해 8-14자로 입력하십시오.</div>");
    }
	}
})
<<<<<<< HEAD
  
$("#change").on("click",function(){
	console.log($("#tmpId").val());
	if ($("#pw").val() == "" || $("#pwRe").val()==""|| $("#pw").val() != $("#pwRe").val()){
		alert("비밀번호를 제대로 입력하세요.")
		return ;
	}
	if($("#pw").val()!=""){
		
		
		var regex = /^[a-zA-Z0-9]{8,12}$/;
        var data = $('#pw').val();
        var result = regex.exec(data);
        if (result != null){
        	var pw = $("#pw").val();
			var pwRe = $("#pwRe").val();

			if (pw == pwRe) {
				
			} else {
				alert("비밀번호 불일치");
				return;
			}
        }
        else{
        	alert("비밀번호 형식에 맞지않습니다.");
        	return;
        }
		
	}
	$("#frm").submit();
})
=======

$("#change").on("click",function(){
	if($("#pwCheck").html() != ""){
		alert("비밀번호가 일치하지 않습니다. 정확히 입력해주세요");
		return false;
	}else if($("#pwReCheck").html() != ""){
		alert("비밀번호가 일치하지 않습니다. 정확히 입력해주세요");
		return false;
	}
	
	$("form").submit();
})

  
>>>>>>> 7851e38d0825be992ae05f9271bd9015e8442720
</script>
</body>
</html>