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
		<link rel="stylesheet" href="../resources/css/mainStyle.css">
</head>
<body>
<div class="container">
<jsp:include page="../standard/header.jsp" />  
            <!--            -->
            <form action="${pageContext.request.contextPath}/login.member" method=post id=frm class="col-12">
			<div class=row>
                <div class=col-12>
                    <h1>로그인</h1>
                    <hr>
                </div>
            </div>

            <div class=row>
                <div class="col-12 con">
                  
                    <input type=text id=id name="id">
                    <br>
                    <input type=text id=pw name="pw">
     
                </div>
            </div>
            
            <div class=row>
                <div class="col-12 con">
                  <a href="#">아이디 찾기</a> / 
                  <a href="#">비밀번호 찾기</a>  
                </div>
            </div>
            
            <div class=row>
                <div class="col-12 con">
                	<button type="button" id=tologin>로그인</button>
                    <button type="button" id=signUp>회원가입</button>
                </div>
            </div>
            </form>
            <!--            -->
			<jsp:include page="../standard/footer.jsp" />
        </div>
         <script>
            $("#signUp").on("click",function(){
                location.href="signup.jsp";
            });
	        $("#tologin").on("click",function(){
	        	$("#frm").submit();
	        });
        
        </script>
</body>
</html>