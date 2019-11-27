<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
        <title>찾아줘 왓슨!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
            #red{
                color: red;
            }
            #blue{
                color: blue;
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
                    <div id="logo" href="#">로고이미지</div>
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
            <form action="signUp." method="post" id=signUp>
                <div class =row>
                    <div class= col-12>
                        <h1>회원가입</h1>
                        <hr>
                    </div>
                </div>
                <div class =row>
                    <div class= col-12>
                        <h5>아이디</h5>
                        <input type=text id = id>
                        <div id=idCheck></div>
                    </div>
                </div>

                <div class =row>
                    <div class= "col-12 col-md-6">
                        <h5>비밀번호</h5>
                        <input type=text id = pw>
                    </div>
                    <div class= "col-12 col-md-6">
                        <h5>비밀번호 확인</h5>
                        <input type=text id = pwRe>
                    </div>
                    <div class=col-12 id=pwCheck></div>
                </div>

                <div class =row>
                    <div class= col-12>
                        <h5>이름</h5>
                        <input type=text id = name>
                    </div>
                    <div class=col-12>
                        <div id=nameCheck></div>
                    </div>
                </div>

                <div class =row>
                    <div class= "col-12 col-md-6">
                        <h5>생년월일</h5>
                        <input type=text id = year placeholder="년도">
                    </div>
                    <div class= "col-12 col-md-6">
                        <h5><br></h5>
                        <input type=text id = month placeholder="월">
                        <input type=text id = day placeholder="일">
                    </div>
                </div>

                <div class =row>
                    <div class= col-12>
                        <h5>성별</h5>
                        남<input type=radio name=gender>&emsp;
                        &emsp;&emsp;&emsp;&emsp;&emsp;
                        여<input type=radio name=gender>
                    </div>
                </div>

                <div class =row>
                    <div class= col-12>
                        <h5>본인 확인 이메일</h5>
                        <input type=text id = email>
                    </div>
                    <div class=col-12>
                        <div id=emailCheck></div>
                    </div>
                </div>

                <div class =row>
                    <div class= col-12>
                        <h5>휴대폰 번호</h5>
                        <input type=text id = phone>
                    </div>
                    <div class=col-12>
                        <div id=phoneCheck></div>
                    </div>
                </div>

                <div class=row>
                    <div class= col-12>
                        <h5>주소</h5>
                    </div>
                </div>
                <div class=row>
                    <div class=col-4><input type="text" id="postcode" name=postcode placeholder="우편번호" readonly>
                        <button id = addressBtn type="button" onclick="sample4_execDaumPostcode()">찾기</button>
                    </div>
                    <div class=col-4>
                        <input type="text" id="address1" name=address1 placeholder="도로명주소" readonly>
                    </div>
                    <div class=col-4>
                        <input type = text name = address2 id = address2 placeholder="상세주소">
                    </div>
                </div>

                <div class= row>
                    <div class=col-12>
                        <h5>관심 동물</h5>
                    </div>
                </div>
                <div class=row>
                    <div class=col-3>새<input type=checkbox name=animal value=bird></div>
                    <div class=col-3>물고기<input type=checkbox name=animal value=fish></div>
                    <div class=col-3>햄스터<input type=checkbox name=animal value=mouse></div>
                    <div class=col-3>토끼<input type=checkbox name=animal value=rabbit></div>
                </div>
                <div class=row>
                    <div class=col-3>고슴도치<input type=checkbox name=animal value=hedgehog></div>
                    <div class=col-3>파충류<input type=checkbox name=animal value=reptile></div>
                    <div class=col-3>곤충류<input type=checkbox name=animal value=bug></div>
                    <div class=col-3>기타<input type=checkbox name=animal value=other><input type=text name=otherAnimal></div>
                </div>

                <div class=row>
                    <div class=col-12>
                        <h5>가입 경로</h5>
                    </div>
                </div>
                <div class= row>
                    <div class=col-12>
                        <input type="radio" name=signPath value="path1">'찾아조 왓슨!' 직접검색
                    </div>
                    <div class=col-12>
                        <input type="radio" name=signPath value="path1">'특수 동물 병원' 키워드 검색
                    </div>
                    <div class=col-12>
                        <input type="radio" name=signPath value="path1">지인 소개
                    </div>
                    <div class=col-12>
                        <input type="radio" name=signPath value="path1">기타<input type=text name=otherSignPath>
                    </div>
                </div>
                <div class=row>
                    <div class="col-12 con"><button type=button id= save>가입</button></div>
                </div>
            </form>
            <script>
                $("#save").on("click",function(){
                    var result = confirm("가입하시겠습니까?");
                    if(result){
                        $("#signUp").submit();
                    }
                })
            </script>

            <!--            -->
            <div class="row">
                <div id="footer" class="col-12">
                    푸터
                </div>
            </div>
        </div>

        <script>
            //우편번호
            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        var roadAddr = data.roadAddress; 
                        document.getElementById('postcode').value = data.zonecode;
                        document.getElementById("address1").value = roadAddr;
                    }
                }).open();
            }

            //아이디 확인
            $("#id").on("keyup",function(){
                var regex = /^[a-z][a-z0-9]{6,13}$/gm;
                var id = $("#id").val();
                var result = regex.exec(id);

                if(result != null){//조건만족하면 바로 DB확인
                    $("#idCheck").html("");

                    //            $.ajax({
                    //    		url : "duplCheck.welcomepage",
                    //    		type : "post",
                    //    		data : {
                    //    			id : $("#id").val()
                    //    		},
                    //    		dataType : "json"
                    //    	}).done(function(data){
                    //    		console.log(data.result);
                    //    		if(data.result == true){
                    //    			$("#idCheck").html("존재하는 아이디");
                    //    		}else{
                    //    			$("#idCheck").html("사용가능한 아이디");
                    //    		}
                    //    	}).fail(function(){
                    //    		console.log("통신 실패");
                    //    	});

                }else{
                    $("#idCheck").html("아이디는 소문자로 시작해야하며 숫자,소문자를 이용해  7-14자로 입력하십시오.");
                }
            });
            //비밀번호 확인
             $("#pw").on("keyup",function(){
                var pw = $("#pw").val();
                var pwRe = $("#pwRe").val();

                if(pw == pwRe){
                    $("#pwCheck").html("<div id=blue>비밀번호 일치</div>");
                }else{
                    $("#pwCheck").html("<div id=red>비밀번호 불일치</div>");
                }
            })
            $("#pwRe").on("keyup",function(){
                var pw = $("#pw").val();
                var pwRe = $("#pwRe").val();

                if(pw == pwRe){
                    $("#pwCheck").html("<div id=blue>비밀번호 일치</div>");
                }else{
                    $("#pwCheck").html("<div id=red>비밀번호 불일치</div>");
                }
            })

            //이름 확인
            $("#name").on("keyup",function(){
                var regex = /^[가-힣]{2,8}$/gm;
                var name = $("#name").val();
                var result = regex.exec(name);
                if(result == null){
                    $("#nameCheck").html("잘못된 이름 형식입니다.");
                }else{
                    $("#nameCheck").html("");
                }
            })

            //이메일 확인
            $("#email").on("keyup",function(){
                var regex = /^[0-9a-zA-Z]+@[a-z]+(\.[a-z]+){1,2}$/gm;
                var email = $("#email").val();
                var result = regex.exec(email);

                if(result == null){
                    $("#emailCheck").html("잘못된 이메일 형식입니다.");
                }else{
                    $("#emailCheck").html("");
                }
            })

            //연락처 양식 확인
            $("#phone").on("keyup",function(){
              var regex = /^01[0-9]{8,9}$/gm;
                var phone = $("#phone").val();
                var result = regex.exec(phone);
                    if(result == null){
                        $("#phoneCheck").html("잘못된 번호 형식입니다.");
                    }else{
                        $("#phoneCheck").html("");
                    }
                
            })

        </script>
</body>
</html>