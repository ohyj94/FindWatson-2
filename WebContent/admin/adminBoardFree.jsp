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
							<h3 id="board-top" class="col-auto col-sm-4 m-0">자유게시판</h3>
							<span class="col-auto col-sm-8 mt-2">자유롭게 소통하는 공간 입니다.</span>
						</div>
						<div class="row line2">
							<div class="col-1 d-none d-lg-block"></div>
							<div class="col-md-1 d-none d-lg-block">말머리</div>
							<div class="col-md-5 d-none d-lg-block">제목</div>
							<div class="col-md-2 d-none d-lg-block text-center">작성자</div>
							<div class="col-md-2 d-none d-lg-block text-center">작성날짜</div>
							<div class="col-md-1 d-none d-lg-block">조회수</div>
						</div>
						<!-- 게시글 목록 -->
						<c:choose>
							<c:when test="${list.size() == 0}">게시물이 없습니다.</c:when>
							<c:when test="${list.size() > 0}">
								<c:forEach items="${list}" var="dto">
									<div class="row line2">
										<div class="order-md-1 col-1 d-none d-md-block">${dto.seq}</div>
										<div class="col-1 order-1 col-md-1 order-md-2">
											[${dto.animalHeader}]</div>
										<div class="col-11 order-2 col-md-4 order-md-3 text-left">
											<a class=black href='${pageContext.request.contextPath}/freeDetail.bo?seq=${dto.seq}'>${dto.title}</a>
										</div>
										<div class="ftsm col-2 order-3 col-md-2 order-md-4 text-center gray">${dto.writer}</div>
										<div class="ftsm col-2 order-4 col-md-2 order-md-5 text-center gray">${dto.getDate()}</div>
										<div class="ftsm col-2 order-5 col-md-1 order-md-6 text-center gray">${dto.viewCount}</div>
											<div class="ftsm col-4 order-6 d-md-none"></div>
										<div class="col-2 order-7 col-md-1 order-md-7 text-center">
											<span id=remove${dto.seq} class=ftsm>삭제</span>
											</div>
									</div>
									<script>
										$("#remove${dto.seq}").on("click",function() {
															var result = confirm("정말 삭제하시겠습니까?");
															if (result) {
																location.href = '${pageContext.request.contextPath}/boardRemove.admin?seq=${dto.seq}';
															}
														})
									</script>
								</c:forEach>
							</c:when>
						</c:choose>
						<div class="row">
							<div class="col-12 text-center">${pageNavi}</div>
						</div>
						
						<!-- 게시물 검색 -->
						<form action="${pageContext.request.contextPath}/searchFree.admin" method="post">
						
						<div class="row mb-2">
							<div class="col-auto col-sm-2 p-1">
								<select id="category" name="category">
									<option value="title">제목</option>
										<option value="writer">작성자</option>
										<option value="animalheader">동물 분류</option>
								</select>
							</div>
							<div class="search-box col-auto col-sm-6 p-1">
								<input type="text" class="" id="search" name="keyword">
							</div>
							<div class="search-box col-auto col-sm-2 p-1">
								<button class="btn btn-sm btn-outline-secondary">검색</button>
							</div>
						</div>
						
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--            -->
		<jsp:include page="../standard/footer.jsp" />

	</div>
</body>
</html>