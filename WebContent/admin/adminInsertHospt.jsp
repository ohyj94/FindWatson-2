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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../resources/css/adminBoard.css">
<style>
/*div {border: 1px solid black}*/
#imgCon {width: 300px;height: 300px;}
#image_preview {display:none;}
#imgRemove{ color: black;} 
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../standard/headerAdmin.jsp" />
		<!--            -->
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<h3 id="board-top" class="col-auto col-sm-4 m-0">병원 정보 등록</h3>
							<span class="col-auto col-sm-8 mt-2"> <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
							</span>
						</div>
						<form action="${pageContext.request.contextPath}/hosptInfoInsert.admin" method="post" id="frm" enctype="multipart/form-data">
							<div class="row line">
								<div class="col-12">
									병원이름 <input type="text" id="name" name=name>
								</div>
								<br>
								<div class="col-12">
									우편번호 
									<input type="text" id="postcode" name=postcode placeholder="우편번호" readonly>
									<button id=addressBtn type="button" onclick="sample4_execDaumPostcode()">찾기</button>
								</div>
								<div class="col-12">
									주소1
									<input type="text" id="address1" name=address1 placeholder="주소1" readonly>
								</div>
								<div class="col-12">
									주소2
									<input type=text name=address2 id=address2 placeholder="주소2">
								</div>
								<div class="col-12">
									전화번호
									<input type=text id=phone name=phone placeholder='전화번호'>
								</div>
								<div class="col-12">
									홈페이지 주소
									<input type=text id=homepage name=homepage placeholder='홈페이지 주소'>
								</div>
								<div class=col-12>진료과목</div>
								<div class=col-12>
									<input type="checkbox" name=medicalAnimal value=새> 
									새 
									<input type="checkbox" name=medicalAnimal value=물고기> 
									물고기
									<input type="checkbox" name=medicalAnimal value=햄스터> 
									햄스터 
									<input type="checkbox" name=medicalAnimal value=토끼> 
									토끼 
									<input type="checkbox" name=medicalAnimal value=고슴도치> 
									고슴도치 
									<input type="checkbox" name=medicalAnimal value=파충류> 
									파충류 
									<input type="checkbox" name=medicalAnimal value=곤충류> 
									곤충류 
									<input type="checkbox" name=medicalAnimal value=기타> 
									기타
								</div>
								<div class=col-12>진료시간</div>
								<div class=col-12>
									<input type="checkbox" name=openTime value=주간진료> 
									주간진료 
									<input type="checkbox" name=openTime value=야간응급진료> 
									야간응급진료 
									<input type="checkbox" name=openTime value=24시간진료> 
									24시간진료
								</div>
								<div class=col-12>
									<label for="image">사진 : </label>
									<input type=file id=image name="image">
									<div id="image_preview" class="text-center">
                                        <img src="#" class="col-12 mb-2" id="imgCon"/>
                                        <br />
                                        <a id="imgRemove" href="#">이미지 지우기</a>
                                    </div>
								</div>
							</div>
						</form>
						<div class="row">
							<div class="write-box col-auto col-6 text-center p-1">
								<button id="insert" type="button" class="btn btn-sm btn-outline-secondary">등록</button>
							</div>
							<div class="write-box col-auto col-6 text-center p-1">
								<button id="cancel" type="button" class="btn btn-sm btn-outline-secondary">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--            -->
	<jsp:include page="../standard/footer.jsp" />
	<script>
      //우편번호 찾기
      function sample4_execDaumPostcode() {
         new daum.Postcode({
            oncomplete : function(data) {
               var roadAddr = data.roadAddress;
               document.getElementById('postcode').value = data.zonecode;
               document.getElementById("address1").value = roadAddr;
            }
         }).open();
      }
      $('#insert').on('click', function() {
         $('#frm').submit();
      });
      $('#cancel').on('click', function() {
    	  
      });
        
    $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview img').attr('src', blobURL);
            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }
    });

    $('#image_preview a').bind('click', function() {
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
        
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
    }
   </script>
</body>
</html>