<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <title>찾아줘 왓슨!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <style>
            *{box-sizing: border-box}
            div{border: 1px solid black}
            #logo{
                width: 500px;
                height: 100px;
                margin: auto;
            }
/*
            #article{
                height: 600px;
            }
*/
            #article>*{
                height: 100%;
            }
            #article-img{
                width:100%;
                height: 100px;
                margin: auto;
            }
            #footer>div{
                height: 100%;
            }
            #footer-logo>div{
                height: 100%; 
            }
            #footer-contents{font-size: 8pt;}
            .nav-item{
                display: inline-block;
                width: 100%;
                text-align: center;
            }
            .navbar-nav{
                width: 100%;
            }
            #category{width: 100%; height: 100%;}
            #board-contents{overflow: auto; font-size: 10pt;}
            .article-navi{width: 100%;}
            .article-navi>div>ul>li{display: inline-block; width: 100%;}
            .Anavi{width: 100%;}
            .search-box>*{width: 100%;}
            .write-box>*{width: 100%;}
            #boardTitle{width:100%;}
        </style>
</head>
<body>
    <div class="container">
            <div class="row mb-2">
                <div id="loginBtn" class="col-12 text-right">
                    <button class="btn btn-sm btn-outline-secondary">로그아웃</button>
                </div>
            </div>
            <div class="row">
                <div id="title" class="col-12 mb-3 p-1 text-center">
                    <img id="logo" src="../imgs/logo.png" class="col-12">
                </div>
            </div>
            <div class="row">
                <div id="navi" class="col-12 mb-3 p-1">
                    <nav class="p-0 navbar navbar-expand-sm navbar-light bg-light">
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
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          커뮤니티
        </a>
        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">자유게시판</a>
          <a class="dropdown-item" href="#">질문게시판</a>
        </div>
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
            <div class="row">
                <div class="col-12" id="article">
                    <div class="row">
                        <div id="article-middle" class="col-12 mt-2">
                           <div class="row mb-3 p-1 text-center">
                                <h3 id="board-top" class="col-auto col-sm-4 m-0">질문게시판</h3>
                                <span class="col-auto col-sm-8 mt-2">반려동물에 대해 질문하는 게시판 입니다.</span>
                            </div>
                            <div class="row">
                                <div class="col-2 p-1">
                                    <select id="category">
                                        <option value="">말머리</option>
                                    </select>
                                </div>
                                <div class="col-10 p-1">
<input type="text" class="" id="boardTitle" name="boardTitle">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 p-1">
                                    <!-- 썸머노트 -->
<textarea name="" id="" cols="30" rows="10"></textarea>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12 p-1 text-center">
<button id="writeBtn" type="button" class="btn btn-sm btn-outline-secondary">작성</button>
<button id="updateBtn" type="button" class="btn btn-sm btn-outline-secondary">수정</button>
<button id="deleteBtn" type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            -->
            <div class="row">
                <div id="footer" class="col-12">
                    <div class="row p-1">
                        <div id="footer-logo" class="col-4">
                            <img id="logo" src="../imgs/logo.png" class="d-none d-sm-block col-12">
                        </div>
                        <div id="footer-contents" class="col-8">
                            <div class="row">
                                <div class="col-6 col-sm-auto"><a href="#">회사소개</a></div>
                                <div class="col-6 col-sm-auto"><a href="#">이용약관</a></div>
                                <div class="col-6 col-sm-auto"><a href="#">개인정보취급방침</a></div>
                                <div class="col-6 col-sm-auto"><a href="#">저작권안내</a></div>
                                <div class="col-12 col-sm-auto"><a href="#">광고및제휴문의</a></div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    상호명 : 찾아줘 왓슨! | 대표자 : 왓슨 | 사업자등록번호 : 100-12-191205
                                </div>
                                <div class="col-12">
                                    주소 : 서울 중구 남대문로 120 대일빌딩 3층 F Class 대표전화 02-1544-9970
                                </div>
                                <div class="col-12">
                                    Copyright(c) 2019 찾아줘 왓슨! All Rights Reserved.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>