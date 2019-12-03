<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>
<body>
	<form action="${pageContext.request.contextPath}/idFind.member"
		method="post" id=frm>
		<div class="container">
			<jsp:include page="../standard/header.jsp" />
			<!--            -->
			<div class=row>
				<div class=col-12>
					<h1>아이디 찾기</h1>
					<hr>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<h5>이름</h5>
					<input type=text id=name name="name">
					<div id=nameCheck></div>
				</div>
			</div>
			<div class=row>
				<div class="col-12 col-md-6">
					<h5>생년월일</h5>
					<input type=text id=birth placeholder="yyyymmdd" name="birth">
				</div>
				<div class=col-12>
					<div id=birthCheck></div>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<h5>이메일</h5>
					<input type=text id=email name="email">
				</div>
				<div class=col-12>
					<div id=emailCheck></div>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<h5>휴대폰 번호</h5>
					<input type=text id=phone name="phone">
				</div>
				<div class=col-12>
					<div id=phoneCheck></div>
				</div>
			</div>
			<div class="col-12 con">
				<button id=Find>아이디찾기</button>
			</div>
	</form>
	<!--            -->
	<jsp:include page="../standard/footer.jsp" />
	</div>
	<script type="text/javascript">
		//이름확인
		$("#name").on("keyup", function() {
			var regex = /^[가-힣]{2,8}$/gm;
			var name = $("#name").val();
			var result = regex.exec(name);
			if (result == null) {
				$("#nameCheck").html("잘못된 이름 형식입니다.");
			} else {
				$("#nameCheck").html("");
			}
		})
		//이메일 확인
		$("#email").on("keyup", function() {
			var regex = /^[0-9a-zA-Z]+@[a-z]+(\.[a-z]+){1,2}$/gm;
			var email = $("#email").val();
			var result = regex.exec(email);

			if (result == null) {
				$("#emailCheck").html("잘못된 이메일 형식입니다.");
			} else {
				$("#emailCheck").html("");
			}
		})
		//연락처 양식 확인
		$("#phone").on("keyup", function() {
			var regex = /^01[0-9]{8,9}$/gm;
			var phone = $("#phone").val();
			var result = regex.exec(phone);
			if (result == null) {
				$("#phoneCheck").html("잘못된 번호 형식입니다.");
			} else {
				$("#phoneCheck").html("");
			}

		})
		//생년월일 양식 검사
		$("#birth").on("keyup",function(){
			var regex = /^[0-9]{8}/gm;
			var birth = $("#birth").val();
			var result = regex.exec(birth);
			if (result == null){
				$("#birthCheck").html("잘못된 생년월일 형식입니다.")
			} else {
				$("#birthCheck").html("")
			}
		})
		//찾기버튼 공란검사
		$("#find").on("click",function(){
			
			if($("#name").val()=""){
				alert("이름을 입력하세요!")
			}
			if($("#email").val()=""){
				alert("이메일을 입력하세요!")
			}
			if($("#phone").val()=""){
				alert("핸드폰번호를 입력하세요!")
			}
		})
	</script>

</body>
</html>