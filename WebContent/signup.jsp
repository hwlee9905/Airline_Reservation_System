<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.* ,java.time.LocalDate" %>

<%  
    
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address = address1 + address2;
	String passport = request.getParameter("passport");
	LocalDate regdate = LocalDate.now();
    String tel = request.getParameter("tel"); 
	DB.loadConnect();
	ResultSet rs = DB.insertPassenger(id, pw, name, address, passport, regdate.toString(), tel);

	out.println("<script>");
	out.println(" alert('ȸ�� ������ �Ǿ����ϴ�! \\n �α��� �������� �̵��մϴ�.') "); 
	out.println(" location.href='login.html' "); 
	out.println("</script>");

	


%>         
