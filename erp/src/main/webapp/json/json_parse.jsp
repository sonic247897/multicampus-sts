<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
 <title>인사관리시스템</title>
  <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>부서정보 출력하기</h1>
	<hr/>
	<div id="dept_eval"></div>
	<div id="dept_parser"></div>
	<script type="text/javascript">
		var deptlist = '{"dept":'+
			'[{"code":"001","name":"정보시스템팀","loc":"4층",'+
			 '"tel":"02-770-1111"},'+
			 '{"code":"002","name":"시스템지원팀","loc":"5층",'+
			 '"tel":"02-770-2222"},'+
			 '{"code":"003","name":"기업영업팀","loc":"6층",'+
			 '"tel":"02-770-3333"},'+
			 '{"code":"004","name":"전산실","loc":"7층",'+
			 '"tel":"02-770-4444"}]}';
		
	</script>
</body>
</html>