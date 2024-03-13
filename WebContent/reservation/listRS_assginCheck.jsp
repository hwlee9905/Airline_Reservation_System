<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*, java.util.Date,  airport.*"%>
<%
String id5 = (String) session.getAttribute("user_id");
%>
<HTML>
<head>

<link href="style.css" rel="stylesheet">
</head>
<BODY>
	<form action="reservation.jsp" method="POST">
		<br>
		<%
		request.setCharacterEncoding("utf-8");

		ResultSet rs = (ResultSet) session.getAttribute("RS_assgin");
		if (rs == null) {
			out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");
			return;
		}
		%>

		<%
		System.out.print("   >> rs : " + rs + "\n");
		ResultSetMetaData md = rs.getMetaData();
		int count = md.getColumnCount();
		String[] columns = new String[count];
		String[] columnTypes = new String[count];
		for (int i = 0; i < count; i++) {
			columns[i] = md.getColumnLabel(i + 1);
			columnTypes[i] = md.getColumnTypeName(i + 1);
			System.out.print("   >> clms : " + columns[i] + " " + columnTypes[i] + "\n");
		}
		%>

		<table align=center valign=top border="1" cellpadding="5"
			cellspacing="0" bordercolor="#999999">
			<%
			out.print("<tr bgcolor=#CCCCCC>");
			out.print("<th>운행 날짜</th>");
			out.print("<th>항공편 번호</th>");
			out.print("<th>출발 시간</th>");
			out.print("<th>도착 시간</th>");
			out.print("<th>출발지</th>");
			out.print("<th>도착지</th>");
			out.print("<th>항공기 번호</th>");
			out.print("<th>비행 시간</th>");
			out.print("<th>요금</th>");
			out.print("<th>남은 좌석</th>");
			out.print("<th>환불 가능 여부</th>");
			out.print("<th>선택</th>");
			out.print("<th>인원수</th>");
			out.print("</tr>");
			int k = 0;

			while (rs.next()) {
				out.print("<tr>");

				for (int i = 0; i < columns.length; i++) {

					Object obj = rs.getObject(columns[i]);
					// System.out.print("   >> col value : " + (obj) + "\n");
					if (obj == null) // null 객체이면 null을 출력
				out.print("<td> null </td>");
					else if (columnTypes[i].equals("INTEGER") || columnTypes[i].equals("FLOAT") || columnTypes[i].equals("DOUBLE")
					|| columnTypes[i].equals("BIGINT"))
				out.print("<td align=right>" + obj + "</td>");
					else if (columnTypes[i].equals("VARCHAR") && ((String) obj).equals(""))
				out.print("<td> &nbsp; </td>");
					else if (columnTypes[i].equals("VARCHAR"))
				out.print("<td align=left>" + obj + "</td>");
					else
				out.print("<td>" + obj + "</td>");
				}
				out.print("<td> <input type=checkbox name=rows value=" + k + "></td>");
				out.print("<td> <select name=people" + k
				+ " > <option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option><option value=\"6\">6</option><option value=\"7\">7</option><option value=\"8\">8</option><option value=\"9\">9</option><option value=\"10\">10</option></select></td>");
				out.print("</tr>");
				k++;
			}
			%>
			<table align=right border="0" cellpadding="0" cellspacing="0">
				<tr>
					<p align=center>
						<input type="submit" value="예약">
					</form>
				</tr>
</BODY>
<footer>
	<hr>
	<div id="foot">2022 @hanshin university / airplane</div>
	<div id="link">
		<a href="http://www.naver.com/" target="_blank"> <img
			src="../image/naver.png" height="32">
		</a> <a href="http://www.google.com/" target="_blank"> <img
			src="../image/google.png" height="32">
		</a> <a href="http://www.daum.net/" target="_blank"> <img
			src="../image/daum.png" height="32">
		</a>
	</div>
	</hr>
</footer>
</HTML>
