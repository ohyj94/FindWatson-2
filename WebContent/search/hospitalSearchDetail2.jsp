<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원상세검색2</title>
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<style>
* {
	box-sizing: border-box
}

div {
	border: 1px solid green
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

#array {
	text-align: right;
}

.review>div {
	float: left;
}

.hosIn1 {
	height: 80%;
}

.hosIn2 {
	height: 20%;
}

#hosImg {
	width: 100%;
}

.center {
	text-align: center;
}
</style>
</head>
<body>
	<form action="#" method="post" id=reviewSave>
		<div class="container">
			<div class="row">
				<div id="loginBtn" class="col-12 text-right">
					<button class="btn btn-sm btn-outline-secondary">로그인</button>
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
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="#">공지사항</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">병원검색</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">전문가Q&A</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">마이페이지</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h1 name=hosName>병원 이름</h1>
					<h5 name=mdfDate>
						정보수정일 2019.01.01 Total.100
					</h5>
					<hr>
				</div>
			</div>

			<div class=row>
				<div class="col-6">
					<img src="../resource/hospital/김포우리병원계열.jpg" id=hosImg>
				</div>
				<div class="col-6">
					<div class="row hosIn1">
						<div class=col-12 name=hosIntdu>
							동해물과 백두산이<br> 마르고 닳도록 하느님이 <br> 보우하사 우리나라 만세<br>
							무궁화 삼천리 화려강산<br> 대한사람 대한으로 길이 보전하리<br>
						</div>
					</div>
					<div class="row hosIn2">
						<div class=col-12>
							<button type="button" class="btn btn-secondary">정보 수정 제안</button>
						</div>
					</div>
				</div>
			</div>

			<div class=row>
				<div class=col-12>
					<br>
					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary">상세정보</button>
						<button type="button" class="btn btn-secondary">지도</button>
						<button type="button" class="btn btn-secondary">후기</button>
					</div>
					<hr>
				</div>
			</div>

			<div class=row>
				<div class=col-12>
					<h2>후기</h2>
				</div>
			</div>

			<div class=row>
				<div class=col-12 id=array>
					<a href="#">좋아요순</a> <a href="#">최신순</a> <a href="#">별점순</a>
				</div>
			</div>
			<div class=row>
				<div class=col-2>별점</div>
				<div class=col-4>제목</div>
				<div class=col-2>작성일</div>
				<div class=col-2>ip</div>
				<div class=col-2>삭제</div>
			</div>
			<div class=row>
				<div class=col-12>
					<h2>후기 남기기</h2>
					제목 : <input type="text" id=title name=title><br>
					<textarea id="summernote" name=editordata></textarea>
					<button type = button id=reviewSave></button>
				</div>
			</div>

			<div class=row>
				<div class="col-12 center">
					<button id=save>등록</button>
				</div>
			</div>

			<div class="row">
				<div id="footer" class="col-12">푸터</div>
			</div>
		</div>
	</form>
	<script>
            $("#reviewSaveBtn").on("click",function(){
                var result = confirm("정말 등록 하시겠습니까?");
                if(result){
                    location.href="reviewWrite.hos";
                }
            })
            <script>
                $("#summernote").summernote({
                height : 600,
                width : 800,
                callbacks:{
                    onImageUpload:function(files){
                        var data = new FormData();
                        data.append("img", files[0]);
                        //폼태그에서 인풋 타입파일에서 파일 선택한거까지의 상태

                        $.ajax({
                            url:"upload.file",
                            enctype:"multipart/form-data",
                            type:"post", //get으로 안됨
                            data:data,
                            contentType:false,
                            processData:false,
                            cache:false,
                            dataType:"json"
                        }).done(function(resp){
                            console.log("오는거 성공~~");
                            //1.
                            console.log(resp.url);
                            var p = $("<p></p>");
                            var img = $("<img>");
                            $(img).attr("src",resp.url);
                            p.append(img);
                            $(".note-editable").append(p);

                            //2.
                            //var img2 = $("<img>");
                            //console.log(resp.url);
                            //Jquery는 대상을 선택하면 무조건 배열임
                            //img2.attr("src", resp.url);
                            //console.log(img2[0]);

                            //$("#summernote").summernote('insertNode', img2[0]);


                        }).fail(function(a,b,c){
                            console.log("fail");
                            console.log(a);
                            console.log(b);
                            console.log(c);
                        });

                    }
                }
            })

        </script>
</body>
</html>