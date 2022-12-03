<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#container {text-align: center; width: 920px; height: 700px; margin: 0 auto;}
 
#header {width: 1000px; margin: 0 auto; padding: 0; text-align: center;}

#header ul {width: 1000px; height: 50px; margin: 0 auto; padding-left: 0;}

#header ul li {color: black; list-style: none; float: left; font-size: 17px; padding: 4px;}

#header2 {width: 1000px; margin: 0 auto;}

#header2 input {width: 180px; height: 20px;}

#reservation {padding-left: 20px; padding-right: 20px; float: left; padding-bottom: 20px;}

#sub input {text-align: center; width: 200px; height: 30px; margin-right: 70px;}
</style>
</head>
<body>
	<%@ page import="java.sql.*, javax.sql.*,javax.naming.*"%>

	<div id="container">
		<h1>MENU</h1>
		<hr style="height: 2px; background-color: black;">
		<form method="post">
			<div id="header">
				<ul>
					<li><img src="image/스크린샷(120).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(121).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(123).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(122).png" width="220px" height="220px"></li>
				</ul>
			</div>
			<br>
			<div id="header2">
				<div id="forms">
					<div id="reservation">
						<input type="number" name="pasta1">
					</div>
					<div id="reservation">
						<input type="number" name="pasta2">
					</div>
					<div id="reservation">
						<input type="number" name="pasta3">
					</div>
					<div id="reservation">
						<input type="number" name="pasta4">
					</div>
				</div>

			</div>
			<div id="header">
				<ul>
					<li><img src="image/스크린샷(126).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(125).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(127).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(124).png" width="220px" height="220px"></li>
				</ul>
			</div>
			<div id="header2">
				<div id="forms">
					<div id="reservation">
						<input type="number" name="pasta5">
					</div>
					<div id="reservation">
						<input type="number" name="pasta6">
					</div>
					<div id="reservation">
						<input type="number" name="pasta7">
					</div>
					<div id="reservation">
						<input type="number" name="pasta8">
					</div>
				</div>

			</div>
			<div id="header">
				<ul>
					<li><img src="image/스크린샷(130).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(135).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(136).png" width="220px" height="220px"></li>
					<li><img src="image/스크린샷(137).png" width="220px" height="220px"></li>
				</ul>
			</div>
			<div id="header2">

				<div id="forms">
					<div id="reservation">
						<input type="number" name="ade1">
					</div>
					<div id="reservation">
						<input type="number" name="ade2">
					</div>
					<div id="reservation">
						<input type="number" name="ade3">
					</div>
					<div id="reservation">
						<input type="number" name="ade4">
					</div>

				</div>
				<div id="sub">
					<input type="submit" value="장바구니에 담기"> <input type="button"
						onclick="location.href='receipt.jsp' " value="영수증 확인">
				</div>
			</div>

			<%
			String pasta1 = request.getParameter("pasta1");
			String pasta2 = request.getParameter("pasta2");
			String pasta3 = request.getParameter("pasta3");
			String pasta4 = request.getParameter("pasta4");
			String pasta5 = request.getParameter("pasta5");
			String pasta6 = request.getParameter("pasta6");
			String pasta7 = request.getParameter("pasta7");
			String pasta8 = request.getParameter("pasta8");
			String ade1 = request.getParameter("ade1");
			String ade2 = request.getParameter("ade2");
			String ade3 = request.getParameter("ade3");
			String ade4 = request.getParameter("ade4");

			String[] menus = { "로제 베이컨 파스타", "목살 스테이크 토마토 파스타", "베이컨 까르보나라", "게살 오이스터 파스타", "해산물 올리브 파스타", "빠네 크림 파스타",
					"해산물 크림 파스타", "빠네 로제 파스타", "딸기 에이드", "라임 민트 에이드", "자몽 에이드", "제주 한라봉 에이드" };
			int[] price = { 13900, 15900, 13900, 15900, 13900, 15900, 13900, 15900, 7000, 7000, 7000, 7000 };
			String[] cnt = { pasta1, pasta2, pasta3, pasta4, pasta5, pasta6, pasta7, pasta8, ade1, ade2, ade3, ade4 };
			%>
			<%
			Connection con = null;
			PreparedStatement pstmt = null;
			Statement stmt = null;
			StringBuffer sql = new StringBuffer("insert into orders values (?,?,?)");

			try {
				InitialContext ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
				con = ds.getConnection();

				pstmt = con.prepareStatement(sql.toString());

				for (int i = 0; i <= 11; i++) {

					pstmt.setString(1, menus[i]);
					pstmt.setString(2, cnt[i]);
					pstmt.setInt(3, price[i]);
					pstmt.addBatch();

				}
				pstmt.executeBatch();

				int rowCount = pstmt.executeUpdate();
				if (rowCount >= 1) {
					out.println("성공!");
				}

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
