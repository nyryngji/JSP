<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#container {
	text-align: center;
	width: 600px;
	height: 600px;
	margin: 0 auto;
}

#memo {
	text-align: center;
	background-color: grey;
	color: white;
}
</style>
</head>
<body>
	<jsp:useBean id="s" class="forjsp.bean" scope="page" />
	<jsp:setProperty name="s" property="*" />
	<%
	request.setCharacterEncoding("euc-kr");
	%>

	<div id="container">
		<h1 style="padding-bottom: 3px;">Mobile Ticket</h1>
		<h4 style="margin-bottom: 3px;">T80286-074-5968</h4>
		<div id="memo">
			<hr style="height: 2px; background-color: black; margin: 0%;">
			<p>
				영화 상영시작시간 15분전까지 취소가 가능하며<br> 캡쳐화면은 입장이 제한될 수 있습니다.<br>
				------------------------------------------------
			</p>
		</div>
		<h3><jsp:getProperty name="s" property="movie" /></h3>
		<h4 style="color: grey;"><jsp:getProperty name="s"
				property="place" /></h4>
		<h1 style="font-size: 45px; margin-bottom: 15px;"><jsp:getProperty
				name="s" property="time" />~
		</h1>
		<img src="images/qrcode.png" width="130px" height="130px">
		<hr>
		<%
		String seat = request.getParameter("sheet");
		%>
		<h4>
			seat
			<%=seat%></h4>
		<h4><jsp:getProperty name="s" property="day" />
			예매 완료
		</h4>
		<br>
	</div>

</body>
</html>
