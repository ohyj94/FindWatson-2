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
		
		<style>
		.inputs input{
		position: relative;
		
		}
		.btns{
		text-align:center;
		}
		div{
		text-align: center;
		}
		</style>
</head>
<body>
<div class="container col-12">
<jsp:include page="../standard/header.jsp" />
<div class="row mt-2">
	    <div class="col d-none d-sm-block"></div>
<!--            -->
  			<div class =row>
                        <div class= col-12>
                            <h5>아이디 : ${id}</h5> 
                        </div>
                    </div>

                    
           
  <div class="col d-none d-sm-block"></div>
	</div>
            <!--            -->  
             <jsp:include page="../standard/footer.jsp" />  
        </div>
</body>
</html>