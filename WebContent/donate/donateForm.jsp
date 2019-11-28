<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>찾아줘 왓슨!</title>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
             

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

                /*            여기부터 내가 추가한 css*/

                .donate{

                }
                .donate img{
                    width: 100%;
                    z-index: -1;
                }
                #donateInfo{
                    position: absolute;
                    top: 800px;
                    left: 50%;
                    transform: translateX(-50%);
                }
                .dLabel{
                    width: 50px;
                    text-align: center;
                }
                .dInput{
                    width: 200px;
                }
                #donateBtn{
                    text-align: center;
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


                <div class="donate">
                    <img src="../imgs/donate/donate.jpg" alt="">   
                </div>
				<form action="${pageContext.request.contextPath }/donate.do" method="post">
				
                <div id="donateInfo">
                    <div id="donateId"><label class="dLabel">이름</label><input type="text" class="dInput" id="dName" name="dName"></div>
                    <div id="donatePhone"><label class="dLabel">핸드폰번호</label><input type="text" class="dInput" id="dPhone" name="dPhone"></div>
                    <div id="donatePrice">
                        <label class="dLabel">금액</label>
                        <select name="support" id="support" class="dInput">
                            <option value="1000">1000원</option>
                            <option value="2000">2000원</option>
                            <option value="5000">5000원</option>
                            <option value="10000">10000원</option>
                            <option value="50000">50000원</option>
                        </select>
                    </div>
                    <div id="donateBtn"><button type="button" id="payBtn">결제하기</button></div>
                </div>
                
                </form>

                <!--            -->
                <div class="row">
                    <div id="footer" class="col-12">
                        푸터
                    </div>
                </div>
            </div>
            
            <script>
            $("#payBtn").on("click", function(){
            	$("form").submit();
            })
            </script>
        </body>
    </html>