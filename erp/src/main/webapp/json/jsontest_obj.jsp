<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 <title>인사관리시스템</title>
  <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		//자바스크립트 객체 선언(json객체 아님 => jsontest02.jsp)
		var person = {
				/* 일반 변수 */
				name:"김서연",
				age:"25",
				/* 배열 */
				like:["자바","서블릿","하둡"],
				/* Object */
				addr:{
					zipcode:"11-22",
					addr1:"인천시",
					addr2:"남구"
				},
				/* Object 배열 */
				history:[
					/* 객체1 */
				    { 
				    	subject:"java",
				    	month:"11"
				    },
				    /* 객체2 */
				    {
				    	subject:"servlet",
				    	month:"1"
				    },
				    {
				    	subject:"spring",
				    	month:"1"
				    },
				    {
				    	subject:"hadoop",
				    	month:"2"
				    }
				]				
		}

		document.write("<h3>"+person.name+"</h3>");
		document.write("<h3>"+person.age+"</h3>");
		document.write("<h3>"+person.addr.addr1+"</h3>");
		document.write("<h3>"+person.like[0]+"</h3>");
		document.write("<h3>"+person.history[0].subject+"</h3>");
		
	</script>
</body>
</html>











