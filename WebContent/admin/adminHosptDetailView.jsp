<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원상세검색2</title>
		<%--부트 스트랩 --%>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

		<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


		<%--썸머노트 --%>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

		<%--별점 --%>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
<meta charset="UTF-8">

<style>
img {
	width: 500px;
}

#array {
	text-align: right;
}

.review>div {
	float: left;
}

.hosIn1 {
	height: 80%;
}

.hosIn2 {
	height: 20%;
}

#hosImg {
	width: 100%;
}

.center {
	text-align: center;
}
#page${cpage}{
	color : red;
}

.checked {
                color: orange;
            }
.starCon{
display :inline;
}

.fa-star:hover{
cursor : pointer;
}
#titleReview{
width:58%;
}
#starInputCon{
width:100px;
display:inline;
}
#sss{
text-align:right;
width:150px;
display:inline;
position:absolute;
right:2%;
}
#ssss{
position:relative;
}
.noneExist{
display:none;
}
</style>
</head>
<body>
	
		<div class="container">
			<jsp:include page="../standard/headerAdmin.jsp" />
			<!--            -->
			
			<form action="${pageContext.request.contextPath}/reviewWrite.re" method="post" id=reviewSave>
			<div class="row">
				<div class="col-12">
					<h1>${dto.hosptName}</h1>
					<h5>정보수정일 ${dto.registDate} 조회수 ${dto.viewCount}</h5>
					<hr>
				</div>
			</div>

			<div class=row>
				<div class="col-6">
					<img src="${dto.img}" id=hosImg>
				</div>
				<div class="col-6">
					<div class="row hosIn1">
						<div class=col-12>
							우편번호 : ${dto.postcode}<br>
							상세주소1 : ${dto.address1}<br>
							상세주소2 : ${dto.address2}<br>
							연락처 : ${dto.phone}<br>
							홈페이지 주소 : ${dto.homepage}
						</div>
					</div>
					<div class="row hosIn2">
						<div class=col-12>
							<button type="button" class="btn btn-secondary" id=hosptMdf>정보 수정</button>
							<button type="button" class="btn btn-secondary" id=hosptRemove>삭제</button>
						</div>
					</div>
				</div>
			</div>
			<!--            -->
            <jsp:include page="../standard/footer.jsp" />
			</form>
		</div>
	<script>
	$("#hosptMdf").on("click",function(){
		location.href = '${pageContext.request.contextPath}/hosptModify.admin?seq=${dto.seq}';
	})
	$("#hosptRemove").on("click",function(){
		var result = confirm("정말 삭제하시겠습니까?");
		if(result){
			location.href = '${pageContext.request.contextPath}/hosptRemove.admin?seq=${dto.seq}';
		}
	})
	</script>
</body>
</html>