<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd1");
		String userName = request.getParameter("userName");
		String age = request.getParameter("age");
	%>
	
	<div>아이디 : <%= userId %></div>
	<div>이름 : <%= userName %></div>
	
</body>
</html>

