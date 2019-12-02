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
<link rel="stylesheet" href="../resources/css/mainStyle.css">

<style>
.tb_box_login {
text-align:center;
}
.tb_box_login p{
display:inline-block;
}
.total{
text-align:center;
}
.btn_area{
text-align:center;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../standard/header.jsp" />
		<!--  후원폼          -->
	<div class="row">
		<div class="con_top col-12 p-0">
			<h2 class="tit_sub">후원하기</h2>
			<p class="txt_sub">동물 소중 어쩌구 저쩌구 설명설명</p>
		</div>
	</div>
	<div class="row">
				<!--                여기는 세션정보에 따라 block하기-->
				<c:choose>
					<c:when test="${loginInfo ==null}">
						<div class="tb_box_login col-12 p-0">
							<div class="col-12 p-0">
							<p class="col-auto p-0">"로그인 후 후원을 하시면&nbsp;</p><p class="col-auto p-0">후원조회 및 증빙서류발급이 용이합니다."</p>
							</div>
							<div class="col-12 p-0">
							<a href="${pageContext.request.contextPath}/member/2login.jsp" class="btn02_blue col-12">로그인</a>
							</div>
						</div>
					</c:when>
				</c:choose>
	</div>
				<!--            여기서부터 입력폼-->
	<div class="row">
	<form action="${pageContext.request.contextPath}/donate.do" method="post" class="col-12 p-0">
				<div class="step1 col-12 p-0">
						<div class="sps_step_t col-12 p-0">
							<h3 class="tit_step">
								<span> "STEP" <strong>1</strong></span> "후원사업 선택"
							</h3>
						</div>
						<div class="sps_step_c col-12">			
							<div class="row line">		
								<div class="col-12 col-sm-3 p-0">후원금액</div>
								<div class="col-12 col-sm-9 p-0">
									<div class="checkAmount col-12">
										<div class="row">
											<div class="price col-12 col-md-3"> <input type="radio" name="support" value="1004">
											<label for="sponsor_money01">"1,004원"</label></div>
											
											<div class="price col-12 col-md-3"><input type="radio" name="support" value="2000">
											<label for="sponsor_money02">"2,000원"</label></div>
											
											<div class="price col-12 col-md-3"> <input type="radio" name="support" value="5000">
											<label for="sponsor_money03">"5,000원"</label></div>
											
											<div class="price d-none d-sm-block col-md-3 "></div>
											
											<div class="price col-12 col-md-3"> <input type="radio" name="support" value="10000">
											<label for="sponsor_money04">"10,000원"</label></div>
											
											<div class="price col-12 col-md-3"> <input type="radio" name="support" value="50000">
											<label for="sponsor_money05">"50,000원"</label></div>
											
											<div class="price col-12 col-md-5"> <input type="radio" name="support" value="etc">
											<label for="sponsor_money06">&nbsp;기타 </label>&nbsp;<input type="text" id="inputPay">&nbsp;<span>원</span></div>
										</div>
										</div>	
								</div>
							</div>
								<div class="row line">
										<div class="total col-12">"총 후원금액" <span id="inputDisplay"></span>원</div>
								</div>
						</div>	
					</div>
						<div class="step2 col-12 p-0">
							<div class="sps_step_t col-12 p-0">
								<h3 class="tit_step">
									<span> "STEP" <strong>2</strong>
									</span> "후원자 정보"
								</h3>
							</div>
							
							<div class="sps_step_c col-12">
								<div class="row">
									<p class="txt_required">
										<strong class="required" title="필수입력">*</strong> "표시 입력사항은 모두 필수입니다."
									</p>
								</div>
										<div class="row line">
											<div class="inputs col-12">
												<div class="row">
												<div id="name_field" class="col-12 col-md-2">후원자명<strong class="required" title="필수입력">*</strong></div>
												<div class="col-12 col-md-5"><input type="text" id="name" name="name" placeholder="이름을 입력하세요"></div>
												<div class="col-12 col-md-5" id="validName"></div>
												</div>
											</div>
											
											<div class="inputs col-12">
											<div class="row">
												<div id="birth_field" class="col-12 col-md-2">생년월일<strong class="required" title="필수입력">*</strong></div>
												<div class="col-12 col-md-5"><input type="text" id="birth" name="birth" placeholder="주민등록번호 앞 6자리"></div>
												<div class="col-12 col-md-5" id="validBirth"></div>
												</div>
											</div>
											
											<div class="inputs col-12">
											<div class="row">
												<div id="phone_field" class="col-12 col-md-2">휴대폰<strong class="required" title="필수입력">*</strong></div>
												<div class="col-12 col-md-5"><input type="text" id="phone" name="phone"></div>
												<div class="col-12 col-md-5" id="validPhone"></div>
											</div>
											</div>
											
											<div class="inputs col-12">
											<div class="row">
												<div id="email_field" class="col-12 col-md-2">이메일<strong class="required" title="필수입력">*</strong></div>
												<div class="col-12 col-md-5"><input type="text" id="email" name="email"></div>
												<div class="col-12 col-md-5" id="validEmail"></div>
											</div>
											</div>
											
											<div class="inputs col-12">
											<div class="row">
												<div id="addr_field" class="col-12 col-md-2">주소<strong class="required" title="필수입력">*</strong></div>
													<div class="wrap_address col-12 col-md-10">
													<div class="row">
														<div class="col-6 col-sm-4"><input type="text" id="postcode" name="postcode" onclick="exeDaumPostcode();" readonly></div>
														<div class="col-6 col-sm-4"><input type="button" value="검색" onclick="exeDaumPostcode();"></input></div>
													</div>
													<div class="row">
													<div class="col-12 col-md-6"><input type="text" id="addr1" name="addr1" onclick="exeDaumPostcode();" readonly></div>
													<div class="col-12 col-md-6"><input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력해주세요."></div>
													</div>
													</div>
											</div>
											</div>

											<div class="inputs col-12">
											<div class="row">
												<div id="name_field" class="col-12 col-md-2">약관동의<strong class="required" title="필수입력">*</strong></div>
												<div class="check_area col-12 col-md-10">
													<div class="row">
														<input type="checkbox" id="agree" name="agree"> <label for="agree">&nbsp;"개인정보 수집, 이용목적 및 취급방침"</label>
														&nbsp;<button type="button" class="btn_detail">+</button>
													</div>
													<div class="agree_cont row">
														<div class="agree_cont_style col-12">
																	<p class="">수집하는 개인정보의 항목 및 수집방법</p>
																	<p>개인정보 수집항목</p>
														</div>
													</div>
												</div>										
											</div>
										</div>
										</div>
							</div>
						</div>
						
						<div class="step3 col-12 p-0">
							<div class="sps_step_t col-12 p-0">
								<h3 class="tit_step">
									<span> "STEP" <strong>3</strong>
									</span> "납입방법 선택"
								</h3>
							</div>
							<div class="sps_step_c col-12">
								<div class="row">
									<h4 class="inblock col-12 col-md-3">"후원금 납입방법"</h4>
									<p class="inblock col-12 col-md-9">"설명설명"</p>
								</div>
								
									<div class="row line">
										<div class="col-4 col-md-2">납입방법</div>
										<div class="payMethodBox col-8 col-md-10">
											<input type="radio" name="payMethod" id="payMethod1" value="card">
											<label for="payMethod1">신용카드</label>
										</div>											
									</div>							
							</div>						
					</div>
					<div class="btn_area col-12 p-0">
							<button type="button" id="donaBtn">후원신청</button>
					</div>
					
					<input type="hidden" name="etcPrice" id="etcPrice">
				</form>
			</div>
		<!--            -->
		<jsp:include page="../standard/footer.jsp" />
	</div>
</body>
<script>

$('input:radio[name=support]').on("click", function(){
	var supportVal = $('input:radio[name=support]:checked').val();
	
	if(supportVal == 'etc'){
		$("#inputDisplay").html("");
		$("#inputPay").on("focusout", function(){
			var price = $("#inputPay").val();
			$("#inputDisplay").html(price);
			$("#etcPrice").val(price);
			console.log($("#etcPrice").val());
		})
	}else{
		$("#inputDisplay").html(supportVal);
		$("#etcPrice").val("");
	}
});

$(".agree_cont").css("display", "none");
$(".btn_detail").on("click", function(){
	var dis = $(".agree_cont").css("display");
	if(dis == "block"){
		$(".agree_cont").css("display", "none");
	}else{
		$(".agree_cont").css("display", "block");
	}	
});

function exeDaumPostcode(){
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("addr1").value = roadAddr;
        }
    }).open();
}

//빈칸 검사
$("#donaBtn").on("click", function(){
	var support = $('input:radio[name=support]').is(':checked');
	var agree = $('input:checkbox[name=agree]').is(':checked');
	var method = $('input:radio[name=payMethod]').is(':checked');
	
	if(!support){
		alert("후원금액을 선택해주세요");
		return false;
	}else if($("#name") == ""){
		alert("이름을 입력해주세요");
		return false;
	}else if($("#validName").html() != ""){
		alert("이름을 다시 확인해주세요");
		return false;
	}else if($("#birth").val() == ""){
		alert("생년월일을 입력해주세요");
		return false;
	}else if($("#validBirth").html() != ""){
		alert("생년월일 양식을 다시 확인해주세요");
		return false;
	}else if($("#phone").val() == ""){
		alert("전화번호를 입력해주세요");
		return false;
	}else if($("#validPhone").html() != ""){
		alert("전화번호를 다시 확인해주세요");
		return false;		
	}else if($("#email").val() == ""){
		alert("메일을 입력해주세요");
		return false;
	}else if($("#validEmail").html() != ""){
		alert("메일주소를 다시 확인해주세요");
		return false;
	}else if($("#postcode").val() == ""){
		alert("주소를 입력해주세요");
		return false;
	}else if(!agree){
		alert("약관을 동의해주세요");
		return false;
	}else if(!method){
		alert("납입방법을 선택해주세요");
		return false;
	}else if($("#inputDisplay").html() == ""){
		alert("후원금액을 입력해주세요")
		return false;
	}
		$("form").submit();
})

//유효성검사
$("#name").on("focusout", function(){
	var regex = /\S+/g;
	var data = $("#name").val()
	var result = regex.exec(data);
	
	if(data == ""){
		$("#validName").html("이름을 입력해주세요");
	}else if(result == null){
		$("#validName").html("이름엔 공백이 들어갈 수 없습니다");
	}else{
		$("#validName").html("");
	}
	
})

$("#birth").on("focusout",function(){
	var regex = /[0-9]{6}/g;
	var data = $("#birth").val();
	var result = regex.exec(data);
	
	if(result == null){
		$("#validBirth").html("생년월일을 다시 확인해주세요");
	}else{
		$("#validBirth").html("");
	}
})

$("#phone").on("focusout",function(){
	var regex = /^01\d\d{3,4}\d{4}$/;
    var text = $("#phone").val();
    var result = regex.exec(text);

    if(result == null){
		$("#validPhone").html("전화번호를 다시 확인해주세요");
    }else{
    	$("#validPhone").html("");
    }
})

$("#email").on("focusout",function(){
    var regex = /^\w+@[a-z]+(.[a-z]+){1,2}$/;
    var text = $("#email").val();
    var result = regex.exec(text);

    if(result == null){
        $("#validEmail").html("이메일을 다시 확인해주세요");
    }else{
    	$("#validEmail").html("");
    }
})




</script>
</html>