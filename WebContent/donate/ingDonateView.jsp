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
                $(function(){
                	
                	var IMP = window.IMP; 
                    IMP.init('imp75189241');
                 
                    	 IMP.request_pay({
                             pg : 'html5_inicis',
                             pay_method : 'card',
                             merchant_uid : "${dId}",
                             name : "${userId}",
                             amount : "${support}",
                             buyer_email : 'iamport@siot.do',
                             buyer_name : "${userId}",
                             buyer_tel : "${phone}",
                             buyer_addr : '서울특별시 강남구 삼성동',
                             buyer_postcode : '123-456'
                         }, function(rsp) {
                         	console.log("rsp.merchant_uid : " + rsp.merchant_uid);
                         	
                         	if ( rsp.success ) { //여기서 결제 성공
                        		 
                         		$.ajax({//여기서부터는 결제 성공후 결제 정보 확인
                    			    url: "${pageContext.request.contextPath}/payComplete.do",
                    			    method: "post", // POST method
                    			    dataType: 'json',
                    			    data: {
                    		            merchant_uid: rsp.merchant_uid,
                    		            paid_amount : rsp.paid_amount,
                    		            success : rsp.success
                    			      }
                    			  }).done(function(data){
                    				  console.log("data to Json : " + data.result);
                    				  
                    				  if(data.result){
                    					  console.log("정상적인 결제입니다");
                    					  alert("결제 성공");
                                          location.href = "donate/donatePassView.jsp";  
                    				  }else{
                    					  var msg = data.msg;
                    					  alert(msg);
                    					  location.href = "donate/donateFailView.jsp";
                    				  }
                    			  });
	
                             } else {//결제 실패
                                 console.log(rsp);
                                 var msg = '결제에 실패하였습니다.';
                                 msg += '에러내용 : ' + rsp.error_msg;

                                 alert(msg);
                                 location.href = "donate/donateFailView.jsp";
                             }
                        	 
                         });
	
                });
            </script>
</head>
<body>
결제중입니다
</body>
</html>