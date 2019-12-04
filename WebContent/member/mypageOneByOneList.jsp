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
        <link rel="stylesheet" href="resources/css/mainStyle.css">

<style>
.line{
border:none;
}
#board-top {
text-align: left !important;
}
#boardTitle{
border-top: 2px solid black;
border-bottom: 2px solid black;
}
#boardCon{
border-top: 1px solid gray;
}
#boardPage{
border-top: 1px solid gray;
}
.write-box {
text-align:right;
}
.delBtn{
border:1px solid gray;
}
.delBtn:hover{
color:gray;
}
.delBtn {
text-align: center;
}
</style>
</head>
<body>
<!-- container -->
	<div class="container col-12">
	
	<!-- 헤더 -->
	<jsp:include page="../standard/headerMember.jsp" />   
	     
	<div class="row mt-2">
	        
	        <!-- 중심내용 -->
	  <div class=container>
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<div id="board-top" class="col-12 m-0"><strong>1:1 문의</strong></div>							
						</div>
						<hr>
						<div class="row line m-0 pt-1 pb-1" id=boardTitle>
							<div class="col-2 d-none d-lg-block text-center">답변현황</div>
							<div class="col-2 d-none d-lg-block text-center">문의유형</div>
							<div class="col-5 d-none d-lg-block">제목</div>
							<div class="col-2 d-none d-lg-block text-center">문의날짜</div>
							<div class="col-1 d-none d-lg-block"></div>
						</div>
						<!-- 게시글 목록 -->
						<c:choose>
						<c:when test="${list.size() == 0}">	게시물이 없습니다.</c:when>
						<c:when test="${list.size() > 0}">
							<c:forEach items="${list}" var="list">
							<div class="row line m-0 pt-1 pb-1" id=boardCon>
								<c:if test="${list.anserOK eq '답변완료'}">	
	                				<div class="col-2 text-center" style="color: green">
									${list.anserOK}
	                				</div>
               					 </c:if>
               					 <c:if test="${list.anserOK eq '답변대기중'}">	
	                				<div class="col-2 text-center" style="color: red">
									${list.anserOK}
	               					 </div>
               					 </c:if>
							
						
								<div class="col-2 text-center">${list.header }</div>
								
								<div class="col-5 "><a id="toPost" href="${pageContext.request.contextPath}/mypageOneByOneDetailView.member?seq=${list.seq}">${list.title}</a></div>
								<div class="col-2 text-center ftsm gray">${list.date} </div>
								<div class="col-1 delBtn"><span id=remove${list.seq}>삭제</span></div>
							</div>
							<script>
								$("#remove${list.seq}").css("cursor","pointer");
								$("#remove${list.seq}").on("click",function() {
									var result = confirm("정말 삭제하시겠습니까?");
									if (result) {
										location.href = '${pageContext.request.contextPath}/OBOremove.member?seq=${list.seq}';
									}
								})
									</script>
						</c:forEach>
						</c:when>
						</c:choose>
						
						
						
						<div class="row">
							<div class="col-12 text-center pt-2 mt-1" id=boardPage>${pageNavi}</div>
						</div>
						<div class="row mb-2">													
							<div class="write-box col-12 p-1">
								<button class="btn btn-sm btn-outline-secondary" id="write">글쓰기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		 <!-- 중심내용 -->
	        
	</div>
	
	<!-- 푸터-->
	<jsp:include page="../standard/footer.jsp" />
	<script>
        	$('#write').on('click',function(){
        		location.href="${pageContext.request.contextPath}/mypageOneByOne.member";
        	})
        	
        </script>
	</div>
<!-- container --> 
        
        
        
</body>
</html>