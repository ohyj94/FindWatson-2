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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
* {
	box-sizing: border-box
}

div {
	border: 1px solid black
}

#logo {
	width: 500px;
	height: 100px;
	margin: auto;
	background-color: ghostwhite;
}

#article-img {
	width: 100%;
	height: 100px;
	margin: auto;
	background-color: ghostwhite;
}

#footer {
	height: 100px;
}

img {
	width: 500px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div id="loginBtn" class="col-12 text-right">
				<button id=login class="btn btn-sm btn-outline-secondary">로그인</button>
			</div>
		</div>
		<div class="row">
			<div id="title" class="col-12 mb-3">
				<div id="logo">로고이미지</div>
			</div>
		</div>
		<div class="row">
			<div id="navi" class="col-12 mb-3">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand" href="#">Home</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
							<li class="nav-item"><a class="nav-link" href="#">병원검색</a></li>
							<li class="nav-item"><a class="nav-link" href="#">전문가Q&A</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
							<li class="nav-item"><a class="nav-link" href="#">마이페이지</a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div id="article-top" class="col-12 mb-3">
				<div id="carouselExampleIndicators"
					class="carousel slide col-12 mb-3" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="resource/main/1.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="resource/main/2.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="resource/main/3.png" class="d-block w-100" alt="...">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<div class="row">
					<div class="col-12">
						<form class="form-inline">
							<input class="form-control col-10" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-secondary m-auto col-2"
								type="submit">Search</button>
						</form>
					</div>
				</div>
			</div>
			<div id="article-middle" class="col-12">
				<div class="row">
					<div id="article-middle-left" class="col-6 text-center">
						<div class="row">
							<div class="col-6">공지사항</div>
							<div class="col-6">
								<a href="#">더보기</a>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<a href="#">공지</a><br> <a href="#">공지</a><br> <a
									href="#">공지</a><br> <a href="#">공지</a><br> <a
									href="#">공지</a><br>
							</div>
						</div>
					</div>
					<div id="article-middle-right" class="col-6 text-center">
						<div class="row">
							<div class="col-6">최신글</div>
							<div class="col-6">
								<a href="#">더보기</a>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<a href="#">최신글</a><br> <a href="#">최신글</a><br> <a
									href="#">최신글</a><br> <a href="#">최신글</a><br> <a
									href="#">최신글</a><br>
							</div>
						</div>
					</div>
					<div id="article-logo" class="col-12 p-2">
						<div id="article-img">이미지</div>
					</div>
				</div>
			</div>
			<div id="article-botton" class="col-12">
				<div class="col-12 mb-2">동물병원 상세 검색</div>
				<div id="area-search" class="col-12">
					<div class="row mb-2">
						<lable class="col-auto">지역별</lable>
						<select name="zone" id="zone" class="col-12 col-sm-3">
							<option value="">-시 선택-</option>
							<option value="서울">서울</option>
						</select> <select name="zone2" id="zone2" class="col-12 col-sm-3">
							<option value="">-구 선택-</option>
						</select>
						<button class="col-auto m-auto btn btn-sm btn-outline-secondary">검색</button>
					</div>
					<div class="row mb-2">
						<div class="col-12">진료동물</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=새>새
						</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=물고기>물고기
						</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=햄스터>햄스터
						</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=토끼>토끼
						</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=고슴도치>고슴도치
						</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=파충류>파충류
						</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=곤충류>곤충류
						</div>
						<div class="col-3">
							<input type="checkbox" name=animal value=기타>기타
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-12">진료시간</div>
						<div class="col-4">
							<input type="checkbox" name=time value=주간진료>주간진료
						</div>
						<div class="col-4">
							<input type="checkbox" name=time value=24시간진료>24시간진료
						</div>
						<div class="col-4">
							<input type="checkbox" name=time value=야간응급진료>야간응급진료
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="footer" class="col-12">푸터</div>
		</div>
	</div>
	<script type="text/javascript">
    	$("#login").on("click",function(){
    		location.href="${pageContext.request.contextPath}/member/login.jsp"
    	})
    	
    	$("#zone").on("click", function(){
		$.ajax({
			url : "selectGu.s",
			type : "post",
			dataType : "json",
			data : {city : $("#zone option:selected").val()}
		}).done(function(result){
			$("#zone2").find("option").remove().end().append("<option value=''>전체</option>");
			  
			  //배열 개수 만큼 option 추가
			   $.each(result, function(i){
			    $("#zone2").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
			   });  
		}).fail(function(){
			alert("오류 발생");
		});
	})
    </script>
</body>
</html>