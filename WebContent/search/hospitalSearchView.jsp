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
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
            
            
 <%--검색 컨테이너 시작 --%>
<form action="${pageContext.request.contextPath}/searchFrom.s" method="post">
            <div class="container detailSearch">
                <div class =row>
                    <div class=col-12>
                        <h5> 지역별 검색</h5>
                    </div>
                </div>
                   <div class = row>
                    <div class=col-3>
                        <select name="address" id="address">
                       	<option value="null">-시 선택-</option>
						<option value="서울">서울</option>
                        </select>
                    </div>
                    <div class=col-3>
                        <select name="address2" id="address2">
                      	<option value="null">-구 선택-</option>
                        </select>
                    </div>
             

                    <div class = col-3>
                        <button id=send_btn>검색</button>
                    </div>
                </div>

                <div class=row>
                    <div class=col-12>
                        <h5> 진료동물</h5>
                    </div>
                </div>

                <div class = row>
                    <div class=col-3>
                        새<input type="checkbox" name=animal value=새>
                    </div>
                    <div class=col-3>
                        물고기<input type="checkbox" name=animal value=물고기>
                    </div>
                    <div class=col-3>
                        햄스터<input type="checkbox" name=animal value=햄스터>
                    </div>
                    <div class=col-3>
                        토끼<input type="checkbox" name=animal value=토끼>
                    </div>
                </div>
                <div class = row>
                    <div class=col-3>
                        고슴도치<input type="checkbox" name=animal value=고슴도치>
                    </div>
                    <div class=col-3>
                        파충류<input type="checkbox" name=animal value=파충류>
                    </div>
                    <div class=col-3>
                        곤충류<input type="checkbox" name=animal value=곤충류>
                    </div>
                    <div class=col-3>
                        기타<input type="checkbox" name=animal value=기타>
                    </div>
                </div>

                <div class= row>
                    <div class= col-12>
                        <h5>진료 시간</h5>
                    </div>
                </div>
                <div class=row>
                    <div class=col-4>
                      <input type="checkbox" name=time value=주간진료>주간진료
                    </div>
                    <div class=col-4>
                        <input type="checkbox" name=time value=24시간진료>24시간진료
                    </div>
                    <div class=col-4>
                     	<input type="checkbox" name=time value=야간응급진료>야간응급진료
                    </div>
            
                </div>
            </div>
            </form>
             <%--검색 컨테이너 끝 --%>

    <%-- 검색 결과 컨테이너 시작 --%>
            <div class =row>
                <div class=col-12>
                    <h1>2(검색된 병원)</h1>
                    <hr>
                </div>
            </div>
            
            		<c:choose>
            		<%-- 글이 없는 경우  --%>
				<c:when test="${list.size() == 0}">
				<tr align=center>
					<td colspan=5 height=300p >글이 없습니다</td></tr>
				</c:when>
<%-- 글이 있는 경우 --%>
				<c:otherwise>
				
            <c:forEach items="${list}" var="hospital">
            <div class =row>
                <div class=col-4>
                    <img src = "${hospital.img}" id =hImg >
                </div>
                <div class = col-8>
                     <a href="contents.s?seq=${hospital.seq}">${hospital.hosptName}</a>
                  
                    <ul>
                        <li>순서 : "${hospital.seq}"</li>
                        <li>병원 이름 : "${hospital.hosptName}"</li>
                        <li>우편번호 : ${hospital.postcode}</li>
                        <li>주소1 : ${hospital.address1}</li>
                        <li>주소2 : ${hospital.address2}</li>
                        <li>전화번호 : ${hospital.phone}</li>
                        <li>홈페이지 : ${hospital.homepage}</li>
                        <li>진료 동물 : ${hospital.medicalAnimal}</li>
                        <li>진료 시간 : ${hospital.openTime}</li>
                        <li>정보 등록일 : ${hospital.registDate}</li> 
                         <li>조회수 : ${hospital.viewCount}</li> 
                    </ul>
                    
                </div>
            </div>
            </c:forEach>
            	</c:otherwise>
		</c:choose>
		
      <%-- 검색 결과 컨테이너 끝 --%>
            
            
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
        
             <script>
        $("#address1").on("click", function(){
    		$.ajax({
    			url : "selectGu.s",
    			type : "post",
    			dataType : "json",
    			data : {city : $("#address1 option:selected").val()}
    		}).done(function(result){
    			$("#address2").find("option").remove().end().append("<option value=''>전체</option>");
    			  
    			  //배열 개수 만큼 option 추가
    			   $.each(result, function(i){
    			    $("#address2").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
    			   });  
    		}).fail(function(){
    			alert("오류 발생");
    		});
    	})
        </script>
        
</body>
</html>