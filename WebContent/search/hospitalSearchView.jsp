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
            #hosImg{
                width:100%;
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
           <%-- --%>
            <div class =row>
                <div class=col-12>
                    <h1>검색 결과</h1>
                    <hr>
                </div>
            </div>

            <div class="container detailSearch">
                <%--검색 컨테이너 시작 --%>
                <div class =row>
                    <div class=col-12>
                        <h5> 지역별 검색</h5>
                    </div>
                </div>
                   <div class = row>
                    <div class=col-3>
                        <select name=city>
                            <option>서울</option>
                            <option>경기도</option>
                            <option>충청도</option>
                            <option>강원도</option>


                        </select>
                    </div>
                    <div class=col-3>
                        <select name=gu>
                            <option>덕양구</option>
                            <option>구로구</option>
                            <option>일산동구</option>
                            <option>일산서구</option>
                        </select>
                    </div>
                    
                    <div class=col-3>
                        <select name=dong>
                            <option>고양시</option>
                            <option>일산시</option>
                            <option>시</option>
                            <option>시</option>
                        </select>
                    </div>
                   

                    <div class = col-3>
                        <button id="search">검색</button>
                    </div>
                </div>

                <div class=row>
                    <div class=col-12>
                        <h5> 진료동물</h5>
                    </div>
                </div>

                <div class = row>
                    <div class=col-3>
                        새<input type="checkbox" name=animal value=bird>
                    </div>
                    <div class=col-3>
                        물고기<input type="checkbox" name=animal value=fish>
                    </div>
                    <div class=col-3>
                        햄스터<input type="checkbox" name=animal value=mouse>
                    </div>
                    <div class=col-3>
                        토끼<input type="checkbox" name=animal value=rabbit>
                    </div>
                </div>
                <div class = row>
                    <div class=col-3>
                        고슴도치<input type="checkbox" name=animal value=hedgehog>
                    </div>
                    <div class=col-3>
                        파충류<input type="checkbox" name=animal value=reptile>
                    </div>
                    <div class=col-3>
                        곤충류<input type="checkbox" name=animal value=bug>
                    </div>
                    <div class=col-3>
                        기타<input type=text><input type="checkbox" name=animal value=other>
                    </div>
                </div>

                <div class= row>
                    <div class= col-12>
                        <h5>진료 시간</h5>
                    </div>
                </div>
                <div class=row>
                    <div class=col-2>
                        1<input type="checkbox">
                    </div>
                    <div class=col-2>
                        2<input type="checkbox">
                    </div>
                    <div class=col-2>
                        3 <input type="checkbox">
                    </div>
                    <div class=col-2>
                        4<input type="checkbox">
                    </div>
                    <div class=col-2>
                        5<input type="checkbox">
                    </div>
                    <div class=col-2>
                        6<input type="checkbox">
                    </div>
                </div>
                
                  <div class= row>
                    <div class= col-12>
                        <h5>진료 과목</h5>
                    </div>
                </div>
                <div class=row>
                    <div class=col-2>
                        1<input type="checkbox">
                    </div>
                    <div class=col-2>
                        2<input type="checkbox">
                    </div>
                    <div class=col-2>
                        3 <input type="checkbox">
                    </div>
                    <div class=col-2>
                        4<input type="checkbox">
                    </div>
                    <div class=col-2>
                        5<input type="checkbox">
                    </div>
                    <div class=col-2>
                        6<input type="checkbox">
                    </div>
                </div>
            </div> <%--검색 컨테이너 끝 --%>

            <div class =row>
                <div class=col-12>
                    <h1>2(검색된 병원)</h1>
                    <hr>
                </div>
            </div>
            <div class =row>
                <div class=col-4>
                    <img src = "../resource/hospital/김포우리병원계열.jpg" id =hosImg >
                </div>
                <div class = col-8>
                     <a href="#"><h2>김포우리병원계열</h2></a>
                    <ul>
                        <li>김포 위치</li>
                        <li>12345</li>
                        <li>12345</li>
                    </ul>
                </div>
            </div>
            <div class =row>
                <div class=col-4>
                    <img src = "../resource/hospital/병원이름모름.jpg" id =hosImg >
                </div>
                <div class = col-8>
                    <a href="#"><h2>김포우리병원계열</h2></a>
                    <ul>
                        <li>김포 위치</li>
                        <li>12345</li>
                        <li>12345</li>
                    </ul>
                </div>
            </div>
            
            <div class=row>
                <div class= col-12>
                navi
               ${navi}
                </div>
            </div>
            
            <%-- --%>
            <div class="row">
                <div id="footer" class="col-12">
                    푸터
                </div>
            </div>
        </div>
</body>
</html>