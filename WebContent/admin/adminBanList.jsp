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
                    <h3 id="board-top" class="col-auto col-sm-4 m-0">차단 IP 조회</h3>
                    <span class="col-auto col-sm-8 mt-2">
                           <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
                    </span>
            </div>
             <div class="row line"> 
            	 	<div class=col-12>
            	 	<hr style="border:solid 1px;">  
            	 	</div>
            </div>
            <div class="row line">
                
                <div class="col-4 d-block text-center">
                    아이디
                </div>
                <div class="col-4 d-block text-center">
           IP
                </div>
                <div class="col-4 d-block text-center">
                    차단 사유
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
            	 	<div class=col-12>
            	 	<hr style="border:solid 1px;">  
            	 	</div>
            </div>
           <div class="row line">
                
                <div class="col-4 d-block text-center">
                    ${list.id}
                </div>
                <div class="col-4 d-block text-center">
           			${list.ip }
                </div>
                <div class="col-4 d-block text-center">
                    ${list.reason }
                </div>
            </div>
            </c:forEach>
           </c:otherwise>
           </c:choose>
            <div class="row line"> 
            	 	<div class=col-12>
            	 	<hr style="border:solid 1px;">  
            	 	</div>
            </div>
                            <div class="row">
                                <div class="col-12 text-center">
                                    ${pageNavi}
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