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


</head>
<body>
<div class="container">
<jsp:include page="../standard/headerMember.jsp" />  
<!--            -->
  		 <form action="${pageContext.request.contextPath}/onebyoneInsert.member">
  			<div class =row>
                        <div class= col-12>
                            <h5>작성자</h5>
                            <div name=id>${id}</div>
                        </div>
                    </div>
  			<div class =row>
                        <div class= col-12>
                            <h5>제목</h5>
                            <input type="text" name=title>
                        </div>
                    </div>

                    <div class =row>
                        <div class= col-12>
                            <h5>내용</h5>
                            <input type="textarea" name=content>
                        </div>
                        
                    </div>
                    
                   
                    

                    <div><button id=insert>작성하기</button></div>
                    </form>

            <!--            -->  
             <jsp:include page="../standard/footer.jsp" />  
        </div>
        
        <script>
        	$('#insert').on('click',function(){
        		$('form').submit();
        	})
        </script>
        
        
        
</body>
</html>