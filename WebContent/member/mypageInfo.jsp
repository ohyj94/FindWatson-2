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
  			<div class =row>
                        <div class= col-12>
                            <h5>아이디</h5>
                            ${dto.id}
                        </div>
                    </div>

                    <div class =row>
                        <div class= col-12>
                            <h5>이름</h5>
                            ${dto.name}
                        </div>
                        <div class=col-12>
                            <div id=nameCheck></div>
                        </div>
                    </div>

                    <div class =row>
                        <div class= "col-12">
                            <h5>생년월일</h5>
                            ${dto.birth}
                        </div>
                    </div>

                    <div class =row>
                        <div class= col-12>
                            <h5>성별</h5>
                            ${dto.gender}
                        </div>
                    </div>

                    <div class =row>
                        <div class= col-12>
                            <h5>본인 확인 이메일</h5>
                            ${dto.email}
                        </div>
                    </div>

                    <div class =row>
                        <div class= col-12>
                            <h5>휴대폰 번호</h5>
                            ${dto.phone}
                        </div>
                    </div>

                    <div class=row>
                        <div class= col-12>
                            <h5>주소</h5>
                            ${dto.postcode}
                            ${dto.address1}
                            ${dto.address2}
                        </div>
                    </div>

                    <div class= row>
                        <div class=col-12>
                            <h5>관심 동물</h5>
                             ${dto.lovePet}
                        </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/InfoModify.member">
                     <input type=hidden name="id" value=${ dto.id}>
                     <input type=hidden name="pw" value=${ dto.pw}>
                     <input type=hidden name="name" value=${ dto.name}>
                     <input type=hidden name="birth" value=${ dto.birth}>
                     <input type=hidden name="gender" value=${ dto.gender}>
                     <input type=hidden name="email" value=${ dto.email}>
                     <input type=hidden name="phone" value=${ dto.phone}>
                     <input type=hidden name="postcode" value=${ dto.postcode}>
                     <input type=hidden name="address1" value=${ dto.address1}>
                     <input type=hidden name="address2" value=${ dto.address2}>
                     <input type=hidden name="lovePet" value=${ dto.lovePet}>
                     <input type=hidden name="signPath" value=${ dto.signPath}>

                    <div>
                     <button type="button" id=modify class="btn btn-outline-secondary">정보수정</button></div>
                    </form>

            <!--            -->  
             <jsp:include page="../standard/footer.jsp" />  
        </div>
</body>
</html>