<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*, airport.*"%>
<%@ page errorPage="/error/erroepageSelect.jsp"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>항공편 삭제</TITLE>
</HEAD>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	ResultSet rs = DB.flight_Check();
	if (rs == null) {
		out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");
		return;
	}
	%>

	<%
	int rows = Integer.parseInt(request.getParameter("rows"));

	String date = ""; //= (String) request.getParameter("date");
	int flightnum = 0;// =Integer.parseInt(request.getParameter("flightnum"));
	String stime = "";// = (String) request.getParameter("stime");
	String atime = "";// = (String) request.getParameter("atime");

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
	int k = 0;
	while (rs.next()) {
		for (int i = 0; i < 4; i++) {

			Object obj = rs.getObject(columns[i]);

			if (i == 0 && k == rows) {
		date = String.valueOf(obj) + "";
		System.out.print(date + "\n");
			}
			if (i == 1 && k == rows) {
		flightnum = Integer.parseInt(String.valueOf(obj));
		System.out.print(flightnum + "\n");
			}
			if (i == 2 && k == rows) {
		stime = String.valueOf(obj);
		System.out.print(stime + "\n");
			}
			if (i == 3 && k == rows) {
		atime = String.valueOf(obj);
		out.print(atime + "\n");
		break;

			}

		}
		k++;
	}

	DB.loadConnect();
	int a = DB.flight_delete(date, flightnum, stime, atime);
	if (a == 0) {
		out.println("<script language=javascript> alert('삭제를 실패했습니다'); window.history.go(-1); </script>");
	} else {
		out.print(
		"<script language=javascript> alert('삭제를 성공했습니다') ; window.location.href = 'http://localhost:8080/DBairport/flight/flightCheck.jsp'; </script>");
	}
	%>
</body>
</html>