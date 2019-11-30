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
/*            div{border: 1px solid black}*/
            #logo{
                width: 500px;
                height: 100px;
                margin: auto;
            }
            #article-img{
                width: 500px;
                height: 100px;
                margin: auto;
            }
            #footer{
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
            .imgSize{
                width: 100%;
                height: 300px;
            }
            #searchBtn2{width: 100%;}
            .line {border: 0.5px solid lightgray;}
            label{margin-bottom: 0px;}
        </style>
</head>
<body>
<div class="container">
            <div class="row mb-2">
                <div id="loginBtn" class="col-12 p-1 text-right">
                    <button id=login class="btn btn-sm btn-outline-secondary">로그인</button>

                </div>
            </div>
            <div class="row mb-3">
                <div id="title" class="col-12 p-1 text-center">
                    <img id="logo" src="imgs/logo.png" class="col-12">
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
                                    <a class="nav-link" href="${pageContext.request.contextPath}/boardNotice.bo">공지사항</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">병원검색</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/boardExpert.bo">전문가Q&A</a>
                                </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          커뮤니티
        </a>
        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/boardFree.bo">자유게시판</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/boardQuestion.bo">질문게시판</a>
        </div>
        </li>

<li class="nav-item"><a class="nav-link" href="member/login.jsp">마이페이지</a>                         
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!--            -->
<div class="row">
         <div id="article-top" class="col-12 mb-3 p-0">
            <div id="carouselExampleIndicators"
               class="carousel slide col-12 mb-3 p-0" data-ride="carousel" style="width: 1000px; margin: auto">
               <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0"
                     class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
               </ol>
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <img src="imgs/animal/%EB%B1%81%EC%83%88.png" class="imgSize d-block">
                  </div>
                  <div class="carousel-item">
                     <img src="imgs/animal/%EA%B3%A0%EC%8A%B4%EB%8F%84%EC%B9%98.jpg" class="imgSize d-block">
                  </div>
                  <div class="carousel-item">
                     <img src="imgs/animal/%EC%95%B5%EB%AC%B4%EC%83%88.jpg" class="imgSize d-block"> 
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
                     <button id="searchBtn1" class="btn btn-outline-secondary m-auto col-2"
                        type="submit">Search</button>
                  </form>
               </div>
            </div>
         </div>
         <div id="article-middle" class="col-12 mb-3">
            <div class="row line">
               <div id="article-middle-left" class="col-6 text-center">
                  <div class="row line">
                     <div class="col-auto col-sm-6">공지사항</div>
                     <div class="col-auto col-sm-6">
                        <a href="boardNotice.bo">더보기</a>
                     </div>
                  </div>
                  <div class="row line">
                     <div class="col-12">
                        <a href="#">공지</a><br> <a href="#">공지</a><br> <a
                           href="#">공지</a><br> <a href="#">공지</a><br> <a
                           href="#">공지</a><br>
                     </div>
                  </div>
               </div>
               <div id="article-middle-right" class="col-6 text-center">
                  <div class="row line">
                     <div class="col-auto col-sm-6">최신글</div>
                     <div class="col-auto col-sm-6">
                        <a href="#">더보기</a>
                     </div>
                  </div>
                  <div class="row line">
                     <div class="col-12">
                        <a href="#">최신글</a><br> <a href="#">최신글</a><br> <a
                           href="#">최신글</a><br> <a href="#">최신글</a><br> <a
                           href="#">최신글</a><br>
                     </div>
                  </div>
               </div>
               <div id="article-logo" class="col-12 p-2 line">
                  <div id="article-img">이미지</div>
               </div>
            </div>
         </div>
         <div id="article-botton" class="col-12 line mb-3 p-0">
            <div class="col-12 line">동물병원 상세 검색</div>
            <div id="area-search" class="col-12">
               <div class="row line">
                  <lable class="col-auto align-self-center">지역별</lable>
                  <select name="zone" id="zone" class="col-12 col-sm-4">
                     <option value="">-시 선택-</option>
                     <option value="서울">서울</option>
                  </select> <select name="zone2" id="zone2" class="col-12 col-sm-4">
                     <option value="">-구 선택-</option>
                  </select>
                  <button id="searchBtn2" class="col m-0 btn btn-sm btn-outline-secondary">검색</button>
               </div>
               <div class="row line">
                  <div class="col-12 line">진료동물</div>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=새>새
                  </label>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=물고기>물고기
                  </label>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=햄스터>햄스터
                  </label>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=토끼>토끼
                  </label>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=고슴도치>고슴도치
                  </label>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=파충류>파충류
                  </label>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=곤충류>곤충류
                  </label>
                  <label class="col-3">
                     <input type="checkbox" name=animal value=기타>기타
                  </label>
               </div>
               <div class="row line">
                  <div class="col-12 line">진료시간</div>
                  <label class="col-4">
                     <input type="checkbox" name=time value=주간진료>주간진료
                  </label>
                  <label class="col-4">
                     <input type="checkbox" name=time value=24시간진료>24시간진료
                  </label>
                  <label class="col-4">
                     <input type="checkbox" name=time value=야간응급진료>야간응급진료
                  </label>
               </div>
            </div>
         </div>
      </div>
            <!--            -->
            <div class="row">
                <div id="footer" class="col-12">
                    <div class="row p-1">
                        <div id="footer-logo" class="col-12 col-sm-4">
                            <div class="row">
                                <div class="col">
                                    <img id="logo" src="imgs/logo.png" class="d-none d-sm-block col-12">
                                </div>
                            </div>
                        </div>
                        <div id="footer-contents" class="col-12 col-sm-8">
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