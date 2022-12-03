<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#container {text-align: center; width: 920px; height: 600px; margin: 0 auto;}

#container {padding: 30px;}

table {margin-left: 250px; margin-bottom: 20px;}

a {text-decoration-line: none; color: black;}
</style>
</head>
<body>
	<%@ page import="java.sql.*"%>

	<div id="container">
		<h1>RECEIPT</h1>
		<hr style="height: 2px; background-color: black;">
		<%
		Connection con = null;
		Statement stmt = null;
		String driverName = "com.mysql.jdbc.Driver";
		String dburl = "jdbc:mysql://localhost/univdb";

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(dburl, "root", "1214");
			stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("select * from orders;");

			while (result.next()) {
		%>
		<table width="450px">
			<tr>
				<td align="center" width="250px"><%=result.getString(1)%></td>
				<td align="center" width="100px"><%=result.getString(2)%></td>
				<td align="center" width="100px"><%=result.getString(3)%></td>
			</tr>
		</table>
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
		<%
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(dburl, "root", "1214");
			stmt = con.createStatement();
			ResultSet result2 = stmt.executeQuery("select sum(price) from orders;");

			while (result2.next()) {
		%>
		<hr>
		<h3>
			<a href="forpoint.jsp">총액 : <%=result2.getString(1)%></a>
		</h3>
		<%
		}
		result2.close();
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
	</div>
</body>
</html>
