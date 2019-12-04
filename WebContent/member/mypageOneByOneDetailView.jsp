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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainStyle.css">
<style>
	.contents{width: 100%; height: 300px;}
	.comment-box>*{width: 100%;}
    .write-box>*{width: 100%; height: 100%;}
    .txtaReSize{resize: none;};
</style>
</head>
<body>
	<div class="container col-12">
		<jsp:include page="../standard/headerMember.jsp"/>
		<div class="row mt-2">
	    <div class="col d-none d-sm-block"></div>
		<!--  -->
		
            <div class="row">
                <div class="col-12 mb-3" id="article">
                    <div class="row">
                        <div id="article-middle" class="col-12 mt-2">
                           <div class="row mb-3 p-1 text-center">
                                <h3 id="board-top" class="col-auto col-sm-4 m-0">1:1 문의</h3>
                                <c:if test="${dto.anserOK eq '답변완료'}">	
					                <div class="col-8 mt-2 text-right" style="color: green">
										${dto.anserOK}
						            </div>
				                </c:if>
				                <c:if test="${dto.anserOK eq '답변대기중'}">	
					                <div class="col-8 mt-2 text-right" style="color: red">
										${dto.anserOK}
						            </div>
				                </c:if>
                            </div>
                            <div class="row">
                                <div class="col-2 p-1 line text-center">
                                        ${dto.header}
                                </div>
                                <div class="col-10 p-1 line">
                                        ${dto.title}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 p-1 line contents">
                                    ${dto.content}
                                </div>
                            </div>
                         <div class="row" id=commentContainer>
                            <c:forEach items="${commentList}" var="comment">
						 
                                <div class="col-10 p-1 line text-center">
                                       ${comment.comment}
                                </div>
                                <div class="col-2 p-1 line">
                                        ${comment.writeDate}
                                </div>
                            
							</c:forEach>
                           	</div>
                           	
                        </div>
                    </div>
                </div>
            </div>
               <div class="col d-none d-sm-block"></div>
	</div>
		<!--  -->
		<jsp:include page="../standard/footer.jsp" />
	</div>
	
	<script>
	
	</script>
</body>
</html>