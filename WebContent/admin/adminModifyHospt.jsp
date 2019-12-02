<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainStyle.css">
<style>
* {
	box-sizing: border-box
}
/*            div{border: 1px solid black}*/
#logo {
	width: 500px;
	height: 100px;
	margin: auto;
}

#footer>div {
	height: 100%;
}

#footer-logo>div {
	height: 100%;
}

#footer-contents {
	font-size: 8pt;
}

.nav-item {
	display: inline-block;
	width: 100%;
	text-align: center;
}

.navbar-nav {
	width: 100%;
}

#article, .line {
	border: 0.5px solid lightgray;
}

#category {
	width: 100%;
	height: 100%;
}

.search-box>* {
	width: 100%;
}

.write-box>* {
	width: 100%;
}

#article, .line {
	border: 0.5px solid lightgray;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../standard/headerAdmin.jsp" />
		<!--            -->
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<h3 id="board-top" class="col-auto col-sm-4 m-0">병원 정보 등록</h3>
							<span class="col-auto col-sm-8 mt-2"> <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
							</span>
						</div>
						<form
							action="${pageContext.request.contextPath}/admin/adminInsertHospt.manager"
							method="post">
							<div class="row line">
								<div class="col-12">
								<input type="text" id="name" name=name val =${dto.hosptName}>
								</div>
								<br>


								<div class="col-12">
									<input type="text" id="postcode" name=postcode
										placeholder="우편번호" readonly val =${dto.postCode}>
									<button id=addressBtn type="button"
										onclick="sample4_execDaumPostcode()">찾기</button>
								</div>
								<div class="col-12">
									<input type="text" id="address1" name=address1
										placeholder="주소1" readonly val =${dto.address1}>
								</div>
								<div class="col-12">
									<input type=text name=address2 id=address2 placeholder="주소2" val =${dto.address2}>
								</div>
								<div class="col-12">
									<input type=text id=phone name=phone placeholder='전화번호' val =${dto.phone}>
								</div>
								<div class="col-12">
									<input type=text id=homepage name=homepage
										placeholder='홈페이지 주소' val =${dto.homepage}>
								</div>


								<div class=col-12>진료과목</div>
								<div class=col-12>
									<input type="checkbox" name=medicalAnimal value=새> 새 <input
										type="checkbox" name=medicalAnimal value=물고기> 물고기 <input
										type="checkbox" name=medicalAnimal value=햄스터> 햄스터 <input
										type="checkbox" name=medicalAnimal value=토끼> 토끼 <input
										type="checkbox" name=medicalAnimal value=고슴도치> 고슴도치 <input
										type="checkbox" name=medicalAnimal value=파충류> 파충류 <input
										type="checkbox" name=medicalAnimal value=곤충류> 곤충류 <input
										type="checkbox" name=medicalAnimal value=기타> 기타
								</div>

								<div class=col-12>진료시간</div>
								<div class=col-12>
									<input type="checkbox" name=openTime value=주간진료> 주간진료 <input
										type="checkbox" name=openTime value=야간응급진료> 야간응급진료 <input
										type="checkbox" name=openTime value=24시간진료> 24시간진료

								</div>
								<div class=col-12>사진</div>
								<div class=col-12></div>


							</div>



						</form>
						<input type="button" id="insert" value="병원등록">







						<div class="row mb-2">
							<div class="col-auto col-sm-2 p-1">
								<select id="category">
									<option value="">제목</option>
								</select>
							</div>
							<div class="search-box col-auto col-sm-6 p-1">
								<input type="text" class="" id="search" name="search" value="">
							</div>
							<div class="search-box col-auto col-sm-2 p-1">
								<button class="btn btn-sm btn-outline-secondary">검색</button>
							</div>
							<div class="write-box col-auto col-sm-2 text-center p-1">
								<button class="btn btn-sm btn-outline-secondary">작성하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--            -->
		<jsp:include page="../standard/footer.jsp" />
</div>
		<script>
            //우편번호 찾기
            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        var roadAddr = data.roadAddress; 
                        document.getElementById('postcode').value = data.zonecode;
                        document.getElementById("address1").value = roadAddr;
                    }
                }).open();
            }
            $('#insert').on('click',function(){
                $('form').submit();
            })
            
        
        </script>
</body>
</html>