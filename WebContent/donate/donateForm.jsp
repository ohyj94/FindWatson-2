<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>찾아줘 왓슨!</title>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
             
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
<link rel="stylesheet" href="../resources/css/donateStyle.css">
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
            <style>
                *{box-sizing: border-box}
                div{border: 1px solid black}
                #logo{
                    width: 500px;
                    height: 100px;
                    margin: auto;
                    background-color: ghostwhite;
                }
                #article-img{
                    width:100%;
                    height: 100px;
                    margin: auto;
                    background-color: ghostwhite;
                }
                #footer{
                    height: 100px;
                }
                img{
                    width:500px;
                }

                /*            여기부터 내가 추가한 css*/

                .donate{

                }
                .donate img{
                    width: 100%;
                    z-index: -1;
                }
                #donateInfo{
                    position: absolute;
                    top: 800px;
                    left: 50%;
                    transform: translateX(-50%);
                }
                .dLabel{
                    width: 50px;
                    text-align: center;
                }
                .dInput{
                    width: 200px;
                }
                #donateBtn{
                    text-align: center;
                }

            </style>
           
        </head>
        <body>
            <div class="container">
                <div class="row">
                    <div id="loginBtn" class="col-12 text-right">
                        <button class="btn btn-sm btn-outline-secondary">로그인</button>
                    </div>
                </div>
                <div class="row">
                    <div id="title" class="col-12 mb-3">
                        <div id="logo">로고이미지</div>
                    </div>
                </div>
                <div class="row">
                    <div id="navi" class="col-12 mb-3">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <a class="navbar-brand" href="#">Home</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNav">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">공지사항</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">병원검색</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">전문가Q&A</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">커뮤니티</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">마이페이지</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <!--            -->


                <div class="donate">
                    <img src="../imgs/donate/donate.jpg" alt="">   
                </div>
				<form action="${pageContext.request.contextPath }/donate.do" method="post">
				
                <div id="donateInfo">
                    <div id="donateId"><label class="dLabel">이름</label><input type="text" class="dInput" id="dName" name="dName"></div>
                    <div id="donatePhone"><label class="dLabel">핸드폰번호</label><input type="text" class="dInput" id="dPhone" name="dPhone"></div>
                    <div id="donatePrice">
                        <label class="dLabel">금액</label>
                        <select name="support" id="support" class="dInput">
                            <option value="1000">1000원</option>
                            <option value="2000">2000원</option>
                            <option value="5000">5000원</option>
                            <option value="10000">10000원</option>
                            <option value="50000">50000원</option>
                        </select>
                    </div>
                    <div id="donateBtn"><button type="button" id="payBtn">결제하기</button></div>
                </div>
                
                </form>

                <!--            -->
                <div class="row">
                    <div id="footer" class="col-12">
                        푸터
                    </div>
                </div>
            </div>
            
            <script>
            $("#payBtn").on("click", function(){
            	$("form").submit();
            })
            </script>
        </body>
    </html>