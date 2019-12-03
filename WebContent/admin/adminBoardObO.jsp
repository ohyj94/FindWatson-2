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
<link rel="stylesheet" href="resources/css/adminBoard.css">
<style>
			#article, .line{
                border: 0.5px solid lightgray;
            }
             #category{width: 100%; height: 100%;}
            .search-box>*{width: 100%;}
            .write-box>*{width: 100%;}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../standard/headerAdmin.jsp" /> 		
		<!--            -->
		<div class=row>
			<div class="col-12 article">
			<div class="row">

            <div id="article-middle" class="col-12 mt-2">
                <div class="row mb-2 p-1 text-center">
                    <h3 id="board-top" class="col-auto col-sm-4 m-0">1:1 문의</h3>
                    <span class="col-auto col-sm-8 mt-2">
                           <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
                    </span>
            </div>
            <div class="row line">
                <div class="col-1 d-none d-md-block"></div>
                <div class="col-md-2 d-none d-md-block">
                    답변현황
                </div>
                <div class="col-md-2 d-none d-md-block">
                    말머리
                </div>
                <div class="col-md-5 d-none d-md-block">
                    제목
                </div>
                <div class="col-md-2 d-none d-md-block">
                    문의날짜
                </div>
            </div>
            <!-- 게시글 목록 -->
<c:choose>
<c:when test="${list.size() == 0}">
	게시물이 없습니다.
</c:when>
<c:when test="${list.size() > 0}">
<c:forEach items="${list}" var="list">
            <div class="row line">
                <div class="col-1 d-none d-md-block">${list.seq}</div>
                <c:if test="${list.anserOK eq '답변완료'}">	
	                <div class="col-md-2 d-none d-md-block" style="color: green">
						${list.anserOK}
	                </div>
                </c:if>
                <c:if test="${list.anserOK eq '답변대기중'}">	
	                <div class="col-md-2 d-none d-md-block" style="color: red">
						${list.anserOK}
	                </div>
                </c:if>
                <div class="col-md-2 d-none d-md-block">
                    ${list.header}
                </div>
                <div class="col-8 col-md-5 text-left">
                    <a id="toPost" href="${pageContext.request.contextPath}/adminObODetailView.admin?seq=${list.seq}">${list.title}</a>
                </div>
                <!-- 모바일에서만 보이는 div -->
                <div class="col-4 d-block d-md-none">${list.header}</div>
                <!-- 모바일에서만 보이는 div -->
                <div class="col-12 col-md-2 d-none d-sm-block">
                    ${list.writeDate}
                </div>
            </div>
</c:forEach>
</c:when>
</c:choose>
            <div class="row">
                <div class="col-12 text-center">${pageNavi}</div>
            </div>
                            <div class="row mb-2">
                                <div class="col-auto col-sm-2 p-1">
                                    <select id="category">
                                        <option value="">제목</option>
                                    </select>
                                </div>
                                <div class="search-box col col-sm-8 p-1">
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
	
</body>
</html>