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
        
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/mainStyle.css">

        <style>
            #category{width: 100%; height: 100%;}
            .search-box>*{width: 100%;}
            .write-box>*{width: 100%;}
            #article, .line{
                border: 0.5px solid lightgray;
            }
        </style>
</head>
<body>
<div class=container>
            <jsp:include page="../standard/headerMember.jsp" />
		<!--  -->
		<div class=row>
		<div class=col-12>
		<h3>커뮤니티 - 질문</h3>
				<h4>${dto.title}</h4>
		</div>
		</div>
		<div class=row>
			<div class=col-6>
				<h5>${dto.writer}</h5>
			</div>
			<div class="col-6">
				<h5 class="right">${dto.getDate()}&emsp;view.${dto.viewCount}</h5>
			</div>
			<hr>
		</div>
		<div class=row>
			<div class=col-12 id=boardContent>${dto.content}</div>
		</div>
		<c:choose>
		<c:when test="${loginInfo == dto.writer}">
		<div class=row>
			<div class=col-12 id=boardContent><button id = modify>수정</button><button id=remove>삭제</button></div>
		</div>
		<script>
		$("#remove").on("click",function(){
			location.href ='${pageContext.request.contextPath}/boardRemove.bo?seq=${dto.seq}';
		})
		$("#modify").on("click", function(){
			alert("준비중입니다.");
		})
		</script>
		</c:when>
		</c:choose>
		<!--  -->
		<jsp:include page="../standard/footer.jsp" />
	</div>
</body>
</html>