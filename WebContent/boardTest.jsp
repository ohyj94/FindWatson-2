<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<button id="toBN" type="button">공지사항</button>
	<button id="toBF" type="button">자유게시판</button>
	<button id="toBQ" type="button">질문게시판</button>
	<button id="toBE" type="button">전문가Q&A</button>
	<button id="toBQbO" type="button">1:1 문의</button>
	
	<script>
		$("#toBN").on("click",function(){
			location.href="boardNotice.bo";
		});
		$("#toBF").on("click",function(){
			location.href="boardFree.bo";
		});
		$("#toBQ").on("click",function(){
			location.href="boardQuestion.bo";
		});
		$("#toBE").on("click",function(){
			location.href="boardExpert.bo";
		});
		$("#toBQbO").on("click",function(){
			location.href="adminOneByOne.admin";
		});
	</script>
</body>
</html>