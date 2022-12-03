<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#container {text-align: center; width: 920px; height: 600px; margin: 0 auto;}

#start {padding-top: 50px;}

#phone input {width: 200px; height: 30px; margin-bottom: 10px;}
</style>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<div id="container">
		<div id="start">
			<img src="image/point.png" width="100px" height="100px">
		</div>
		<h2>주문내역이 주방으로 전송되었습니다</h2>
		<h3>핸드폰 번호를 입력해주시면 전체금액의 1%를 포인트로 적립해드립니다.</h3>
		<%
		Connection con = null;
		Statement stmt = null;
		String driverName = "com.mysql.jdbc.Driver";
		String dburl = "jdbc:mysql://localhost/univdb";

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(dburl, "root", "1214");
			stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("select sum(price)/100 from orders;");

			while (result.next()) {
		%>
		<h2 style="color: blue;">
			예상 적립 포인트
			<%=result.getInt(1)%>원
		</h2>
		<%
		}
		result.close();
		} catch (Exception e) {
		out.println(e.toString());
		e.printStackTrace();
		} finally {
		if (stmt != null)
		stmt.close();
		if (con != null)
		con.close();
		}
		%>
		<form id="phone" action="start.html">
			<input type="tel" name="pnum"> <br> <input type="submit"
				onclick="alert('적립이 완료되었습니다.이용해주셔서 감사합니다.')" value="입력완료">
		</form>
	</div>
</body>
</html>
