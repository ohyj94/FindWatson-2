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
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <style>
            *{box-sizing: border-box}
/*            div{border: 1px solid black}*/
            #logo{
                width: 500px;
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
            #article, .line{
                border: 0.5px solid lightgray;
            }
            #category{width: 100%; height: 100%;}
            .search-box>*{width: 100%;}
            .write-box>*{width: 100%;}
            #article, .line{
                border: 0.5px solid lightgray;
            }
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
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminBoardNotice.manager">공지사항</a>
                                </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          병원관리
        </a>
        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminInsertHospt.jsp">병원정보 등록</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminBoardHosptList.manager">병원정보 수정/삭제</a>
          <a class="dropdown-item" href="#">병원리뷰</a>
        </div>
        </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          게시판관리
        </a>
        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">전문가Q&A</a>
          <a class="dropdown-item" href="#">자유게시판</a>
          <a class="dropdown-item" href="#">질문게시판</a>
          <a class="dropdown-item" href="#">1:1문의</a>
        </div>
        </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          회원관리
        </a>
        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminMemberList.admin">회원목록조회</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminBanList.admin">차단 IP 조회</a>
          <a class="dropdown-item" href="#">회원 통계</a>
        </div>
        </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!--            -->
            <div class="row">
        <div class="col-12 mb-3" id="article">
            <div class="row">
            <div id="article-middle" class="col-12 mt-2">
                <div class="row mb-3 p-1 text-center">
                    <h3 id="board-top" class="col-auto col-sm-4 m-0">병원 정보 등록</h3>
                    <span class="col-auto col-sm-8 mt-2">
                           <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
                    </span>
                    </div>
           <form action="${pageContext.request.contextPath}/admin/adminInsertHospt.manager" method="post">     
                    <div class="row line">
           <div class="col-12">병원이름 <input type="text" id="name" name=name>	</div> <br>
           
           
                <div class="col-12">우편번호  <input type="text" id="postcode" name=postcode placeholder="우편번호" readonly>
                        <button id = addressBtn type="button" onclick="sample4_execDaumPostcode()">찾기</button>
                    </div>
                   <div class="col-12">주소1<input type="text" id="address1" name=address1 placeholder="주소1" readonly></div>
                   <div class="col-12">주소2<input type = text name = address2 id = address2 placeholder="주소2"></div>
                   <div class="col-12">전화번호<input type=text id=phone name=phone placeholder='전화번호'></div>
                        <div class="col-12">홈페이지 주소<input type=text id=homepage name=homepage placeholder='홈페이지 주소'></div>
                       
                   
                  <div class=col-12>진료과목</div>
                  <div class=col-12><input type="checkbox" name=medicalAnimal value=새> 새
        <input type="checkbox" name=medicalAnimal value=물고기> 물고기
        <input type="checkbox" name=medicalAnimal value=햄스터> 햄스터
        <input type="checkbox" name=medicalAnimal value=토끼> 토끼
        <input type="checkbox" name=medicalAnimal value=고슴도치> 고슴도치
        <input type="checkbox" name=medicalAnimal value=파충류> 파충류
        <input type="checkbox" name=medicalAnimal value=곤충류> 곤충류
        <input type="checkbox" name=medicalAnimal value=기타> 기타
        </div>
         
         <div class=col-12>진료시간</div>
                  <div class=col-12><input type="checkbox" name=openTime value=주간진료> 주간진료
        <input type="checkbox" name=openTime value=야간응급진료> 야간응급진료
        <input type="checkbox" name=openTime value=24시간진료> 24시간진료
        
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