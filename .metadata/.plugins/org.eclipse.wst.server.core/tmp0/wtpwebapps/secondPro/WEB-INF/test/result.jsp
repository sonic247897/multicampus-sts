<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스프링 web MVC 구축하기</h1>
	<hr/>
	<h3>jsp로 코드 출력하기: <%= request.getAttribute("msg") %></h3>
	<h3>EL로 출력하기: ${msg}</h3>
</body>
</html>