<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/erp/common/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

</style>
<title>Insert title here</title>
<script type="text/javascript">
	/* dom이 준비가 되면.. */
	$(document).ready(function() {
		/* >: 하위 */
		// each: 모든 하위객체에 동일한 반복작업
		// id속성이 boardCategory로 정의된 엘리먼트의 모든 하위엘리먼트인 li에
		// 동일한 작업을 처리하겠다는 의미
		$("#boardCategory>li").each(function() {
			// 시점이 페이지 로딩 후 직후가 아니라면 event만 붙여주면 된다! 
			$(this).on("click",function(){
				category = $(this).text();
				//alert("선택됨 " +category);
				// ajax -json형식으로 값을 줌
				/* 
					ajax메소드를 이용해서 ajax요청
					url: ajax통신하기 위해 요청하는 path(컨트롤러 단에서 정의한 path)
					type: 요청방식(get or post)
					data: 요청할 때 컨트롤러로 넘길 데이터
					success: 요청이 성공하고 처리한 데이터를 넘겨 받은 후 
							어떤 방법으로 처리할 것인지 구현(함수명이나 익명함수로)
				*/
				$("#boardCategory>li").removeAttr("class");
				$(this).attr("class", "active");
				// ajax 메소드 속성값(매개변수)- 자바스크립트처럼 표현
				$.ajax({
					/* erp는 context path */
					url: "/erp/board/ajax_boardlist.do",
					type: "get",
					data:{
						"category":category},
					// @어디에 무엇을 찍을 것인지
					success: function(data) {
						// DTO 1개(VO변수)
						//alert(data[0].title)
						mydata="";	// (tr태그에)데이터 누적할 변수
						//ajax통신으로 받은 data(json객체)에서 값을 출력
						for(i=0; i<data.length; ++i){
							// 동적으로 만들어지는 컨텐츠
							mydata = mydata +
							"<tr><td class='boardContent' style=''>"+data[i].title
							+"</td>"
							+"<td class='boardDate' style=''>"+data[i].write_date
							+"</td></tr>" //한 줄
						}
						// 테이블에 만들어 놓은 <tr>태그를 추가한다.
						$("#mydatalist").empty();
						$("#mydatalist").append(mydata);
					}
						
				});
			});
		});		
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-7">
				<!-- 부트스트랩 -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					style="width: 600px; height: 300px">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/erp/images/multi1.jpg" alt="Image"
								style="width: 600px; height: 300px">

						</div>

						<div class="item">
							<img src="/erp/images/multi2.jpg" alt="Image"
								style="width: 800px; height: 300px">

						</div>
						<div class="item">
							<img src="/erp/images/multi3.jpg" alt="Image"
								style="width: 600px; height: 300px">

						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px; width: 450px">
					<div class="panel-footer">커뮤니티</div>
					<div class="panel-body">
						<ul class="nav nav-tabs" id="boardCategory">
							<li class="active"><a href="#">게시판</a></li>
							<li><a href="#">사내소식</a></li>
							<li><a href="#">경조사</a></li>
						</ul>
						<div id="boardMain" style="padding-top: 20px; padding-left: 10px">
							<table id="mydatalist">
								<tr>
									<td class="boardContent" style="">mini프로젝트 개최</td>
									<td class="boardDate" style="">2020.02.10</td>
								</tr>
								<tr>
									<td class="boardContent" style="">kimsaemERP ver2.0출시</td>
									<td class="boardDate" style="">2020.01.29</td>
								</tr>
								<tr class="boardRow">
									<td class="boardContent">사옥 이전날짜 확정</td>
									<td class="boardDate">2020.04.11</td>
								</tr>
								<tr class="boardRow">
									<td class="boardContent">보안의 날 참석 인원 확정</td>
									<td class="boardDate">2020.08.11</td>
								</tr>
								<!-- <tr class="boardRow">
									<td class="boardContent" >2차 프로젝트 발표 날짜 확정 통보</td>
									<td class="boardDate">2018.07.10</td>
								</tr> -->
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="row main-row">
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">News</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>