<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row mb-2">
    <div id="loginBtn" class="col-12 p-1 text-right">
        <button class="btn btn-sm btn-outline-secondary">로그아웃</button>
    </div>
</div>
<div class="row">
    <div id="title" class="col-12 mb-3 p-1 text-center">
        <a href="../main/mainAdmin.jsp"><img id="logo" src="../imgs/logo.png" class="col-12"></a>
    </div>
</div>
<div class="row">
    <div id="navi" class="col-12 mb-3 p-1">
        <nav class="p-0 navbar navbar-expand-sm navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">공지사항</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            병원관리
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">병원정보 등록</a>
                            <a class="dropdown-item" href="#">병원정보 수정/삭제</a>
                            <a class="dropdown-item" href="#">병원리뷰</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            게시판관리
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">전문가Q&amp;A</a>
                            <a class="dropdown-item" href="#">자유게시판</a>
                            <a class="dropdown-item" href="#">질문게시판</a>
                            <a class="dropdown-item" href="#">1:1문의게시판</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            회원관리
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">회원목록조회</a>
                            <a class="dropdown-item" href="#">차단 IP 조회</a>
                            <a class="dropdown-item" href="#">회원 통계</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>    

<script>
		//각 버튼별 주소이동
		$("#logo").on("click", function() {
			location.href = "../main/mainAdmin.jsp";
		});
		//공지사항으로 이동
		$("#notice").attr("href", "${pageContext.request.contextPath}/boardNotice.admin");
		//전문가 Q&A로 이동
		$("#expert").attr("href", "${pageContext.request.contextPath}/boardExpert.admin");
		//자유게시판으로 이동
		$("#free").attr("href", "${pageContext.request.contextPath}/boardFree.admin");
		//질문게시판으로 이동
		$("#question").attr("href", "${pageContext.request.contextPath}/boardQuestion.admin");
</script>
