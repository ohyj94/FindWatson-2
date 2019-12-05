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
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700,900&display=swap&subset=korean" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
		
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
	<jsp:include page="../standard/headerAdmin.jsp" />   
	     
	<div class="row mt-2">
	        
	        <!-- 중심내용 -->
	  <div class=container>
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<div id="board-top" class="col-12 m-0"><strong>공지사항</strong></div>							
						</div>
						<hr>
						<div class="row line m-0 pt-1 pb-1" id=boardTitle>
							<div class="col-1 d-none d-lg-block">번호</div>
							<div class="col-7 d-none d-lg-block">제목</div>
							<div class="col-2 d-none d-lg-block">작성일</div>
							<div class="col-1 d-none d-lg-block">조회수</div>
							<div class="col-1 d-none d-lg-block"></div>
						</div>
						<!-- 게시글 목록 -->
						<c:forEach items="${list}" var="list">
							<div class="row line m-0 pt-1 pb-1" id=boardCon>
								<div class="col-1">${list.seq}</div>
								<div class="col-10 col-md-6 col-lg-7"><a href='${pageContext.request.contextPath}/adminNoticeDetailView.admin?seq=${list.seq}'>${list.title}</a></div>
								
								<div class="col-5 col-md-2 col-lg-2 ftsm gray"> ${list.formedDate}</div>
								<div class="col-4 col-md-1 col-lg-1 text-center ftsm gray">${list.viewCount} </div>
								<div class="col-2 col-md-2 col-lg-1 delBtn"><span id=remove${list.seq}>삭제</span></div>
							</div>
							<script>
								$("#remove${list.seq}").css("cursor","pointer");
								$("#remove${list.seq}").on("click",function() {
									var result = confirm("정말 삭제하시겠습니까?");
									if (result) {
										location.href = '${pageContext.request.contextPath}/noticeRemove.admin?seq=${list.seq}';
									}
								})
									</script>
						</c:forEach>
						
						<div class="row">
							<div class="col-12 text-center pt-2 mt-1" id=boardPage>${pageNavi}</div>
						</div>
						<div class="row mb-2">													
							<div class="write-box col-12 p-1">
								<button class="btn btn-sm btn-outline-secondary" id="writeBtn">글쓰기</button>
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
	//글쓰기 버튼
	$("#writeBtn").on("click",function(){
		location.href="${pageContext.request.contextPath}/admin/adminBoardNoticeWrite.jsp";
	})
	</script>
	</div>
<!-- container --> 
</body>
</html>