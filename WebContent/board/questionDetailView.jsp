<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="resources/css/mainStyle.css">

<style>
#category {
   width: 100%;
   height: 100%;
}

.search-box>* {
   width: 100%;
}

.write-box>* {
   width: 100%;
}

#article, .line {
   border: 0.5px solid lightgray;
}
#comment{
border : 1px solid black; }
</style>
</head>
<body>
   <div class=container>
      <jsp:include page="../standard/headerMember.jsp" />
      <!--  -->
      <div class=row>
         <div class=col-12>
            <h3>커뮤니티 - 질문</h3>
            <h4>${dto.title}</h4>
         </div>
      </div>
      <div class=row>
         <div class=col-6>
            <h5>${dto.writer}</h5>
         </div>
         <div class="col-6">
            <h5 class="right">${dto.getDate()}&emsp;view.${dto.viewCount}</h5>
         </div>
         <hr>
      </div>
      <div class=row>
         <div class=col-12 id=boardContent>${dto.content}</div>
      </div>
      <c:choose>
         <c:when test="${loginInfo == dto.writer}">
            <div class=row>
               <div class=col-12 id=boardContent>
                  <button id=modify>수정</button>
                  <button id=remove>삭제</button>
               </div>
            </div>

   </div>



   <script>
                  //////// 게시물 관리 //////////

                  // 게시물 삭제 버튼
                  $("#remove")
                        .on(
                              "click",
                              function() {
                                 location.href = '${pageContext.request.contextPath}/boardRemove.bo?seq=${dto.seq}';
                              })
                  // 게시물 수정 버튼 
                  $("#modify")
                        .on(
                              "click",
                              function() {
                                 location.href = '${pageContext.request.contextPath}/boardModify.bo?seq=${dto.seq}';

                              })

                  
               </script>
   </c:when>
   </c:choose>
   
   
   
            <div class=row id=replyBox>
               <div class=co1-12>
                  <div class=row>
                     <div class=col-12>
                        <textarea id=replyText rows=5 cols=100
                           placeholder="커뮤니티가 훈훈해지는 댓글 부탁드립니다."></textarea>
                     </div>
                     <div class=row>
                        <div class=col-12>
                        <button type=button id=replyWrite>등록</button>
                        </div>
                     </div>
                  </div>
               </div>
         </div>
         
   <script>
   
   /////// 댓글 관리 /////////

   //댓글 입력   
      
            $("#replyWrite").on("click",function(){
               
               $.ajax({
                    url: "${pageContext.request.contextPath}/QReplyWrite.bo",
                    type: "post",
                    data:{
                        contents: $("#replyText").val(),
                        board_num: "${dto.seq}"
                    }

                }).done(function(rs){
               var resultArr = rs.split(";"); //결과 배열로 받기
                   
               if(resultArr[0] == 1){

                  var data = JSON.parse(resultArr[1]);
                  
                  var textDiv = $("<div class=\"reLiBtns col-10 p-0\"></div>");                  
                  var textarea = $("<textarea cols=\"70\" rows=\"2\" readonly>"+data.content+"</textarea>");               
                  textDiv.append(textarea);
                  console.log(textDiv[0]);
                  
                  var btnDiv = $("<div class=\"reLiBtns col-2 p-0\"></div>");
                  var btn1 = $("<button type=\"button\" class=\"replyModify\">수정</button>");
                  var btn2 = $("<button type=\"button\" class=\"replyDelete\">삭제</button>");
                  btnDiv.append(btn1);
                  btnDiv.append(btn2);
                  console.log(btnDiv[0]);
                  
                  var contentDiv = $("<div class=\"reLiBox col-12 p-0\"></div>");
                  contentDiv.append(textDiv);
                  contentDiv.append(btnDiv);
                  
                  var writerDiv = $("<div class=\"col-12\">"+data.writer+"</div>");
                  
                  var replyDiv = $("<div class=\"line col-12\"></div>");
                  replyDiv.append(writerDiv);
                  replyDiv.append(contentDiv);                  
                  console.log(replyDiv[0]);                  
                  
                  $("#replyBox").append(replyDiv[0]);
                  
                      $("#replyText").val("");
                      alert("댓글 작성 완료");
                       
                   }else{
                      alert("댓글 작성 실패");
                   }
                });
               
            })
   
   </script>      
         
   <!--  -->
   <jsp:include page="../standard/footer.jsp" />
   </div>
</body>
</html>