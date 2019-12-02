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

<style>
* {
	box-sizing: border-box
}

div {
	border: 1px solid black
}

#logo {
	width: 500px;
	height: 100px;
	margin: auto;
	background-color: ghostwhite;
}

#article-img {
	width: 100%;
	height: 100px;
	margin: auto;
	background-color: ghostwhite;
}

#footer>div {
	height: 100%;
}

#footer-logo>div {
	height: 100%;
	background-color: ghostwhite;
}

#footer-contents {
	font-size: 8pt;
}

.nav-item {
	display: inline-block;
	width: 100%;
	text-align: center;
}

.navbar-nav {
	width: 100%;
}

.center {
	text-align: center;
}
</style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!-- 차트cdn -->

	<div class="container">
		<jsp:include page="../standard/headerAdmin.jsp" />
		<!--            -->
		   <div class="row">
        <div class="col-12 mb-3" id="article">
            <div class="row">
            <div id="article-middle" class="col-12 mt-2">
                <div class="row mb-3 p-1 text-center">
                    <h3 id="board-top" class="col-auto col-sm-4 m-0">회원 통계</h3>
                    <span class="col-auto col-sm-8 mt-2">
                           <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
                    </span>
            </div>
            <!-- 회원 통계 -->
            	 <canvas id="memberChart"></canvas>
            	<script>
            	   var ctx = document.getElementById('memberChart');
            	   var myChart = new Chart(ctx, {
            	       type: 'bar',
            	       data: {
            	           labels: ['가입자 수', '성별(남)', '성별(여)'],
            	           datasets: [{
            	               label: '회원 통계',
            	               data: [${totalCount}, ${memberMCount}, ${memberWCount}],
            	               backgroundColor: [
            	                   'rgba(255, 99, 132, 0.2)',
            	                   'rgba(54, 162, 235, 0.2)',
            	                   'rgba(255, 206, 86, 0.2)',
            	                   'rgba(75, 192, 192, 0.2)',
            	                   'rgba(153, 102, 255, 0.2)',
            	                   'rgba(255, 159, 64, 0.2)'
            	               ],
            	               borderColor: [
            	                   'rgba(255, 99, 132, 1)',
            	                   'rgba(54, 162, 235, 1)',
            	                   'rgba(255, 206, 86, 1)',
            	                   'rgba(75, 192, 192, 1)',
            	                   'rgba(153, 102, 255, 1)',
            	                   'rgba(255, 159, 64, 1)'
            	               ],
            	               borderWidth: 1
            	           }]
            	       },
            	       options: {
            	           scales: {
            	               yAxes: [{
            	                   ticks: {
            	                       beginAtZero: true
            	                   }
            	               }]
            	           }
            	       }
            	   });
            	   </script>
            <!--        -->
            <!-- 관심동물 -->
            <canvas id="lovePetChart"></canvas>
            	<script>
            	   var ctx = document.getElementById('lovePetChart');
            	   var myChart = new Chart(ctx, {
            	       type: 'bar',
            	       data: {
            	           labels: ['새', '물고기', '햄스터', '토끼', '고슴도치', '파충류', '곤충류', '기타'],
            	           datasets: [{
            	               label: '관심동물',
            	               data: [${bird}, ${fish}, ${hamster}, ${rabbit}, ${dochi}, ${reptile}, ${bug}, ${other}],
            	               backgroundColor: [
            	                   'rgba(255, 99, 132, 0.2)',
            	                   'rgba(54, 162, 235, 0.2)',
            	                   'rgba(255, 206, 86, 0.2)',
            	                   'rgba(75, 192, 192, 0.2)',
            	                   'rgba(153, 102, 255, 0.2)',
            	                   'rgba(255, 159, 64, 0.2)'
            	               ],
            	               borderColor: [
            	                   'rgba(255, 99, 132, 1)',
            	                   'rgba(54, 162, 235, 1)',
            	                   'rgba(255, 206, 86, 1)',
            	                   'rgba(75, 192, 192, 1)',
            	                   'rgba(153, 102, 255, 1)',
            	                   'rgba(255, 159, 64, 1)'
            	               ],
            	               borderWidth: 1
            	           }]
            	       },
            	       options: {
            	           scales: {
            	               yAxes: [{
            	                   ticks: {
            	                       beginAtZero: true
            	                   }
            	               }]
            	           }
            	       }
            	   });
            	</script>
            <!--        -->
            <!-- 가입경로 -->
            <canvas id="signpathChart"></canvas>
            	<script>
            	   var ctx = document.getElementById('signpathChart');
            	   var myChart = new Chart(ctx, {
            	       type: 'bar',
            	       data: {
            	           labels: ['', '물고기', '햄스터', '토끼'],
            	           datasets: [{
            	               label: '가입 경로',
            	               data: [12, 19, 3, 5, 2, 3, 5, 10],
            	               backgroundColor: [
            	                   'rgba(255, 99, 132, 0.2)',
            	                   'rgba(54, 162, 235, 0.2)',
            	                   'rgba(255, 206, 86, 0.2)',
            	                   'rgba(75, 192, 192, 0.2)',
            	                   'rgba(153, 102, 255, 0.2)',
            	                   'rgba(255, 159, 64, 0.2)'
            	               ],
            	               borderColor: [
            	                   'rgba(255, 99, 132, 1)',
            	                   'rgba(54, 162, 235, 1)',
            	                   'rgba(255, 206, 86, 1)',
            	                   'rgba(75, 192, 192, 1)',
            	                   'rgba(153, 102, 255, 1)',
            	                   'rgba(255, 159, 64, 1)'
            	               ],
            	               borderWidth: 1
            	           }]
            	       },
            	       options: {
            	           scales: {
            	               yAxes: [{
            	                   ticks: {
            	                       beginAtZero: true
            	                   }
            	               }]
            	           }
            	       }
            	   });
            	</script>
            <!--        -->
            <!-- 가장 인기있는 게시물 -->
            <canvas id="hotChart"></canvas>
            	<script>
            	   var ctx = document.getElementById('hotChart');
            	   var myChart = new Chart(ctx, {
            	       type: 'bar',
            	       data: {
            	           labels: ['새', '물고기', '햄스터', '토끼', '고슴도치', '파충류', '곤충류', '기타'],
            	           datasets: [{
            	               label: '인기있는 게시물',
            	               data: [12, 19, 3, 5, 2, 3, 5, 10],
            	               backgroundColor: [
            	                   'rgba(255, 99, 132, 0.2)',
            	                   'rgba(54, 162, 235, 0.2)',
            	                   'rgba(255, 206, 86, 0.2)',
            	                   'rgba(75, 192, 192, 0.2)',
            	                   'rgba(153, 102, 255, 0.2)',
            	                   'rgba(255, 159, 64, 0.2)'
            	               ],
            	               borderColor: [
            	                   'rgba(255, 99, 132, 1)',
            	                   'rgba(54, 162, 235, 1)',
            	                   'rgba(255, 206, 86, 1)',
            	                   'rgba(75, 192, 192, 1)',
            	                   'rgba(153, 102, 255, 1)',
            	                   'rgba(255, 159, 64, 1)'
            	               ],
            	               borderWidth: 1
            	           }]
            	       },
            	       options: {
            	           scales: {
            	               yAxes: [{
            	                   ticks: {
            	                       beginAtZero: true
            	                   }
            	               }]
            	           }
            	       }
            	   });
            	</script>
            <!--        -->
           
                        </div>
                    </div>
                </div>
            </div>
            </form>
		<!--            -->
		<jsp:include page="../standard/footer.jsp" />
	<script>
		//각 버튼별 주소이동
		$("#logo").on("click", function() {
			location.href = "${pageContext.request.contextPath}/mainAdmin.jsp";
		});
		//공지사항으로 이동
		$("#notice").attr("href", "${pageContext.request.contextPath}/boardNotice.admin");
		//전문가 Q&A로 이동
		$("#expert").attr("href", "${pageContext.request.contextPath}/boardExpert.admin");
		//자유게시판으로 이동
		$("#free").attr("href", "${pageContext.request.contextPath}/boardFree.admin");
		//질문게시판으로 이동
		$("#question").attr("href", "${pageContext.request.contextPath}/boardQuestion.admin");
		//회원목록조회로 이동
		$("#memberList").attr("href", "${pageContext.request.contextPath}/adminMemberList.admin");
		//차단한ip목록조회로 이동
		$("#banList").attr("href", "${pageContext.request.contextPath}/adminBanList.admin");
		//회원통계로 이동
		$("#memberCharts").attr("href", "${pageContext.request.contextPath}/adminMemberChart.admin");
	</script>
</body>
</html>