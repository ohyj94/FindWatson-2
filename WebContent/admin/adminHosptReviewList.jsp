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
                    <h3 id="board-top" class="col-auto col-sm-4 m-0">병원 리뷰 관리</h3>
                    <span class="col-auto col-sm-8 mt-2">
                           <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
                    </span>
            </div>
            <div class="row line">
                
                <div class="col-md-2 d-none d-md-block">
                    글번호
                </div>
                <div class="col-md-2 d-none d-md-block">
           	병원 번호
                </div>
                <div class="col-md-4 d-none d-md-block">
            	제목
                </div>
                <div class="col-md-2 d-none d-md-block">
            	작성자
                </div>
                <div class="col-md-2 d-none d-md-block">
            	작성일
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
                
                <div class="col-md-2 d-none d-md-block">
                    ${list.seq}
                </div>
                <div class="col-md-2 d-none d-md-block">
           			${list.hosptListSeq}
                </div>
                <div class="col-md-4 d-none d-md-block">
                    ${list.title}
                </div>
                <div class="col-md-2 d-none d-md-block">
                    ${list.writer}
                </div>
                <div class="col-md-2 d-none d-md-block">${list.writeDate}<button type=button id=remove${list.seq}>삭제</button>
								</div>
            </div>
            	<script>
										$("#remove${list.seq}").on("click",function() {
															var result = confirm("정말 삭제하시겠습니까?");
															if (result) {
																location.href = '${pageContext.request.contextPath}/memberReviewRemove.admin?seq=${list.seq}';
															}
														})
									</script>
            </c:forEach>
           </c:otherwise>
           </c:choose>
                            <div class="row">
                                <div class="col-12 text-center">
                                    ${pageNavi}
                                </div>
                            </div>
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
                                <div class="write-box col-auto col-sm-2 text-center p-1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            -->
            <jsp:include page="../standard/footer.jsp" /> 	
</div>
</body>
</html>