<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*, airport.*"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>�°��� �װ��� ��ȸ</TITLE>
</HEAD>
<body>
	<%
	request.setCharacterEncoding("euc-kr");

	DB.loadConnect();
	ResultSet rs = DB.assign();

	// ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
	request.setAttribute("title", "(�°���)�װ�����ȸ");
	session.setAttribute("RS_assgin", rs);

	// ���ο� ������ ȣ���Ͽ� �����ϱ�
	request.getRequestDispatcher("listRS_assginCheck.jsp").forward(request, response);
	%>
</body>
</html>