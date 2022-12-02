<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#container {text-align: center; background-color: white; width: 1000px; height: 600px; margin: 0 auto;}

#header {width: 1000px; margin: 0 auto; padding: 0;}

#header ul {width: 1000px; height: 50px; margin: 0 auto; padding-left: 0;}

#header ul li {width: 25%; height: 50px; color: black; list-style: none; float: left; line-height: 50px; font-size: 17px;}

#forms input {width: 300px; height: 40px; margin-bottom: 10px;}

#but input {width: 150px; height: 40px; margin-bottom: 10px;}

a {text-decoration: none; color: black;}
</style>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<div id="container">
		<img src="images/logos2.jpg" width="600px" height="150px"> <br>
		<hr>
		<div id="header">
			<ul>
				<li><a href="movie.html">영화</a></li>
				<li>극장</li>
				<li><a href="reservation.html">예매</a></li>
				<li><img src="images/user.png" width="17px" height="17px"></li>
			</ul>
		</div>
		<form method="post">
			<br>
			<h1>LOGIN</h1>
			<div id="forms">
				<input type="text" name="ids" placeholder="ID"><br> 
				<input type="text" name="pwds" placeholder="PASSWORD"><br>
			</div>
			<%
			String idl = request.getParameter("ids");
			String pwdl = request.getParameter("pwds");
			%>
			<%
			Connection con = null;
			PreparedStatement pstmt = null;
			String driverName = "com.mysql.jdbc.Driver";
			String dburl = "jdbc:mysql://localhost:3306/univdb";
			ResultSet rs = null;

			try {
				Class.forName(driverName);
				con = DriverManager.getConnection(dburl, "root", "1214");
				String sql = "select passwd from info where passwd=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pwdl);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					String dbpwd = rs.getString(1);

					if (pwdl.equals(dbpwd)) {
				response.sendRedirect("http://localhost:8080/forjsp/movie.html");
					} else {
				System.out.println("");
					}

				}
			%>
			<%
			} catch (Exception e) {
			out.println("오류");
			out.println(e.toString());
			e.printStackTrace();
			} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
			}
			%>
			<div id="but">
				<input type="submit" value="LOGIN"> <input type="button"
					value="회원가입" onClick="location.href='join.jsp'">
			</div>
		</form>
	</div>
</body>
</html>
