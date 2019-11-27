<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
        <title>찾아줘 왓슨!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <style>
            *{box-sizing: border-box}
            div{border: 1px solid black}
            #logo{
                width: 500px;
                height: 100px;
                margin: auto;
                background-color: ghostwhite;
            }
            #article-img{
                width:100%;
                height: 100px;
                margin: auto;
                background-color: ghostwhite;
            }
            #footer{
                height: 100px;
            }
            img{
                width:500px;
            }
            #here{
                color:red;
            }
            a{
                color: black;
            }
        </style>
</head>
<body>
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
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">공지사항</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">병원검색</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">전문가Q&A</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">커뮤니티</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">마이페이지</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!--            -->
            <div class=row>
                <div class=col-12>
                    <h1>마이 페이지</h1>
                    <hr>
                </div>
            </div>

            <div class=row><!--좌측 네비바-->
                <div class=col-3>
                    <ul>
                        <br>
                        <li><a href="#">내 정보 보기</a></li>
                        <br>
                        <li><a href="#">내 정보 수정</a></li>
                        <br>
                        <li><a href="#">1:1 문의</a></li>
                        <br>
                        <li><a href="#" id=here>회원탈퇴</a></li>
                        <br>
                    </ul>    
                </div>
                <div class=col-9><!--우측공간 시작-->
                    <!--                   -->
                    <div class= row>
                        <div class= col-12>
                            <h2>회원 탈퇴</h2>
                            <hr>
                            <br>
                        </div>
                    </div>
                    <div class=row>
                        <div class=col-12>
                            비밀번호 재입력
                            <input type="text" id=pw><br>
                            비밀번호 확인
                            <input type="text" id=pwRe><br>
                            <div id=pwCheck></div>
                            <button type="button" id=withdrawal>탈퇴하기</button>
                        </div>
                    </div>
                    <!--               -->
                </div><!--우측공간 끝-->
            </div>
            <!--            -->
            <div class="row">
                <div id="footer" class="col-12">
                    푸터
                </div>
            </div>
        </div>
        <script>
            $("#pwRe").on("keyup",function(){
                var pw = $("#pw").val();
                var pwRe = $("#pwRe").val();

                if(pw != pwRe){
                    $("#pwCheck").html("두 비밀번호가 일치하지 않습니다.");
                }else{
                     $("#pwCheck").html("");
                }
            })
            $("#pw").on("keyup",function(){
                var pw = $("#pw").val();
                var pwRe = $("#pwRe").val();

                if(pw != pwRe){
                    $("#pwCheck").html("두 비밀번호가 일치하지 않습니다.");
                }else{
                     $("#pwCheck").html("");
                }
            })
            $("#withdrawal").on("click",function(){
                if( $("#pwCheck").html() != ""){
                    alert("입력하신 두 비밀번호가 일치하지 않습니다. 다시 확인 부탁드립니다.");
                }else{
                    if(result){
                        $.ajax({
                            url :"pwCheck.",
                            type:"post",
                            data:{
                                pw:$("#pw").val()
                            },
                            dataType:"json"
                        }).done(function(){
                           //result받아서 true면 confirm으로 한번더 확인 false면 alert으로 비밀번호 불일치 알림
                        }).fail(function(){
                            location.href="error.jsp";
                        })
                    }
                }

            })
        </script>
</body>
</html>