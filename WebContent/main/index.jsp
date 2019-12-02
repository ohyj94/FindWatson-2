<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>찾아줘! 왓슨</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../resources/css/mainStyle.css">
        <style>
			#article-top{
			position: relative;
			}
			#article-logo{
			background-color: ;
			}
			#article-img{
			height : 300px;
			}
			#searchTop{
			width: 90%;
			position: absolute;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color:#084480;
			border-radius: 3px;
			}
			#searchBtn1{
			background-color:#ffffff; 
			color:#084480;
			width: 5%;
			}
			.prevealTitle{
			background-color: ;
			}
			.prevealCon{
			border: ;
			}
            #article-botton{
            background-color: ;
            }
            #detailSearch{
            background-color:;
            }
            
            .imgSize{
                width: 100%;
                height: 300px;
            }
            #searchBtn2{width: 100%;}
            .line {;}
            label{margin-bottom: 0px;}
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../standard/header.jsp" />           
            <!--    내용시작        -->
            <div class="row">
                <div id="article-top" class="col-12 mb-5 p-0">
                    <!--여기 이미지  -->
                    <div id="article-logo" class="col-12 p-2 line">
                            <div id="article-img">이미지</div>
                    </div>
                    <!--  -->
                    
                        <div class="col-12 p-1" id="searchTop">
                        	<div class="col-12 p-0">
                        		<%-- keyword Search --%>
						<form class="form-inline" action="${pageContext.request.contextPath}/keywordSearch.s" class="col-12" method=post>
							<input class="form-control col-8 col-sm-10" type="search" placeholder="Search" aria-label="Search" name=keywordSearch>
							<button id="searchBtn1" class="btn btn-outline-secondary m-auto col-4 col-sm-2" type="submit">Search</button>
						</form>
							</div>
                        </div>
                   
                </div>
                <div id="article-middle" class="col-12 mb-3">
                    <div class="row line">
                        <div id="article-middle-left" class="col-12 col-md-6 text-center">
                            <div class="row line">
                                <div class="col-6 prevealTitle">공지사항</div>
                                <div class="col-6">
                                    <a href="boardNotice.bo">더보기</a>
                                </div>
                            </div>
                            <div class="row line">
                                <div class="col-12 prevealCon">
                                    <a href="#">공지</a><br> <a href="#">공지</a><br>
                                    <a href="#">공지</a><br> <a href="#">공지</a><br>
                                    <a href="#">공지</a><br>
                                </div>
                            </div>
                        </div>
                        <div id="article-middle-right" class="col-12 col-md-6 text-center">
                            <div class="row line">
                                <div class="col-6 prevealTitle">최신글</div>
                                <div class="col-6">
                                    <a href="#">더보기</a>
                                </div>
                            </div>
                            <div class="row line">
                                <div class="col-12 prevealCon">
                                    <a href="#">최신글</a><br>
                                    <a href="#">최신글</a><br>
                                    <a href="#">최신글</a><br>
                                    <a href="#">최신글</a><br>
                                    <a href="#">최신글</a><br>
                                </div>
                            </div>
                        </div>
                        <!-- 여기 캐러셀 -->
                        
                        <div id="carouselExampleIndicators"
                         class="carousel slide col-12 mt-5 mb-5 p-0" data-ride="carousel" style="width: 1000px; margin: auto">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../imgs/animal/%EB%B1%81%EC%83%88.png" class="imgSize d-block">
                            </div>
                            <div class="carousel-item">
                                <img src="../imgs/animal/%EA%B3%A0%EC%8A%B4%EB%8F%84%EC%B9%98.jpg" class="imgSize d-block">
                            </div>
                            <div class="carousel-item">
                                <img src="../imgs/animal/%EC%95%B5%EB%AC%B4%EC%83%88.jpg" class="imgSize d-block"> 
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
                        <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                        </a>
                    </div>
                        
                        <!--  -->
                    </div>
                </div>
                
                <%--검색 컨테이너 시작 --%>
			
                <div id="article-botton" class="col-12 p-0">
                	
                <form action="${pageContext.request.contextPath}/search/searchFrom.s" class="col-12 p-0" id="detailSearch" method="post">
                    <div class="col-12 line">동물병원 상세 검색</div>
                    <div id="area-search" class="col-12">
                        <div class="row line">
                            <label class="col-auto align-self-center">지역별</label>
                            <select name="address1" id="address1" class="col-12 col-sm-4">
                                <option value="null">-시 선택-</option>
                                <option value="서울">서울</option>
                            </select> <select name="address2" id="address2" class="col-12 col-sm-4">
                            <option value="null">-구 선택-</option>
                            </select>
                            
                        </div>
                        <div class="row line">
                            <div class="col-12 line">진료동물</div>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=새>새
                            </label>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=물고기>물고기
                            </label>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=햄스터>햄스터
                            </label>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=토끼>토끼
                            </label>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=고슴도치>고슴도치
                            </label>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=파충류>파충류
                            </label>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=곤충류>곤충류
                            </label>
                            <label class="col-4 col-md-3">
                                <input type="checkbox" name=animal value=기타>기타
                            </label>
                        </div>
                        <div class="row line">
                            <div class="col-12 line">진료시간</div>
                            <label class="col-12 col-md-4">
                                <input type="checkbox" name=time value=주간진료>주간진료
                            </label>
                            <label class="col-12 col-md-4">
                                <input type="checkbox" name=time value=24시간진료>24시간진료
                            </label>
                            <label class="col-12 col-md-4">
                                <input type="checkbox" name=time value=야간응급진료>야간응급진료
                            </label>
                        </div>
                        <div class="row line">
                        	<button id="searchBtn2" class="col m-0 btn btn-sm btn-outline-secondary">검색</button>
                        </div>
                    </div>
                     </form>
                    
                </div>
            </div>
            <!--            -->
            <jsp:include page="../standard/footer.jsp" />
        </div>
        <script type="text/javascript">
           $("#address1").on("click", function() {
				$.ajax({
					url : "${pageContext.request.contextPath}/selectGu.s",
					type : "post",
					dataType : "json",
					data : {
							city : $("#address1 option:selected").val()
							}
					}).done(function(result) {
						$("#address2").find("option")
									  .remove()
									  .end()
									  .append("<option value=''>전체</option>");

	             //배열 개수 만큼 option 추가
						$.each(result,function(i) {
							$("#address2").append("<option value='"+result[i]+"'>"
												+ result[i]
												+"</option>")
						});
					}).fail(function(){
						alert("오류 발생");
					});
			})
        </script>
    </body>
</html>