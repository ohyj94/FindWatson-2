<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row mb-2">
    <div id="loginBtn" class="col-12 p-1 text-right">
       <c:choose>
			<c:when test="${loginInfo ==null}">
				<button class="btn btn-sm btn-outline-secondary">로그인</button>
			</c:when>
			<c:otherwise>
				<button id=logout class="btn btn-sm btn-outline-secondary">로그아웃</button>
			</c:otherwise>
		</c:choose> 
    </div>
</div>
<div class="row">
    <div id="title" class="col-12 mb-3 p-1 text-center">
        <img id="logo" src="${pageContext.request.contextPath}/imgs/logo.png" class="col-12">
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
                    <li class="nav-item">
                        <a class="nav-link" href="#">병원검색</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">전문가Q&A</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            커뮤니티
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">자유게시판</a>
                            <a class="dropdown-item" href="#">질문게시판</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            마이페이지
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">내 정보</a>
                            <a class="dropdown-item" href="#">내 후원보기</a>
                            <a class="dropdown-item" href="#">1 : 1 문의</a>
                            <a class="dropdown-item" href="#">회원 탈퇴</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>