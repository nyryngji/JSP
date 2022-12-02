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

a {text-decoration: none; color: black;}
</style>
</head>
<body>

	<%@ page import="java.sql.*, javax.sql.*,javax.naming.*"%>
	<div id="container">
		<br>
		<h1>JOIN MEMBERSHIP</h1>
		<hr>

		<form method="post">
			<br>
			<div id="forms">
				<input type="text" name="newid" placeholder="ID"><br> 
				<input type="password" name="newpwd" placeholder="PASSWORD"><br>
				<input type="submit" value="가입완료">
			</div>
			<%
			String newid = request.getParameter("newid");
			String newpwd = request.getParameter("newpwd");
			%>
			<%
			Connection con = null;
			PreparedStatement pstmt = null;
			Statement stmt = null;
			StringBuffer sql = new StringBuffer("insert into info values(?,?);");

			try {
				Context initCtx = new InitialContext();
				Context env = (Context) initCtx.lookup("java:comp/env/");
				DataSource ds = (DataSource) env.lookup("jdbc/mysql");
				con = ds.getConnection();

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, newid);
				pstmt.setString(2, newpwd);

				int cnt = pstmt.executeUpdate();
				if (cnt == 1)
					out.println("회원가입 완료");
				else
					out.println("죄송합니다. 오류가 발생하였습니다.");
			%>
			<%
			} catch (Exception e) {
			out.println("");
			} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
			}
			%>
		</form>
	</div>
</body>
</html>
