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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainStyle.css">
<style>
#board-top {
text-align: left !important;
}
#boardContent{
min-height:500px;
}
.btns {
text-align:right;
}
</style>
</head>
<body>
	
<!-- container -->
	<div class="container col-12">
	<jsp:include page="../standard/headerMember.jsp" />   
	     
	<div class="row mt-2">
	   	 <div class="col d-none d-sm-block"></div>       
	        <!--  -->
	<div class="container col-12 col-sm-6">
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<div id="board-top" class="col-12 m-0"><strong>1:1 문의</strong></div>							
						</div>
						<hr>
						<div class=row>
							<div class=col-12>
							<h4>${dto.title}</h4>
							</div>
							<div class="col-12">
							<div class="row">
							<c:if test="${dto.anserOK eq '답변완료'}">	
					                <div class="col-6" style="color: green">
										${dto.anserOK}
						            </div>
				                </c:if>
				                <c:if test="${dto.anserOK eq '답변대기중'}">	
					                <div class="col-6" style="color: red">
										${dto.anserOK}
						            </div>
				                </c:if>
				            <div class="col-3">${dto.header}</div>
							<div class="col-3">${dto.date}</div>
							</div>
							<hr>
							</div>							
						</div>
					</div>
				</div>	
				<div class=row>
					<div class=col-12 id=boardContent>${dto.content}</div>
					
				</div>
				<hr>
				<div class="row commentContainer">
				<c:choose>
					<c:when test="${commentList.size() > 0 }">					
					<c:forEach items="${commentList}" var="comment">
						 	<div class="col-12 mt-2 mb-2 oneCom">
                                <div class="col-12 p-0">
                                    ${comment.comment}
                                </div>
                                <div class="col-12 p-0 ftsm gray thisline">
                                        ${comment.formedDate}
                                </div>
                            </div>
					</c:forEach>
					</c:when>
				</c:choose>
				
				</div>
				<hr>
				<div class="row btns">
					<div class="col-12">
					<button type="button" id="toNotice" class="btn btn-outline-secondary">돌아가기</button>
					<button type="button" id="delete" class="btn btn-outline-secondary">삭제</button>
					</div>
				</div>
		</div>
	</div>
</div>

		 <!--  -->
	    
	    
	    <div class="col d-none d-sm-block"></div>    
	</div>
	<!-- 푸터-->
	<jsp:include page="../standard/footer.jsp" />
	</div>
	
	
	<script>
	$("#delete").on("click", function(){
		var result = confirm("정말 삭제하시겠습니까?");
		if(result){
			location.href = '${pageContext.request.contextPath}/OBOremove.member?seq=${dto.seq}';
		}	
	})
	
	$("#toNotice").on("click", function(){
		history.back();
	})
	</script>
</body>
</html>