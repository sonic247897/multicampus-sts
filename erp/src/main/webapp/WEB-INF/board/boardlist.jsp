<%@page import="multi.erp.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// 자바스크립트에서 자바에서 발생한 데이터를 사용 - EL(표현식 언어!)
	// ${category} => request.getAttribute("category"); 직접 써도 됨
	category="${category}"; // 컨트롤러 요청하고 response될 때 값을 받아서 셋팅
	<%-- category="<%= request.getAttribute("category")%>"; --%>
	$(document).ready(function() {
		// 최초실행인 경우 category값이 없으니 처리
		if(category == ""){
			category = "all";
		}
		
		// 2. 들어갔다 나올때 실행되는 코드(boardlist가 응답도 함)
		// "selected", "selected"-선택한 것으로 바꾸기
		$("#category").val(category).attr("selected", "selected");
		
		// 1. 들어올 때 코드(boardlist가 요청)
		// 카테고리가 변할 때 = change [약식 - 동적 생성 컨텐츠 x]
		$("#category").change(function() {
			// jQuery객체 사용은 $로 받는다.
			location.href="/erp/board/list.do?category="+encodeURI($(this).val());	
			/* IE에서는 한글 카테고리를 주소에 넣었을 때 자동으로 인코딩 해주지 않기 때문에 404에러 뜸  */
		});
		
	});
</script>
</head>
<body>
	<% ArrayList<BoardVO> list = 
			(ArrayList<BoardVO>)request.getAttribute("boardlist"); %>

	<h3>JSTL게시판</h3>
	<div style="padding-top: 30px">
		<div class="col-md-3" style="padding-bottom: 10px">
		    구분:
		    <!-- 1. Submit버튼X - jQuery(자바스크립트 사용x) -->
			<form >
				<select name="category"  id="category">
					<option value="all">전체게시물</option>
					<option value="경조사">경조사</option>
					<option value="사내소식">사내소식</option>
					<option value="게시판">게시판</option>
				</select>
			</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<%for(int i=0; i<list.size(); ++i){
				BoardVO row = list.get(i);
				%>
			
					<tr>
						<td><%= row.getBoard_no() %></td>
						<td><%= row.getTitle() %></td>
						<td><%= row.getId() %></td>
						<td><%= row.getWrite_date() %></td>
					</tr>
			<%}%>
			</tbody>
		</table>
	</div>
	<!-- 2. Submit버튼  -->
	<form action="/erp/board/search.do">
		<select name="tag">
			<option value="id">작성자</option>
			<option value="title">제목</option>
			<option value="content">본문</option>
			<option value="write_date">작성일</option>
		</select> <input type="text" name="search" /> <input type="submit" value="검색">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/erp/board/write.do" style="text-align: right;">글쓰기</a></li>
		</ul>
	</form>

</body>
</html>
