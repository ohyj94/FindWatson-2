<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
            <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
            <script>
                $(function() {

                    var IMP = window.IMP;
                    IMP.init('imp75189241');
                    
                    IMP.request_pay(
                        {
                            pg : 'html5_inicis',
                            pay_method : "${dto.payMethod}",
                            merchant_uid : "${dto.donateId}",
                            name : "${dto.support} 원 후원하기",
                            amount : "${dto.support}",
                            buyer_email : "${dto.email}",
                            buyer_name : "${dto.name}",
                            buyer_tel : "${dto.phone}",
                            buyer_addr : "${dto.addr1}",
                            buyer_postcode : "${dto.postcode}"
                        }, function(rsp) {
                            if (rsp.success) { //여기서 결제 성공

                                $.ajax(
                                    {//여기서부터는 결제 성공후 결제 정보 확인
                                        url : "${pageContext.request.contextPath}/payComplete.do",
                                        method : "post", // POST method
                                        dataType : 'json',
                                        data : {
                                            merchant_uid : rsp.merchant_uid,
                                            paid_amount : rsp.paid_amount,
                                            success : rsp.success,
                                            name : rsp.buyer_name
                                        }
                                    })
                                    .done(function(data) {
                                        alert("결제 성공");
                                        location.href = "${pageContext.request.contextPath}/toSuccessView.do?name="+data.name+"&id="+data.id;
                                    });

                            } else {//결제 실패
                                $.ajax({
                                        url : "${pageContext.request.contextPath}/payComplete.do",
                                        method : "post", // POST method
                                        dataType : 'json',
                                        data : {
                                            merchant_uid : rsp.merchant_uid,
                                            paid_amount : rsp.paid_amount,
                                            success : rsp.success
                                        }
                                    }).done(function(data) {
                                        var msg = '결제에 실패하였습니다.';
                                        msg += ' '+ rsp.error_msg;
                                        alert(msg);
                                        location.href = "donate/donateFailView.jsp";
                                    });
                            }
                        });
                });
            </script>
            <style>
                #lodingBird{
                    position: absolute;
                    left: 50%;
                    top: 50%;
                    transform: translate(-50%, -50%);
                }
            </style>
        </head>
        <body>
			<img src="imgs/donate/loadingBird.gif" alt="엑박" id="lodingBird">
            <div class="errorNotice">
                <p>혹시 화면이 멈췄다면 돌아가서 결제를 다시 시도해주세요</p>
                <p>문제 반복시 관리자에게 연락 바랍니다</p>
                <a href="javascript:history.go(-4)">BACK</a>
            </div>
        </body>
    </html>