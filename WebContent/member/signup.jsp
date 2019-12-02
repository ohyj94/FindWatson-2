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
<link rel="stylesheet" href="../resources/css/mainStyle.css">

</head>
<body>
	<div class="container">
		<jsp:include page="../standard/header.jsp" /> 
		<!--            -->
		<form action="${pageContext.request.contextPath}/signUp.member" method="post" id=signUp>
			<div class=row>
				<div class=col-12>
					<h1>회원가입</h1>
					<hr>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<h5>아이디</h5>
					<input type=text id=id name="id">
					<div id=idCheck></div>
				</div>
			</div>

			<div class=row>
				<div class="col-12 col-md-6">
					<h5>비밀번호</h5>
					<input type="password" id=pw name="pw">
				</div>
				<div class="col-12 col-md-6">
					<h5>비밀번호 확인</h5>
					<input type="password" id=pwRe name="pwRe">
				</div>
				<div class=col-12 id=pwCheck></div>
			</div>

			<div class=row>
				<div class=col-12>
					<h5>이름</h5>
					<input type=text id=name name="name">
				</div>
				<div class=col-12>
					<div id=nameCheck></div>
				</div>
			</div>

			<div class=row>
				<div class="col-12 col-md-6">
					<h5>생년월일 (yymmdd)</h5>
					<input type=text id=year placeholder="yymmdd" name="birth">
				</div>
				<div class=col-12>
					<div id=yearCheck></div>
				</div>
			</div>

			<div class=row>
				<div class=col-12>
					<h5>성별</h5>
					남<input type=radio name=gender value="남">&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp; 여<input type=radio name=gender value="여">
				</div>
			</div>

			<div class=row>
				<div class=col-12>
					<h5>본인 확인 이메일</h5>
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

			<div class=row>
				<div class=col-12>
					<h5>주소</h5>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<input type="text" id="postcode" name=postcode placeholder="우편번호"
						readonly>
					<button id=addressBtn type="button"
						onclick="sample4_execDaumPostcode()">찾기</button>
				</div>
				<div class=col-6>
					<input type="text" id="address1" class="col-12" name=address1 placeholder="도로명주소"
						readonly>
				</div>
				<div class=col-6>
					<input type=text name=address2 id=address2 class="col-12" placeholder="상세주소">
				</div>
			</div>

			<div class=row>
				<div class=col-12>
					<h5>관심 동물</h5>
				</div>
			</div>
			<div class=row>
				<div class="col-4 col-md-3">
					<input type=radio name=lovePet value=bird>새
				</div>
				<div class="col-4 col-md-3">
					<input type=radio name=lovePet value=fish>물고기
				</div>
				<div class="col-4 col-md-3">
					<input type=radio name=lovePet value=mouse>햄스터
				</div>
				<div class="col-4 col-md-3">
					<input type=radio name=lovePet value=rabbit>토끼
				</div>
				<div class="col-4 col-md-3">
					<input type=radio name=lovePet value=hedgehog>고슴도치
				</div>
				<div class="col-4 col-md-3">
					<input type=radio name=lovePet value=reptile>파충류
				</div>
				<div class="col-4 col-md-3">
					<input type=radio name=lovePet value=bug>곤충류
				</div>
				<div class="col-8 col-md-3">
					<input type=radio name=lovePet value=other>기타
					<input type=text name=otherAnimal  class="col-7">
				</div>
			</div>

			<div class=row>
				<div class=col-12>
					<h5>가입 경로</h5>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<input type="radio" name=signPath value="path1">'찾아조 왓슨!'
					직접검색
				</div>
				<div class=col-12>
					<input type="radio" name=signPath value="path1">'특수 동물 병원'
					키워드 검색
				</div>
				<div class=col-12>
					<input type="radio" name=signPath value="path1">지인 소개
				</div>
				<div class=col-12>
					<input type="radio" name=signPath value="path1">기타<input
						type=text name=otherSignPath>
				</div>
			</div>
			<div class=row>
				<div class="col-12 con">
					<button type=button id=save>가입</button>
				</div>
			</div>
		</form>
		
				<!--            -->
				<jsp:include page="../standard/footer.jsp" />
</div>
			<script type="text/javascript">
				$("#login").on("click", function() {
					location.href = "login.jsp"
				})
				//우편번호
				function sample4_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									var roadAddr = data.roadAddress;
									document.getElementById('postcode').value = data.zonecode;
									document.getElementById("address1").value = roadAddr;
								}
							}).open();
				}

				//아이디 확인
				$("#id").on("keyup",function() {
									var regex = /^[a-z][a-z0-9]{6,13}$/gm;
									var id = $("#id").val();
									var result = regex.exec(id);

									if (result != null) {//조건만족하면 바로 DB확인
										$("#idCheck").html("");

										$.ajax({	url : "${pageContext.request.contextPath}/duplCheck.member",
													type : "post",
													data : {
															id : $("#id").val()},
															dataType : "json"
														}).done(function(data) {
															console.log(data.result);
															if (data.result == true) {
																$("#idCheck").html("존재하는 아이디입니다.");
															} else {
																$("#idCheck").html("사용가능한 아이디입니다.");
															}
														}).fail(function() {
													console.log("통신 실패");
												});

									} else {
										$("#idCheck")
												.html(
														"아이디는 소문자로 시작해야하며 숫자,소문자를 이용해  7-14자로 입력하십시오.");
									}
								});
				//비밀번호 확인
				$("#pw").on("keyup", function() {
					var regex = /^[a-zA-Z0-9]{8,12}$/;
	                var data = $('#pw').val();
	                var result = regex.exec(data);
	                if (result != null){
	                	var pw = $("#pw").val();
						var pwRe = $("#pwRe").val();

						if (pw == pwRe) {
							$("#pwCheck").html("<div id=blue>비밀번호 일치</div>");
						} else {
							$("#pwCheck").html("<div id=red>비밀번호 불일치</div>");
						}
	                }
	                else if(result == null){
	                	$("#pwCheck").html("<div id=red>비밀번호는 숫자,영어를 이용해 8-14자로 입력하십시오.</div>");
	                }
					
				})
				$("#pwRe").on("keyup", function() {
					var regex = /^[a-zA-Z0-9]{8,12}$/;
	                var data = $('#pwRe').val();
	                var result = regex.exec(data);
	                if (result != null){
	                	var pw = $("#pw").val();
						var pwRe = $("#pwRe").val();

						if (pw == pwRe) {
							$("#pwCheck").html("<div id=blue>비밀번호 일치</div>");
						} else {
							$("#pwCheck").html("<div id=red>비밀번호 불일치</div>");
						}
	                }
	                else if(result == null){
	                	$("#pwCheck").html("<div id=red>비밀번호는 숫자,영어를 이용해 8-14자로 입력하십시오.</div>");
	                }
	                	
					
				})

				//이름 확인
				$("#name").on("keyup", function() {
					var regex = /^[가-힣]{2,8}$/gm;
					var name = $("#name").val();
					var result = regex.exec(name);
					if (result == null) {
						$("#nameCheck").html("잘못된 이름 형식입니다.");
					} else if (result !== null){
						$("#nameCheck").html("올바른 이름 형식입니다.");
					}
				})
				//생년월일 확인
				$("#year").on("keyup", function() {
					var regex = /^[0-9]{6}$/gm;
					var year = $("#year").val();
					var result = regex.exec(year);
					if (result == null) {
						$("#yearCheck").html("잘못된 생년월일 형식입니다.");
					} else if (result !== null){
						$("#yearCheck").html("올바른 생년월일 형식입니다.");
					}
				})
				
				//이메일 확인
				$("#email").on("keyup", function() {
					var regex = /^[0-9a-zA-Z]+@[a-z]+(\.[a-z]+){1,2}$/gm;
					var email = $("#email").val();
					var result = regex.exec(email);

					if (result == null) {
						$("#emailCheck").html("잘못된 이메일 형식입니다.");
					} else if (result !== null) {
						$("#emailCheck").html("올바른 이메일 형식입니다.");
					}
				})

				//연락처 양식 확인
				$("#phone").on("keyup", function() {
					var regex = /^01[0-9]{8,9}$/gm;
					var phone = $("#phone").val();
					var result = regex.exec(phone);
					if (result == null) {
						$("#phoneCheck").html("잘못된 번호 형식입니다.");
					} else if(result !== null){
						$("#phoneCheck").html("올바른 번호 형식입니다.");
					}

				})
				//가입버튼 유효성검사
				$("#save").on("click", function() {
					
					if($("#id").val()==""){
						alert("아이디를 입력하세요!");
						return;
					}
					if($("#id").val()!==""){
						var regex = /^[a-z][a-z0-9]{6,13}$/gm;
						var id = $("#id").val();
						var result = regex.exec(id);

						if (result != null) {//조건만족하면 바로 DB확인
							
						}
						else{
							alert("아이디 형식에 맞지않습니다.")
							return;
						}
					}
					if($("#pw").val() == "" || $("#pwRe").val() == "" || $("#pw").val() !== $("#pwRe").val()){
						alert("비밀번호를 제대로 입력하세요!");
						return;
					}
					if($("#pw").val()!==""){
						
						
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
					
					if($("#name").val() =="" ){
						alert("이름을 입력하세요!");
						return;
					}
					if($("#name").val()!==""){
						var regex = /^[가-힣]{2,8}$/gm;
						var name = $("#name").val();
						var result = regex.exec(name);
						if (result != null) {
							
						}
						else{
							alert("이름 형식에 맞지않습니다.")
							return;
						}
					}
					
					if($('#year').val() == ""){
						alert('생년월일을 입력하세요!');
						return;
					}
					
					if($("#year").val()!==""){
						var regex = /^[0-9]{6}$/gm;
						var year = $("#year").val();
						var result = regex.exec(year);
						if (result != null) {
							
						}
						else{
							alert("생년월일 형식에 맞지않습니다.")
							return;
						}
					}
					
					if($(':radio[name="gender"]:checked').length < 1){
						alert('성별을 선택하세요!');
						return;
					}
					if($("#email").val() ==""){
						alert("이메일을 입력하세요!");
						return;
					}
					
					if($("#email").val()!==""){
						var regex = /^[0-9a-zA-Z]+@[a-z]+(\.[a-z]+){1,2}$/gm;
						var email = $("#email").val();
						var result = regex.exec(email);
						if (result != null) {
							
						}
						else{
							alert("이메일 형식에 맞지않습니다.")
							return;
						}
					}
					if($("#phone").val() == ""){
						alert("전화번호를 입력하세요!");
						return;
					}
					
					if($("#phone").val()!==""){
						var regex = /^01[0-9]{8,9}$/gm;
						var phone = $("#phone").val();
						var result = regex.exec(phone);
						if (result != null) {
							
						}
						else{
							alert("전화번호 형식에 맞지않습니다.")
							return;
						}
					}
					
					if($("#postcode").val() == ""){
						alert("우편번호를 입력하세요!")
						return;
					}
					
					if($("#address1").val()==""){
						alert("주소를 입력해주세요!")
						return;
					}
					
					if($("#address2").val() == ""){
						alert("상세주소를 입력해주세요!")
						return;
					}
					
				
					
					var pet= $("input[name=lovePet]:checked").length;
					console.log(pet);
					
				
					if(pet < 1){
						alert("관심 동물을 선택하세요!");
						return;
					}
					
					var signPath= $("input[name=signPath]:checked").length;
					console.log(signPath);
					if(signPath < 1){
						alert("가입경로를 선택하세요!");
						return;
					}
					
					
					
					$("#signUp").submit();
				})
			</script>
</body>
</html>