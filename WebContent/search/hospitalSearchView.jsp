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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="resources/css/mainStyle.css">
        <style>
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
            <jsp:include page="../standard/header.jsp" /> 
                     
 <%--검색 컨테이너 시작 --%>
			<div class=row>
                <div id="article-botton" class="col-12 line mb-3 p-0">
                <form action="${pageContext.request.contextPath}/searchFrom.s" class="col-12" method="post">
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
           <jsp:include page="../standard/footer.jsp" />
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