<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*, airport.*"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>�װ�����ȸ</TITLE>
</HEAD>
<body>
	<%
	request.setCharacterEncoding("euc-kr");

	DB.loadConnect();
	ResultSet rs = DB.flight_Check();

	// ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
	request.setAttribute("title", "�װ�����ȸ");
	request.setAttribute("RS", rs);

	// ���ο� ������ ȣ���Ͽ� �����ϱ�
	request.getRequestDispatcher("listRS_flight.jsp").forward(request, response);
	%>

</body>
</html>
