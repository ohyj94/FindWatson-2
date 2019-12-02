<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--로그인 기능 연동되면 ${loginInfo == null}일때 로그인이 필요(알림창) 로그인페이지(이동) -->
<!-- Admin Controller와 Manager Controller 무슨 차이...? -->

<div class="row mb-2">
    <div id="loginBtn" class="col-12 p-1 text-right">
        <button class="btn btn-sm btn-outline-secondary">로그아웃</button>
    </div>
</div>
<div class="row">
    <div id="title" class="col-12 mb-3 p-1 text-center">
        <a id=home><img id="logo" src="${pageContext.request.contextPath}/imgs/logo.png" class="col-12"></a>
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
                        <a class="nav-link" id=notice>공지사항</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            병원관리
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" id="hospitalInsert">병원정보 등록</a>
                            <a class="dropdown-item" id="hospitalModify">병원정보 수정/삭제</a>
                            <a class="dropdown-item" id="hospitalReview">병원리뷰 관리</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            게시판관리
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" id = expert>전문가Q&amp;A</a>
                            <a class="dropdown-item" id = free>자유게시판</a>
                            <a class="dropdown-item" id = question>질문게시판</a>
                            <a class="dropdown-item" id = oneByOne>1:1문의게시판</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            회원관리
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" id = memberList>회원목록조회</a>
                            <a class="dropdown-item" id = banList>차단 IP 조회</a>
                            <a class="dropdown-item" id = memberCharts>회원 통계</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>    

<script>
		//각 버튼별 주소이동
		//홈
		$("#home").attr("href", "${pageContext.request.contextPath}/main/mainAdmin.jsp");
		//공지사항
		$("#notice").attr("href", "${pageContext.request.contextPath}/boardNotice.admin");
		
		//병원 관리 - 병원정보 등록
		$("#hospitalInsert").attr("href", "${pageContext.request.contextPath}/admin/adminHosptInsert.jsp");
		//병원 관리 - 병원정보 수정/삭제
		$("#hospitalModify").attr("href", "${pageContext.request.contextPath}/hosptInfoList.admin");
		//병원 관리 - 병원리뷰 관리
		$("#hospitalReview").attr("href", "${pageContext.request.contextPath}/hosptInfoList.admin");
		
		//게시판 관리 - 전문가 Q&A
		$("#expert").attr("href", "${pageContext.request.contextPath}/boardExpert.admin");
		//게시판 관리 - 자유게시판
		$("#free").attr("href", "${pageContext.request.contextPath}/boardFree.admin");
		//게시판 관리 - 질문게시판
		$("#question").attr("href", "${pageContext.request.contextPath}/boardQuestion.admin");
		//게시판 관리 - 일대일 문의
		$("#oneByOne").attr("href", "${pageContext.request.contextPath}/adminOneByOne.admin");
		
		//회원 관리 - 회원 목록 조회
		$("#memberList").attr("href", "${pageContext.request.contextPath}/adminMemberList.admin");
		//회원 관리 - 차단 ip 조회
		$("#banList").attr("href", "${pageContext.request.contextPath}/adminBanList.admin");
		//회원 관리 - 회원 통계
		$("#memberCharts").attr("href", "${pageContext.request.contextPath}/adminMemberChart.admin");
 		
		
		
</script>
