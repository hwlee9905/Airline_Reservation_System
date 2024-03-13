<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*, airport.*"%>
<%@ page errorPage="/error/erroepageSelect.jsp"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>관리자 삭제</TITLE>
</HEAD>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	ResultSet rs = DB.administrator_Check_pw();
	if (rs == null) {
		out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");
		return;
	}
	%>

	<%
	int rows = Integer.parseInt(request.getParameter("rows"));
	String id = "";

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
		Object obj = rs.getObject(columns[0]);

		if (k == rows) {
			id = String.valueOf(obj);
			break;
		}

		k++;
	}

	DB.loadConnect();
	int a = DB.administrator_delete(id);
	if (a == 0) {
		out.print("<script> alert('삭제를 실패했습니다');window.history.go(-1);</script>");
	} else {
		out.print(
		"<script> alert('삭제를 성공했습니다');window.location.href = 'http://localhost:8080/DBairport/administrator/administrator_check.jsp';</script>");
	}
	%>
</body>
</html>