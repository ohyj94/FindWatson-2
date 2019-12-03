<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>찾아줘 왓슨!</title>
        <%--부트 스트랩 --%>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

            <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

            <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="resources/css/mainStyle.css">


            <style>
                img{
                    width:500px;
                }
                h5{
                    text-align: right;
                }
                .hosIn1{
                    height: 80%;
                }
                .hosIn2{
                    height: 20%;
                }
                table,table *{
                    border  :1px solid black;
                }
                #map{
                    width: 100%;
                    height: 450px;
                }
                #hosImg{
                    width:100%;
                }
                hr{
                    background-color: darkgrey;  
                }
                p{
                    margin: 0px;
                }
                .title{
                    width: 100px;
                }
                .btn{
                    background-color: lightgray;                           
                    border : solid 1px white;                                                       
                }
                .view_div{
                    border: 1px solid grey;
                }
                #btn_map{
                    border-right-style: solid 1px white;
                }
                #map_title{
                    background-color: gainsboro;
                    padding: 10px;
                    margin-bottom: 0px;
                }
            </style>
            </head>
        <body>
            <div class="container">
                 <jsp:include page="../standard/header.jsp" />   
                <%-- --%>
                    <div class = "row">
                        <div class = "col-12">
                            <h1>${contents.hosptName}</h1>
                            <h6>정보수정일 : ${contents.registDate}</h6>
                            <hr>
                        </div>
                    </div>

                    <div class = row>
                        <div class = "col-12 col-md-6">
                            <img src="${contents.img}" id=hosImg name=hosImg>
                        </div>
                        
                        <div class = "col-12 col-md-6">
                            <div class="row hosIn1">
                                <div class =col-12>
                                    <p><label class = title>병원 이름</label>${contents.hosptName}</p>
                                    <p><label class = title>주소</label>${contents.address1} ${contents.address2}</p>
                                    <p><label class = title>전화번호</label>${contents.phone}</p>
                                    <p><label class = title>홈페이지</label>${contents.homepage}</p>
                                    <p><label class = title>진료 동물</label>${contents.medicalAnimal}</p>
                                    <p><label class = title>운영 시간</label>${contents.openTime}</p>
                                </div>
                            </div> 
                            <div class="row hosIn2">
                                <div class =col-12>
                                    <button type="button" class="btn btn-secondary" >정보 수정 제안</button>
                                </div>
                            </div>                
                        </div>

                    </div>
                    <div class = row>
                        <div class = col>
                            <label>Total. </label> ${contents.viewCount}
                        </div>
                    </div>

                    <%--지도, 후기--%>
                        <div class=row>
                            <div class= col-12>
                                <br>
                                <div class="btn-group" role="group" aria-label="Basic example">

                                    <button type="button" class="btn btn-secondary" id=btnMap>지도</button>
                                    <button type="button" class="btn btn-secondary" id=btnReview>후기</button>
                                </div>
                                <hr>
                            </div>
                        </div>


                        <div class = row>
                            <div class = "col-12">
                                <br>
                                <h2 id= map_title>찾아가는 길</h2>
                                <div id = map></div>
                                <br>
                            </div>
                        </div>

                        <%-- --%>
                            <jsp:include page="../standard/footer.jsp" />
                            </div>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ebb4503ccfdcae7c7da7ddc3ecf4d58"></script>
                        <script>
                            var place = [];
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = { 
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                };
                            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


                            // 지도를 클릭한 위치에 표출할 마커입니다
                            var marker = new kakao.maps.Marker({ 
                                // 지도 중심좌표에 마커를 생성합니다 
                                position: map.getCenter() 
                            }); 
                            // 지도에 마커를 표시합니다
                            marker.setMap(map);

                            // 지도에 클릭 이벤트를 등록합니다
                            // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        

                                // 클릭한 위도, 경도 정보를 가져옵니다 
                                var latlng = mouseEvent.latLng; 

                                // 마커 위치를 클릭한 위치로 옮깁니다
                                marker.setPosition(latlng);
                                //                 marker.setMap(map);
                            });
                            
                            //버튼
                            //1. 정보수정제안
                            
                            //2. 지도
                            $("#btnMap").on("click", function(){
                            	location.href="${pageContext.request.contextPath}/contents.s?seq=${contents.seq}";
                            })
                            //3. 후기
                            $("#btnReview").on("click", function(){
                            	location.href="${pageContext.request.contextPath}/hospitalSearchDetail2.re?seq=${contents.seq}";
                            })
                        </script>
                        </body>
                    </html>