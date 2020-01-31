<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WAS에서 제공하는 Connection Pool 이용하기</h1>
	<hr/>
	<h2>WAS마다 각각의 고유한 자원으로 Connection Pool을 만들고 관리한다.
		자바에서 이를 사용하기 위해 표준API인 javax.sql.DataSource를 이용
		1. WAS에 등록된 자원을 lookup한다.
			- InitialContext의 lookup메소드를 이용
		2. WAS에서 lookup한 DataSource로부터 커넥션을 가져온다.
			- DriverManager와 동일하게 getConnection을 이용
	</h2>
	<%
		// 1. WAS에 등록된 자원을 찾아올 수 있는 기능을 제공하는 객체를 생성
		InitialContext context = new InitialContext();
	
		// 2. InitialContext객체를 이용해서 lookup (getBean과 같음)
		//	- context.xml에 설정한 이름을 가져옴 (Object로 리턴하므로 캐스팅)
		// java:comp/env/ 는 c:\처럼 경로 찾기 시작하는 부분
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/myspring");
		Connection con = ds.getConnection();
	%>
	<h3><%= con %></h3>
	
</body>
</html>