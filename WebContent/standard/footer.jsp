<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row bg-light mt-2">
    <div class="col d-none d-sm-block"></div>
        <div id="footer" class="col-12 col-sm-6">
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
                        <div class="col-12 col-sm-auto"><a href="${pageContext.request.contextPath}/donate/donateForm.jsp">후원하기</a></div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            상호명 : 찾아줘! 왓슨 | 대표자 : 왓슨 | 사업자등록번호 : 100-12-191205
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
    <div class="col d-none d-sm-block"></div>
</div>
<script>
$("#donate").on("click",function(){
    location.href="${pageContext.request.contextPath}/donate/donateForm.jsp"
})
</script>