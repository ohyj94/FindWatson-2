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

            결제 실패!
관리자에게 문의바람
admin@admin.co.kr

            <!--            -->
            <jsp:include page="../standard/footer.jsp" />
        </div>
        
        <script>
            
            //나중에 링크 수정하기
        $("#myDonaBtn").on("click", function(){
            location.href="#";
        })
        $("#toMainBtn").on("click", function(){
            location.href="#";
        })
        </script>
    </body>
</html>