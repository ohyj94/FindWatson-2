<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
<%--부트 스트랩 --%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../resources/css/mainStyle.css">

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
<jsp:include page="../standard/header.jsp" />
<!--            -->
<form action="${pageContext.request.contextPath}/viewPwFind.member"
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
			<input type="password" id=pw name=pw>
			<div id=pwCheck></div>
		</div>
		<div class=col-12>
			<h5>비밀번호 확인</h5>
			<input type="password" id=pwRe>
			<div id=pwReCheck></div>
		</div>
	</div>

	<div class=row>
		<div class=col-12>
			<button type="button" id=change class="btn btn-outline-secondary"> 비밀번호 변경</button>
		
		</div>
	</div>
</form>



<!--            -->
<jsp:include page="../standard/footer.jsp" />
</div>
<script type="text/javascript">

//비밀번호 확인
$("#pw").on("keyup", function() {
	var regex = /^[a-zA-Z0-9]{8,14}$/;
    var data = $('#pw').val();
    var result = regex.exec(data);
    if (result != null){
		$("#pwCheck").html("");

    }
    else if(result == null){
    	$("#pwCheck").html("<div id=red>비밀번호는 숫자,영어를 이용해 8-14자로 입력하십시오.</div>");
    }
   
})
$("#pwRe").on("keyup", function() {
	var regex = /^[a-zA-Z0-9]{8,14}$/;
    var data = $('#pwRe').val();
    var result = regex.exec(data);
    if (result != null){
    	var pw = $("#pw").val();
		var pwRe = $("#pwRe").val();

		if (pw == pwRe) {
			$("#pwReCheck").html("<div id=blue>비밀번호 일치</div>");
		} else {
			$("#pwReCheck").html("<div id=red>비밀번호 불일치</div>");
		}
    }
    else if(result == null){
    	$("#pwReCheck").html("<div id=red>비밀번호는 숫자,영어를 이용해 8-14자로 입력하십시오.</div>");
    }
})
  
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
</script>
</body>
</html>