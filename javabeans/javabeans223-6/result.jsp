<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>계산 결과</h1>
	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="x" class="javabeans.scorebean" scope="page"/>
	
	<jsp:setProperty name="x" property="*"/>
	
	<jsp:getProperty name="x" property="one" />
	<jsp:getProperty name="x" property="buho" />
	<jsp:getProperty name="x" property="two" />
	<jsp:getProperty name="x" property="qu" />
	<jsp:getProperty name="x" property="result" />
</body>
</html>
