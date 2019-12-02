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
<<<<<<< HEAD
    <div class="container">
		<jsp:include page="../standard/headerAdmin.jsp" />
            <!--            -->
            <div class="row">
        <div class="col-12 mb-3" id="article">
            <div class="row">
            <div id="article-middle" class="col-12 mt-2">
                <div class="row mb-3 p-1 text-center">
                    <h3 id="board-top" class="col-auto col-sm-4 m-0">전문가 Q&A</h3>
                    <span class="col-auto col-sm-8 mt-2">
                           <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
                    </span>
            </div>
            <div class="row line">
                
                <div class="col-md-2 d-none d-md-block">
                    글번호
                </div>
                <div class="col-md-2 d-none d-md-block">
           	작성자
                </div>
                <div class="col-md-2 d-none d-md-block">
                    제목
                </div>
                <div class="col-md-2 d-none d-md-block">
                    내용
                </div>
                <div class="col-md-2 d-none d-md-block">
                    작성일
                </div>
                <div class="col-md-2 d-none d-md-block">
                    조회수
                </div>
            </div>
            <!-- 게시글 목록 -->
           <c:forEach items="${list}" var="list">
           <div class="row line">
                
                <div class="col-md-2 d-none d-md-block">
                    ${list.seq}
                </div>
                <div class="col-md-2 d-none d-md-block">
                    ${list.writer}
                </div>
                <div class="col-md-2 d-none d-md-block">
                    ${list.title}
                </div>
                <div class="col-md-2 d-none d-md-block">
                    ${list.content}
                </div>
                <div class="col-md-2 d-none d-md-block">
                    ${list.formedDate}
                </div>
                <div class="col-md-2 d-none d-md-block">
                    ${list.viewCount}
                </div>
            </div>
            </c:forEach>
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
                                    <button class="btn btn-sm btn-outline-secondary">작성하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            -->
            <div class="row">
    <div id="footer" class="col-12">
        <div class="row p-1">
            <div id="footer-logo" class="col-4">
                <img id="logo" src="${pageContext.request.contextPath}/imgs/logo.png" class="d-none d-sm-block col-12">
            </div>
            <div id="footer-contents" class="col-8">
                <div class="row">
                    <div class="col-6 col-sm-auto"><a href="#">회사소개</a></div>
                    <div class="col-6 col-sm-auto"><a href="#">이용약관</a></div>
                    <div class="col-6 col-sm-auto"><a href="#">개인정보취급방침</a></div>
                    <div class="col-6 col-sm-auto"><a href="#">저작권안내</a></div>
                    <div class="col-12 col-sm-auto"><a href="#">후원하기</a></div>
                </div>
                <div class="row">
                    <div class="col-12">
                        상호명 : 찾아줘 왓슨! | 대표자 : 왓슨 | 사업자등록번호 : 100-12-191205
                    </div>
                    <div class="col-12">
                        주소 : 서울 중구 남대문로 120 대일빌딩 3층 F Class 대표전화 02-1544-9970
                    </div>
                    <div class="col-12">
                        Copyright(c) 2019 찾아줘 왓슨! All Rights Reserved.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<div class="container">
		<jsp:include page="../standard/headerAdmin.jsp" /> 	
		<!--            -->
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<h3 id="board-top" class="col-auto col-sm-4 m-0">전문가 Q&A</h3>
							<span class="col-auto col-sm-8 mt-2"> <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
							</span>
						</div>
						<div class="row line">
							<div class="col-md-2 d-none d-md-block">글번호</div>
							<div class="col-md-2 d-none d-md-block">작성자</div>
							<div class="col-md-4 d-none d-md-block">제목</div>
							<div class="col-md-2 d-none d-md-block">작성일</div>
							<div class="col-md-2 d-none d-md-block">조회수</div>
						</div>
						<!-- 게시글 목록 -->
						<c:forEach items="${list}" var="list">
							<div class="row line">
								<div class="col-md-2 d-none d-md-block">${list.seq}</div>
								<div class="col-md-2 d-none d-md-block">${list.writer}</div>
								<div class="col-md-4 d-none d-md-block"><a href='${pageContext.request.contextPath}/adminExpertDetailView.admin?seq=${list.seq}'>${list.title}</a></div>
								<div class="col-md-2 d-none d-md-block">
									${list.formedDate}</div>
								<div class="col-md-2 d-none d-md-block">${list.viewCount}
								</div>
							</div>
						</c:forEach>
						<div class="row">
							<div class="col-12 text-center">${pageNavi}</div>
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
								<button class="btn btn-sm btn-outline-secondary" id=writeBtn>작성하기</button>
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