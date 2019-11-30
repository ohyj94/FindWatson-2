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
</head>
<body>
	<div class="container">
		<jsp:include page="../standard/header.jsp" />
		<!--  후원폼          -->
		<div class="wrap">
			<h2 class="tit_sub">후원하기</h2>
			<p class="txt_sub">동물 소중 어쩌구 저쩌구 설명설명</p>
		</div>
		<div class="con_body">
			<div class="wrap">
				<!--                여기는 세션정보에 따라 block하기-->
				<c:choose>
					<c:when test="${loginInfo ==null}">
						<div class="tb_box_login">
							<p>"로그인 후 후원을 하시면 후원조회 및 증빙서류발급이 용이합니다."</p>
							<a href="${pageContext.request.contextPath}/member/2login.jsp"
								class="btn02_blue">로그인</a>
						</div>
					</c:when>
				</c:choose>
				<!--            여기서부터 입력폼-->
				<form action="${pageContext.request.contextPath}/donate.do"
					method="post">
					<div class="sponsor_step">
						<div class="sps_step_t">
							<h3 class="tit_step">
								<span> "STEP" <strong>1</strong>
								</span> "후원사업 선택"
							</h3>
						</div>
						<div class="sps_step_c">
							<table class="tb01">
								<tbody>
									<th scope="row">후원금액</th>
									<td>
										<div class="checkAmount">
											<span class="price"> <input type="radio" name="support" value="1004">
											<label for="sponsor_money01">"1,004원"</label></span>
											<span class="price"><input type="radio" name="support" value="2000">
											<label for="sponsor_money02">"2,000원"</label></span>
											<span class="price"> <input type="radio" name="support" value="5000">
											<label for="sponsor_money03">"5,000원"</label></span>
											<span class="price"> <input type="radio" name="support" value="10000">
											<label for="sponsor_money04">"10,000원"</label></span>
											<span class="price"> <input type="radio" name="support" value="50000">
											<label for="sponsor_money05">"50,000원"</label></span>
											<label for="sponsor_money06"> <input type="radio" name="support" value="etc">
											<span class="price">기타</span></label> 
											<label for=""> <input type="text" id="inputPay"></label> <span>원</span>
										</div>
									</td>
								</tbody>
								<tfoot>
									<tr>
										<td class="total">"총 후원금액" <span id="inputDisplay">스크립트
												수정하기</span> 원
										</td>
									</tr>
								</tfoot>
							</table>

						</div>

						<div class="sps_step">
							<div class="sps_step_t">
								<h3 class="tit_step">
									<span> "STEP" <strong>2</strong>
									</span> "후원자 정보"
								</h3>
							</div>
							<div class="sps_step_c">
								<div class="sec_sps">
									<p class="txt_required">
										<strong class="required" title="필수입력">*</strong> "표시 입력사항은 모두필수입니다."
									</p>
									<table class="tb01">
										<tbody>
											<tr>
												<th scope="row"><label for=""> <span id="name_field">후원자명</span>
												<strong class="required" title="필수입력">*</strong>
												</label></th>
												<td><input type="text" id="name" name="name" placeholder="이름을 입력하세요"></td>
											</tr>
											<tr>
												<th scope="row"><label for=""> <span id="birth_field">생년월일</span>
												<strong class="required" title="필수입력">*</strong>
												</label></th>
												<td><input type="text" id="birth" name="birth" placeholder="주민등록번호 앞 6자리"></td>
											</tr>
											<tr>
												<th scope="row"><label for=""> <span id="phone_field">휴대폰</span>
												<strong class="required" title="필수입력">*</strong>
												</label></th>
												<td><input type="text" id="phone" name="phone"></td>
											</tr>
											<tr>
												<th scope="row"><label for=""> <span id="email_field">이메일</span>
												<strong class="required" title="필수입력">*</strong>
												</label></th>
												<td><input type="text" id="email" name="email"></td>
											</tr>
											<tr>
												<th scope="row"><label for=""> <span id="addr_field">주소</span>
												<strong class="required" title="필수입력">*</strong>
												</label></th>
												<td>
													<div class="wrap_address">
														<label for="addr_post">
															<input type="text" id="postcode" name="postcode" onclick="exeDaumPostcode();" readonly>
														</label>
														<a href="#" class="btn06" onclick="exeDaumPostcode();">검색</a>
														<label for="addr_middle">
															<input type="test" id="addr1" name="addr1" onclick="exeDaumPostcode();" readonly>
														</label>
														<label for="addr_last">
															<input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력해주세요.">
														</label>
													</div>
												
												</td>
											</tr>

											<tr>
												<th scope="row"><label for=""> <span id="name_field">약관동의</span>
												<strong class="required" title="필수입력">*</strong>
												</label></th>
												<td>
													<dl class="agree_check">
														<div class="check_area">
															<input type="checkbox" id="agree" name="agree"> <label
																for="agree">"개인정보 수집, 이용목적 및 취급방침"</label>
															<button type="button" class="btn_detail">+</button>
															<div class="agree_cont">
																<div class="agree_cont_style">
																	<p class="">수집하는 개인정보의 항목 및 수집방법</p>
																	<p>개인정보 수집항목</p>
																</div>
															</div>
														</div>
													</dl>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
							<div class="sps_step_t">
								<h3 class="tit_step">
									<span> "STEP" <strong>3</strong>
									</span> "납입방법 선택"
								</h3>
							</div>
							<div class="sps_step_c">
								<div class="sec_sps">
									<h4 class="inblock">"후원금 납입방법"</h4>
									<p class="inblock">"설명설명"</p>
									<table class="tb01">
										<tbody>
											<tr>
												<th scope="row">납입방법</th>
												<td>
												<div class="payMethodBox">
												<span> <input type="radio" name="payMethod" id="payMethod1" value="card">
												<label for="payMethod1">신용카드</label></span>
												</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="btn_area">
									<button type="button" id="donaBtn">후원신청</button>
								</div>
							</div>
					</div>
				</form>
			</div>
		</div>
		<!--            -->
		<jsp:include page="../standard/footer.jsp" />
	</div>
</body>
<script>
$("#donaBtn").on("click", function(){
	$("form").submit();
})

function exeDaumPostcode(){
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("addr1").value = roadAddr;
        }
    }).open();
}
</script>
</html>