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
		
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700,900&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/mainStyle.css">
<style>
#board-top {
text-align: left !important;
}
textarea{
min-height:500px;
resize:none;
}
</style>

</head>
<body>
<div class="container col-12">
	<jsp:include page="../standard/headerMember.jsp" />   	     
	<div class="row mt-2">
	    <div class="col d-none d-sm-block"></div>	        
	        <!--  -->
	        
	        <div class="container">
	        <div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<div id="board-top" class="col-12 m-0"><strong>1:1 문의</strong></div>							
						</div>
						<hr>
						
						<div class="col-12">
							<form action="${pageContext.request.contextPath}/onebyoneInsert.member" method="post">
								<div class="row">							
                    				<div class="col-12 p-1">
                        				<input type="text" class="" id="title" name="title" placeholder="제목을 입력하세요" style="width:100%">
                    				</div>
								</div>
                				<div class="row">
                    			<div class="col-12 p-1">
                       			 
                        			<textarea name=content id=content placeholder="내용을 입력하세요" style="width:100%"></textarea>
                        		
                    			</div>
               					</div>
							<div class="row mb-2">
                   				<div class="col-12 p-1 text-center">
                       				<button id="writeBtn" type="button" class="btn btn-sm btn-outline-secondary">작성</button>
                        			<button id="returnBtn" type="button" class="btn btn-sm btn-outline-secondary">돌아가기</button>
                   				</div>
							</div>
							</form>
						</div>	

					</div>
				</div>
			</div>
		</div>
	</div>
	        
	<!-- -->
	        
	    <div class="col d-none d-sm-block"></div>
	</div>
	<jsp:include page="../standard/footer.jsp" />	
	</div>

<script>
$("#returnBtn").on("click",function(){
	var result = confirm("입력하신 내용은 저장되지 않습니다. 정말 돌아가시겠습니까?");
	if(result){
		history.back();
	}
})

$("#writeBtn").on("click", function(){
	$("form").submit();
})
</script>

        
        
</body>
</html>