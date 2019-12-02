<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">

</head>
<body>
	<div class="container">


		<jsp:include page="../standard/headerAdmin.jsp" /> 	

		<!--            -->
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<h3 id="board-top" class="col-auto col-sm-4 m-0">질문게시판</h3>
							<span class="col-auto col-sm-8 mt-2">자유롭게 질문하는 공간 입니다.</span>
						</div>
						<div class="row line">
							<div class="col-1 d-none d-md-block"></div>
							<div class="col-md-2 d-none d-md-block">말머리</div>
							<div class="col-md-5 d-none d-md-block">제목</div>
							<div class="col-md-2 d-none d-md-block">작성자</div>
							<div class="col-md-2 d-none d-md-block">작성날짜</div>
						</div>
						<!-- 게시글 목록 -->
						<c:choose>
							<c:when test="${list.size() == 0}">게시물이 없습니다.</c:when>
							<c:when test="${list.size() > 0}">
								<c:forEach items="${list}" var="dto">
									<div class="row line">
										<div class="col-1 d-none d-md-block">1</div>
										<div class="col-md-2 d-none d-md-block">
											${dto.animalHeader}</div>
										<div class="col-8 col-md-5 text-left">${dto.title}</div>
										<!-- 모바일에서만 보이는 div -->
										<div class="col-4 d-block d-md-none">${dto.animalHeader}</div>
										<!-- 모바일에서만 보이는 div -->
										<div class="col-6 col-md-2 text-left">${dto.writer}</div>
										<div class="col-6 col-md-2 text-center">
											${dto.writeDate}</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
						<div class="row">
							<div class="col-12 text-center">${pageNavi}</div>
						</div>
						<!-- -->
						<div class="row mb-2">
							<div class="col-auto col-sm-2 p-1">
								<select id="category">
									<option value="">제목</option>
								</select>
							</div>
							<div class="search-box col-auto col-sm-6 p-1">
								<input type="text" class="" id="search" name="search" value="">
							</div>
							<div class="search-box col-auto col-sm-2 p-1">
								<button class="btn btn-sm btn-outline-secondary">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--            -->
		<jsp:include page="../standard/footer.jsp" />
	</div>
	<script>
        	
	//각 버튼별 주소이동
	$("#logo").on("click", function() {
		location.href = "${pageContext.request.contextPath}/mainAdmin.jsp";
	});
	//공지사항으로 이동
	$("#notice").attr("href", "${pageContext.request.contextPath}/boardNotice.admin");
	//전문가 Q&A로 이동
	$("#expert").attr("href", "${pageContext.request.contextPath}/boardExpert.admin");
	//자유게시판으로 이동
	$("#free").attr("href", "${pageContext.request.contextPath}/boardFree.admin");
	//질문게시판으로 이동
	$("#question").attr("href", "${pageContext.request.contextPath}/boardQuestion.admin");
	//회원목록조회로 이동
	$("#memberList").attr("href", "${pageContext.request.contextPath}/adminMemberList.admin");
	//차단한ip목록조회로 이동
	$("#banList").attr("href", "${pageContext.request.contextPath}/adminBanList.admin");
        </script>

</body>
</html>