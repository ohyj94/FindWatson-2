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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
</head>
<body>
<!-- container -->
   <div class="container col-12">
   
   <!-- 헤더 -->
   <jsp:include page="../standard/headerAdmin.jsp" />   
        
   <div class="row mt-2">
       <div class=container>
            <!--            -->
            <div class="row">
        <div class="col-12 mb-3" id="article">
            <div class="row">
            <div id="article-middle" class="col-12 mt-2">
                <div class="row mb-3 p-1 text-center">
                    <h3 id="board-top" class="col-auto col-sm-4 m-0">회원 목록 조회</h3>
                    <span class="col-auto col-sm-8 mt-2">
                           <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
                    </span>
                
            </div>
            <div class="row line"> 
            	<hr style="border:solid 10px black;">        
            </div>
            <div class="row line">
                
                <div class="col-4 d-block">
                    아이디
                </div>
                <div class="col-4 d-block">
           	이름
                </div>
                <div class="col-4 d-block">
            	차단하기
                </div>
            </div>
            <!-- 게시글 목록 -->
            
           
           <c:choose>
           <c:when test="${list.size() == 0}">
           	 <div class="row line">
           	<div class="col-12" style="text-align: center">표시할 내용이 없습니다.</div>
           		</div>
           </c:when>
           <c:otherwise>
           <c:forEach items="${list}" var="list">
           	<div class="row line">
                
                <div class="col-4 d-block">
                  ${list.id}
                </div>
                <div class="col-4 d-block">
           			${list.name }
                </div>
                <div class="col-4 d-block">
                    <a id="banIp${list.id}" href=#>차단</a>
                </div>
            </div>
            <script>
            	$("#banIp${list.id}").on("click",function(){
            		var reason = prompt("차단 사유 : ");
            		if(reason == ""){
            			alert("차단사유는 필수 입력 사항입니다.")
            		}else{
                		location.href="${pageContext.request.contextPath}/admin/adminDeleteMember.admin?id=${list.id}&ip=${list.ipAddr}&reason="+reason;
            		}
            	})
            </script>                
            </c:forEach>
           </c:otherwise>
           </c:choose>
            <form action="${pageContext.request.contextPath}/admin/adminSearchMember.admin" method="post">
                            <div class="row">
                                <div class="col-12 text-center">
                                    ${pageNavi}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <select id="category">
                                        <option value="">아이디</option>
                                    </select>
                                </div>
                              
                                <div class="search-box col-6">
                                    <input type="text" class="" id="search" name="search" value="">
                                </div>
                                <div class="search-box col-2">
                                    <button class="btn btn-sm btn-outline-secondary">검색</button>
                                </div>
                               
                               </form>
                                <script>
        	$('.btn btn-sm btn-outline-secondary').on('click',function(){
        		$('form').submit();
        	})
        </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
                          
            <!--            -->
         </div>
   </div>
   
   <!-- 푸터-->
   <jsp:include page="../standard/footer.jsp" />
   
   </div>
<!-- container --> 
</body>
</html>